import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:task_manager_get_x/UI/task/models/task_model.dart';
import 'package:task_manager_get_x/UI/task/view_model/task_delete_controller.dart';
import 'package:task_manager_get_x/UI/task/widgets/task_card.dart';
import 'package:task_manager_get_x/UI/task/widgets/task_update.dart';
import 'package:task_manager_get_x/common/widgets/snack_massage.dart';

class TaskCardList extends StatefulWidget {
  const TaskCardList(
      {super.key, required this.taskModel, required this.onRefresh});

  final TaskModel taskModel;
  final VoidCallback onRefresh;

  @override
  State<TaskCardList> createState() => _TaskCardListState();
}

class _TaskCardListState extends State<TaskCardList> {
  final TaskDeleteController _taskDeleteController =
      Get.find<TaskDeleteController>();

  @override
  Widget build(BuildContext context) {
    final String date = DateFormat('EEE, M/ d/ y').format(
      DateTime.parse(
        widget.taskModel.createdDate!,
      ),
    );
    return TaskCard(
      title: widget.taskModel.title ?? '',
      subTitle: widget.taskModel.description ?? '',
      date: date,
      status: widget.taskModel.status ?? '',
      child: _buildButtonBar(),
    );
  }

  Widget _buildButtonBar() {
    return Wrap(
      children: [
        TaskUpdate(
          taskModel: widget.taskModel,
          onRefresh: widget.onRefresh,
        ),
        const SizedBox(width: 8),
        InkWell(
          onTap: _deleteTask,
          child: const Icon(
            Icons.delete_outline,
            color: Colors.red,
          ),
        ),
      ],
    );
  }

  Future<void> _deleteTask() async {
    final bool result = await _taskDeleteController.taskDelete(
      widget.taskModel.sId!,
    );
    if (result) {
      widget.onRefresh();
    } else {
      snackMassage(true, _taskDeleteController.errorMessage!);
    }
  }
}
