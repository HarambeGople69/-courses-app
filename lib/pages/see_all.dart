import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myapp/models/course_model.dart';
import 'package:myapp/pages/viewPdf.dart';

class SeeAll extends StatefulWidget {
  const SeeAll({Key? key}) : super(key: key);

  @override
  _SeeAllState createState() => _SeeAllState();
}

class _SeeAllState extends State<SeeAll> {
  List<CourseModel> courseList = [
    CourseModel(
      title: "C",
      image: "images/c.png",
      course: "17 Course",
      imageAddress: "images/Resume.pdf",
    ),
    CourseModel(
      title: "C++",
      image: "images/c++.png",
      course: "7 Course",
      imageAddress: "images/c++.pdf",
    ),
    CourseModel(
      title: "Flutter",
      image: "images/flutter.png",
      course: "8 Course",
      imageAddress: "images/flutter.pdf",
    ),
    CourseModel(
      title: "Java",
      image: "images/java.png",
      course: "11 Course",
      imageAddress: "images/java.pdf",
    ),
    CourseModel(
      title: "Python",
      image: "images/python.png",
      course: "15 Course",
      imageAddress: "images/Resume.pdf",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "All categories",
            style: TextStyle(
              fontSize: ScreenUtil().setSp(
                30,
              ),
            ),
          ),
        ),
        body: ListView.separated(
            itemCount: courseList.length,
            separatorBuilder: (context, index) => Divider(),
            itemBuilder: (context, index) {
              return ListTile(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return ViewPdf(
                      courseModel: courseList[index],
                    );
                  }));
                },
                leading: Image.asset(
                  courseList[index].image,
                  height: ScreenUtil().setSp(80),
                  width: ScreenUtil().setSp(80),
                  fit: BoxFit.cover,
                ),
                title: Text(
                  courseList[index].title,
                  style: TextStyle(
                    fontSize: ScreenUtil().setSp(20),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                subtitle: Text(
                  courseList[index].course,
                  style: TextStyle(
                      fontSize: ScreenUtil().setSp(15),
                      // fontWeight: FontWeight.w200,
                      color: Colors.grey),
                ),
              );
            }));
  }
}
