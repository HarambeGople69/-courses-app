import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myapp/models/course_model.dart';
import 'package:myapp/pages/see_all.dart';
import 'package:myapp/pages/viewPdf.dart';
import 'package:myapp/widgets/our_sized_box.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
    // CourseModel(
    //   title: "C",
    //   image: "images/c.png",
    //   course: "17 Course",
    //   imageAddress: "images/c.pdf",
    // ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        leading: Icon(
          Icons.menu,
          size: ScreenUtil().setSp(
            30,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          CircleAvatar(
            backgroundImage: AssetImage(
              "images/face.jpg",
            ),
            radius: ScreenUtil().setSp(30),
          )
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(
              horizontal: ScreenUtil().setSp(20),
              vertical: ScreenUtil().setSp(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Hey Utsav",
                  style: TextStyle(
                    fontSize: ScreenUtil().setSp(35),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                OurSizedBox(),
                Text(
                  "Find a course you want to learn",
                  style: TextStyle(
                      fontSize: ScreenUtil().setSp(20),
                      fontWeight: FontWeight.w400,
                      color: Colors.grey[700]),
                ),
                OurSizedBox(),
                ClipRRect(
                  borderRadius: BorderRadius.circular(
                    ScreenUtil().setSp(
                      20,
                    ),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      fillColor: Colors.grey[200],
                      border: InputBorder.none,
                      filled: true,
                      labelStyle: TextStyle(
                        fontSize: ScreenUtil().setSp(
                          20,
                        ),
                      ),
                      labelText: "Search for anything",
                      prefixIcon: Icon(
                        Icons.search,
                        size: ScreenUtil().setSp(
                          30,
                        ),
                      ),
                    ),
                  ),
                ),
                OurSizedBox(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Categories",
                      style: TextStyle(
                        fontSize: ScreenUtil().setSp(25),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return SeeAll();
                        }));
                      },
                      child: Text(
                        "See all",
                        style: TextStyle(
                            fontSize: ScreenUtil().setSp(20),
                            fontWeight: FontWeight.w500,
                            color: Colors.purple),
                      ),
                    ),
                  ],
                ),
                OurSizedBox(),
                Container(
                  height: ScreenUtil().setSp(450),
                  child: GridView.builder(
                    itemCount: courseList.length,
                    // shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.85,
                      crossAxisSpacing: ScreenUtil().setSp(
                        5,
                      ),
                      mainAxisSpacing: ScreenUtil().setSp(
                        5,
                      ),
                    ),
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return ViewPdf(
                              courseModel: courseList[index],
                            );
                          }));
                        },
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(
                              ScreenUtil().setSp(20),
                            ),
                            child: Container(
                              color: Color(0xffFFE6AD),
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  Positioned(
                                    right: 0,
                                    top: 0,
                                    child: Image.asset(
                                      "${courseList[index].image}",
                                      height: ScreenUtil().setSp(100),
                                      width: ScreenUtil().setSp(100),
                                    ),
                                  ),
                                  Positioned(
                                      // left: 0,
                                      bottom: 0,
                                      child: Column(
                                        // crossAxisAlignment:
                                        //     CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "${courseList[index].title}",
                                            style: TextStyle(
                                                fontSize:
                                                    ScreenUtil().setSp(20)),
                                          ),
                                          Text(
                                            "${courseList[index].course}",
                                            style: TextStyle(
                                                fontSize:
                                                    ScreenUtil().setSp(20)),
                                          ),
                                        ],
                                      ))
                                ],
                              ),
                            )),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
