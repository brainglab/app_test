import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:app_test/src/custom/constants.dart';
import 'package:app_test/src/custom/library.dart';

class CustomInput extends StatefulWidget {
  const CustomInput({super.key, this.title, this.hint, this.controller, required this.validator, this.node, this.obscurePassword, this.width, this.textInputType, this.maxLines, this.callback});

  final double? width;
  final String? title;
  final String? hint;
  final TextEditingController? controller;
  final Function validator;
  final FocusNode? node;
  final bool? obscurePassword;
  final TextInputType? textInputType;
  final int? maxLines;
  final Function? callback;

  @override
  State<CustomInput> createState() => _CustomInputState();
}

class _CustomInputState extends State<CustomInput> {
  bool mShowSuffixIcon = false;
  bool mPasswordVisible = false;

  void _toggle() {
    setState(() {
      mPasswordVisible = !mPasswordVisible;
    });
  }

  @override
  void initState() {
    mShowSuffixIcon = ((widget.obscurePassword == null) ? false : true);
    mPasswordVisible = ((widget.obscurePassword == null) ? false : widget.obscurePassword!);

    super.initState();
    globalContext = context;
  }

  @override
  Widget build(BuildContext context) {
    globalContext = context;
    return Container(
        width: widget.width,
        // height: (widget.height == null ? 60 : widget.height),
        alignment: Alignment.topCenter,
        margin: const EdgeInsets.only(bottom: 10),
        child: TextFormField(
            focusNode: widget.node,
            onChanged: (String text) async {
              if (widget.callback != null) {
                widget.callback!();
              }
            },
            onFieldSubmitted: (String text) {
              int mCount = widget.controller!.text.split('\n').length;
              log('==> son $mCount Enters');
              if (widget.maxLines != null) {
                if (mCount <= widget.maxLines!) {
                  widget.controller!.value = TextEditingValue(text: "${widget.controller!.text}\n", selection: TextSelection(baseOffset: widget.controller!.text.length, extentOffset: widget.controller!.text.length));
                  FocusScope.of(context).requestFocus();
                }
              }
            },
            validator: (value) => widget.validator(value),
            controller: widget.controller,
            keyboardType: (widget.maxLines == null ? widget.textInputType : TextInputType.text),
            textInputAction: (widget.maxLines == null ? TextInputAction.next : TextInputAction.done),
            obscureText: mPasswordVisible,
            style: Constants.textStyleBlack,
            cursorColor: Constants.colorAccent,
            autofocus: true,
            maxLines: (widget.maxLines ?? 1),
            decoration: InputDecoration(
              filled: true,
              fillColor: Constants.colorLight,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(color: Constants.colorGray, width: 1),
              ),
              errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(
                    color: Constants.colorRed,
                    width: 1,
                  )),
              focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(
                    color: Constants.colorRed,
                    width: 2,
                  )),
              labelText: widget.title,
              labelStyle: Constants.textStyleBlack,
              errorStyle: Constants.textStyleRedSmall,
              contentPadding: const EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 15),
              hintStyle: Constants.textStyleLight,
              hintText: widget.hint,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(
                  color: Constants.colorAccent,
                  width: 2,
                ),
              ),
              suffixIcon: ((mShowSuffixIcon)
                  ? IconButton(
                      icon: Icon(
                        mPasswordVisible ? TablerIcons.eye : TablerIcons.eye_closed,
                        color: Constants.colorLight,
                        size: 25,
                      ),
                      onPressed: () => _toggle())
                  : const SizedBox(
                      height: 0,
                      width: 0,
                    )),
            )));
  }
}
