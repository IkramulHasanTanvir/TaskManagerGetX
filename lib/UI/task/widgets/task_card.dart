import 'package:flutter/material.dart';
import 'package:task_manager_get_x/common/widgets/neumorphism_box.dart';

class TaskCard extends StatelessWidget {
  const TaskCard(
      {super.key,
      required this.title,
      required this.subTitle,
      required this.date,
      required this.status,
      required this.child});

  final String title;
  final String subTitle;
  final String date;
  final String status;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return NeumorphismBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(fontSize: 20),
              ),
              Text(
                status,
                style: const TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          Text(subTitle),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                date,
                style: const TextStyle(fontSize: 10),
              ),
              child,
            ],
          ),
        ],
      ),
    );
  }
}
