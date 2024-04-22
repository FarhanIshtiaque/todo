import 'package:flutter/material.dart';
import 'package:todo/core/constants/app_colors.dart';


class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    Key? key,
    required this.onPressed,
    required this.buttonNameWidget,
    this.large = false,
    this.color = AppColors.primary,
  }) : super(key: key);
  final VoidCallback? onPressed;

  final Widget buttonNameWidget;
  final bool large;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      disabledColor: AppColors.gray200,
      color: color,
      splashColor: AppColors.primary200,
      elevation: 0,
      height: large ? 56 : 48,
      minWidth: double.infinity,
      onPressed: onPressed,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: buttonNameWidget,
    );
  }
}
