import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../module/utils /methods/app_colors.dart';
import '../../module/utils /sizeing.dart';
import '../../module/utils /typograpy/typograpy.dart';
import 'mixins/inputtype.dart';

enum InputType { defaultText, figureText }

class MoolNewInputField extends StatefulWidget {
  const MoolNewInputField({
    super.key,
    this.inputType = InputType.defaultText,
    required this.controller,
    this.showHelper = false,
    this.helperText,
    this.leading,
    this.autoFocus = false,
    this.trailingIcon,
    this.password = false,
    this.isReadOnly = false,
    this.errorText,
    this.onChangeText,
    this.trailingTapped,
    this.hasError = false,
    this.hasSuccess = false,
    this.onFieldSubmitted,
    this.trailingIconColor,
    this.successText,
    this.isTextArea = false,
    this.keyboardType,
    this.label,
    this.prefixText,
    this.hintText,
    this.textInputAction,
    this.inputFormatters,
    this.style,
    this.onTap,
    this.showCusor,
    this.scrollPadding,
    this.focusNode,
    this.textCapitalization,
  });
  final List<TextInputFormatter>? inputFormatters;
  final InputType inputType;
  final TextEditingController controller;
  final String? helperText;
  final bool showHelper;
  final bool autoFocus;
  final String? successText;
  final Widget? leading;
  final IconData? trailingIcon;
  final bool password;
  final bool? showCusor;
  final bool isReadOnly;
  final String? errorText;
  final void Function(String)? onChangeText;
  final void Function()? trailingTapped;
  final bool hasError;
  final bool hasSuccess;
  final String? hintText;
  final void Function(String)? onFieldSubmitted;
  final Color? trailingIconColor;
  final TextCapitalization? textCapitalization;
  final bool isTextArea;
  final TextInputType? keyboardType;
  final TextStyle? style;
  final String? label;
  final Widget? prefixText;
  final TextInputAction? textInputAction;
  final VoidCallback? onTap;
  final EdgeInsets? scrollPadding;
  final FocusNode? focusNode;

  @override
  State<MoolNewInputField> createState() => _MoolNewInputFieldState();
}

