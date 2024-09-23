import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart';
import 'package:todolati2024/models/task_model.dart';
import 'package:todolati2024/screens/task_details_screen.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({super.key, required this.taskModel, required this.onTap});
  final TaskModel taskModel;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            CupertinoPageRoute(
                builder: (context) => TaskDetailsScreen(
                      taskModel: taskModel,
                    )));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.blue.withOpacity(0.1)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        taskModel.title,
                        style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.blueGrey),
                      ),
                      if (taskModel.subTitle != null)
                        Text(
                          taskModel.subTitle!,
                          style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.blueGrey),
                        ),
                      Text(
                        taskModel.isCompleted
                            ? DateFormat("EEE-dd-MMM-yyyy")
                                .format(DateTime.parse(taskModel.createdAt))
                                .replaceAll("-", ", ")
                            : format(DateTime.parse(taskModel.createdAt)),
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: Colors.blueGrey.withOpacity(0.5)),
                      )
                    ],
                  ),
                  Checkbox(
                    value: taskModel.isCompleted,
                    onChanged: (check) {
                      onTap();
                    },
                  ),
                ],
              ),
            )),
      ),
    );
  }
}