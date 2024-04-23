import 'package:flutter/material.dart';
import 'package:todo/core/constants/app_colors.dart';
import 'package:todo/core/constants/app_values.dart';
import 'package:todo/core/constants/text_styles.dart';

class PendingTask extends StatelessWidget {
  PendingTask({super.key});

  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppValues.padding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Pending Task',
                style: AppTextStyle.body1Bold,
              ),
              SizedBox(
                height: 16,
              ),
              ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return TaskCard(isChecked: isChecked);
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      height: 16,
                    );
                  },
                  itemCount: 5)
            ],
          ),
        ),
      ),
    );
  }
}

class TaskCard extends StatelessWidget {
  const TaskCard({
    super.key,
    required this.isChecked,
  });

  final bool isChecked;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 11),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'This is the first task lol',
                  style: AppTextStyle.body2Medium,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(
                  height: 2,
                ),
                Text(
                  'Mar 2, 2023',
                  style:
                      AppTextStyle.caption2.copyWith(color: AppColors.natural4),
                )
              ],
            ),
            Checkbox(
              side: const BorderSide(color: AppColors.natural5, width: 2),
              checkColor: Colors.white,
              fillColor: MaterialStateProperty.resolveWith(getColor),
              value: isChecked,
              onChanged: (bool? value) {
                // setState(() {
                //   isChecked = value!;
                // });
              },
            )
          ],
        ),
      ),
    );
  }
}

Color getColor(Set<MaterialState> states) {
  const Set<MaterialState> interactiveStates = <MaterialState>{
    MaterialState.pressed,
    MaterialState.hovered,
    MaterialState.focused,
  };
  if (states.any(interactiveStates.contains)) {
    return Colors.blue;
  }
  return Colors.white;
}
