import 'package:flutter/material.dart';
import 'package:task_manager_get_x/common/widgets/neumorphism_box.dart';

class SummaryCard extends StatelessWidget {
  const SummaryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return NeumorphismBox(
      child: Column(
        children: [
          Text(
            '5',
            style: TextStyle(
                fontSize: 24,
                color: Colors.grey[900],
                fontWeight: FontWeight.w600),
          ),
          Text(
            'Task Name',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }
}
