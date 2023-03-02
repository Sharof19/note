import 'package:flutter/material.dart';
import 'package:notes_app/ui/theme/app_colors.dart';

abstract class AppStyle {
  AppStyle._();

  static const fontStyle = TextStyle(
    color: AppColors.blackColor,
    fontSize: 22,
    fontWeight: FontWeight.w400,
  );
}

