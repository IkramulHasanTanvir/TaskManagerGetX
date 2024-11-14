import 'package:flutter/material.dart';
import 'package:task_manager_get_x/common/widgets/neumorphism_box.dart';

class TaskCard extends StatefulWidget {
  const TaskCard({super.key});

  @override
  State<TaskCard> createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
  @override
  Widget build(BuildContext context) {
    return NeumorphismBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Task title',
            style: TextStyle(fontSize: 24),
          ),
          const SizedBox(height: 6),
          const Text('Task Descriptions'),
          const SizedBox(height: 6),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Chip(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                label: const Text('New'),
                backgroundColor: Colors.grey[300],
                side: const BorderSide(color: Colors.green),
              ),
              Wrap(
                children: [
                  InkWell(
                    onTap: () {},
                    child: const Icon(
                      Icons.edit_attributes_outlined,
                      color: Colors.blue,
                    ),
                  ),
                  const SizedBox(width: 8),
                  InkWell(
                    onTap: () {},
                    child: const Icon(
                      Icons.delete_outline,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
