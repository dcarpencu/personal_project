import 'package:flutter/material.dart';
import 'package:movie_app/src/models/app_course.dart';

class CourseCard extends StatelessWidget {
  CourseCard({Key? key, required this.course})
      : super(key: key);

  final Course course;
  final Map<String, Color?> splashColor = <String, Color?>{
    'cat': Colors.pink[100],
    'dog': Colors.blue[100],
    'other': Colors.grey[100]
  };

  @override
  Widget build(BuildContext context) {
    return Card(
        child: InkWell(
          onTap: () {},
          splashColor: splashColor[course.type],
          child: Row(
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding:
                  const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: Text(course.name),
                ),
              ),
              IconButton(onPressed: () {}, icon: const Icon(Icons.star))
            ],
          ),
        ),
    );
  }
}
