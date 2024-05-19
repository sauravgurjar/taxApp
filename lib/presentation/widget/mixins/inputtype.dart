import 'package:flutter/material.dart';

import '../../../module/utils /methods/app_colors.dart';
import '../../../module/utils /typograpy/typograpy.dart';


mixin InputFieldStyle {
  TextStyle inputFieldTextStyle({
    required controller,
    required isReadOnly,
    required hasError,
    required hasSuccess,
    bool showHelper = false,
  }) {
    return getHeadingStyle.copyWith(
      color: isReadOnly && controller.text != ''
          ? Colors.white
          : hasError
          ? alertError100
          : hasSuccess
          ? alertSuccess100
          : showHelper
          ? Colors.white
          : Colors.white,
    );
  }
}
