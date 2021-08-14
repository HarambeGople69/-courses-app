import 'package:flutter/material.dart';
import 'package:myapp/models/course_model.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class ViewPdf extends StatelessWidget {
  final CourseModel courseModel;
  const ViewPdf({
    Key? key,
    required this.courseModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(courseModel.title),
      ),
      body: SfPdfViewer.asset(
        courseModel.imageAddress,
      ),
    );
  }
}