class _MoolNewInputFieldState extends State<MoolNewInputField> with InputFieldStyle {
  late double topPadding;
  final GlobalKey _textFieldKey = GlobalKey();
  @override
  void initState() {
    super.initState();
    topPadding = 0.0;
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _calculateHeight();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.label == null
            ? const SizedBox.shrink()
            : Text(
                widget.label!,
                style: inputFieldTextStyle(
                  controller: widget.controller,
                  isReadOnly: widget.isReadOnly,
                  hasError: widget.hasError,
                  hasSuccess: widget.hasSuccess,
                  showHelper: widget.showHelper,
                ),
              ),
        Visibility(visible: widget.isReadOnly == false, child: verticalSpace04),
        TextFormField(
          key: _textFieldKey,
          focusNode: widget.focusNode,
          scrollPadding: widget.scrollPadding ??
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom + 120),
          showCursor: widget.showCusor ?? true,
          cursorColor: oxfordBlue,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          maxLines: widget.isTextArea ? 4 : 1,
          minLines: widget.isTextArea ? 1 : null,
          textInputAction: widget.textInputAction,
          autocorrect: false,
          inputFormatters: widget.inputFormatters,
          onFieldSubmitted: widget.onFieldSubmitted,
          controller: widget.controller,
          style: getMainStyle.copyWith(
            color: !widget.isReadOnly ? oxfordBlue : Colors.white,
            decoration: TextDecoration.none,
          ),
          onTap: widget.onTap,
          obscureText: widget.password,
          onChanged: widget.onChangeText,
          enabled: !widget.isReadOnly,
          readOnly: widget.isReadOnly,
          keyboardType: widget.keyboardType,
          autofocus: widget.autoFocus,
          textCapitalization: widget.textCapitalization ?? TextCapitalization.none,
          decoration: InputDecoration(
            alignLabelWithHint: true,
            isDense: true,
            floatingLabelBehavior: FloatingLabelBehavior.never,
            labelText: widget.hintText,
            labelStyle: widget.style,
            filled: widget.controller.text.isEmpty ? true : true,
            fillColor: !widget.isReadOnly
                ? widget.controller.text.isEmpty
                    ? Colors.white
                    : Colors.transparent
                : Colors.transparent,
            // fillColor: Colors.red,
            prefixIcon: widget.prefixText,
            suffixIcon: widget.trailingIcon != null
                ? Material(
                    color: Colors.transparent,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 2.0),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(48.0),
                        radius: 48.0,
                        onTap: widget.trailingTapped,
                        highlightColor: widget.errorText == null ? Colors.white : alertError40,
                        child: Icon(
                          widget.isReadOnly == true ? null : widget.trailingIcon,
                          size: 24.0,
                          color: widget.hasError
                              ? alertError100
                              : widget.isReadOnly && widget.controller.text.isNotEmpty
                                  ? Colors.white
                                  : !FocusNode().hasFocus && widget.controller.text.isEmpty ||
                                          widget.isReadOnly
                                      ? Colors.white
                                      : Colors.white,
                        ),
                      ),
                    ),
                  )
                : null,
            focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(16.0),
                  topLeft: Radius.circular(16.0),
                  bottomLeft: Radius.circular(16.0),
                  bottomRight: Radius.circular(16.0)),
            ).copyWith(borderSide: BorderSide.none
                // borderSide: BorderSide(
                //   width: 1.0,
                //   color: isReadOnly
                //       ? Colors.transparent
                //       : hasSuccess && !FocusNode().hasFocus
                //           ? alertSuccess100
                //           : hasError && !FocusNode().hasFocus
                //               ? alertError100
                //               : blueTheme100,
                // ),
                ),
            // focusedBorder: UnderlineInputBorder(
            //   borderSide: BorderSide(
            //     width: 1.0,
            //     color: isReadOnly
            //         ? Colors.transparent
            //         : hasSuccess && !FocusNode().hasFocus
            //             ? alertSuccess100
            //             : hasError && !FocusNode().hasFocus
            //                 ? alertError100
            //                 : controller.text.isNotEmpty
            //                     ? blueTheme100
            //                     : Colors.transparent,
            //   ),
            //   borderRadius: BorderRadius.only(
            //       topRight: Radius.circular(16.0.r),
            //       topLeft: Radius.circular(16.0.r),
            //       bottomLeft: Radius.circular(4.0.r),
            //       bottomRight: Radius.circular(4.0.r)),
            // ),
            enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(16.0),
                  topLeft: Radius.circular(16.0),
                  bottomLeft: Radius.circular(16.0),
                  bottomRight: Radius.circular(16.0)),
            ).copyWith(borderSide: BorderSide.none),
            disabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(16.0),
                  topLeft: Radius.circular(16.0),
                  bottomLeft: Radius.circular(16.0),
                  bottomRight: Radius.circular(16.0)),
            ).copyWith(
              borderSide: const BorderSide(
                color: Colors.white,
              ),
            ),
          ),
        ),
        if (widget.showHelper || widget.hasError || widget.hasSuccess) verticalSpace04,
        if (widget.showHelper || widget.hasError || widget.hasSuccess)
          widget.showHelper
              ? Text(
                  widget.helperText ?? '',
                  style: getHeadingStyle.copyWith(color: Colors.white),
                )
              : widget.hasSuccess
                  ? Text(
                      widget.successText ?? '',
                      style: getHeadingStyle.copyWith(color: alertSuccess100),
                    )
                  : Text(
                      widget.errorText ?? '',
                      style: getHeadingStyle.copyWith(color: alertError100),
                    ),
      ],
    );
  }

  void _calculateHeight() {
    topPadding = _getHeight();
    topPadding = topPadding - 6.0;
  }

  double _getHeight() {
    final RenderBox renderBox = _textFieldKey.currentContext!.findRenderObject() as RenderBox;
    return renderBox.size.height;
  }
}
