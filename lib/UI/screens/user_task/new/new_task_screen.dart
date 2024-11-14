import 'package:flutter/material.dart';
import 'package:task_manager_get_x/UI/screens/user_task/add_new/add_new_screen.dart';
import 'package:task_manager_get_x/UI/screens/user_task/new/view_model/new_task_controller.dart';
import 'package:task_manager_get_x/UI/screens/user_task/new/widgets/summary_card.dart';
import 'package:task_manager_get_x/UI/task/task_card_list.dart';
import 'package:task_manager_get_x/common/utils/app_padding.dart';
import 'package:get/get.dart';
import 'package:task_manager_get_x/common/widgets/snack_massage.dart';
import 'package:task_manager_get_x/common/widgets/tm_progress_indicator.dart';

class NewTaskScreen extends StatefulWidget {
  const NewTaskScreen({super.key});

  @override
  State<NewTaskScreen> createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {
  final NewTaskController _newTaskController = Get.find<NewTaskController>();

  @override
  void initState() {
    super.initState();
    _getNewTask();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: RefreshIndicator(
        onRefresh: () async {
          _getNewTask();
        },
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(
              AppPadding.defaultPadding,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: SummaryCard(),
                ),
                const SizedBox(height: 18),
                Expanded(
                  child: GetBuilder<NewTaskController>(
                    builder: (controller) {
                      return Visibility(
                        visible: !controller.inProgress,
                        replacement: const TMProgressIndicator(),
                        child: ListView.separated(
                          itemCount: controller.taskList.length,
                          itemBuilder: (context, index) {
                            return TaskCardList(
                              taskModel: controller.taskList[index],
                              onRefresh: _getNewTask,
                            );
                          },
                          separatorBuilder: (context, index) {
                            return const SizedBox(
                              height: 16,
                            );
                          },
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: _buildFloatingActionButton(),
    );
  }

  FloatingActionButton _buildFloatingActionButton() {
    return FloatingActionButton(
      onPressed: () async {
        final bool result = await Get.toNamed(AddNewScreen.name);
        if (result == true) {
          _getNewTask();
        }
      },
      elevation: 0,
      backgroundColor: Colors.grey,
      child: const Icon(Icons.add),
    );
  }

  Future<void> _getNewTask() async {
    final bool result = await _newTaskController.getNewTask();
    if (result == false) {
      snackMassage(true, _newTaskController.errorMessage!);
    }
  }
}
