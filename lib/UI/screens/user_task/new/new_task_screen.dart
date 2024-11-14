import 'package:flutter/material.dart';
import 'package:task_manager_get_x/UI/screens/user_task/new/widgets/summary_card.dart';
import 'package:task_manager_get_x/UI/widgets/task_card.dart';
import 'package:task_manager_get_x/common/utils/app_padding.dart';

class NewTaskScreen extends StatelessWidget {
  const NewTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(
          AppPadding.defaultPadding,
        ),
        child: Column(
          children: [
            const SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SummaryCard(),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.separated(
                itemCount: 3,
                itemBuilder: (context, index) {
                  return const TaskCard();
                },
                separatorBuilder: (context, index) {
                  return const Divider(
                    height: 16,
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
