import 'dart:developer';

import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:things_counter/constants/custom_validator.dart';
import 'package:things_counter/constants/extensions.dart';
import 'package:things_counter/data_provider/repository/counter_card_color_set.dart';
import '../../data_provider/models/counter/counter_color_details.dart';
import '../../data_provider/models/counter/counter_details.dart';
import '../../data_provider/repository/counter_repository.dart';
import 'components/custom_text_form_field.dart';
import 'components/selected_color_button.dart';
import 'components/submit_button.dart';

class AddThingsScreen extends StatefulWidget {
  const AddThingsScreen({super.key});

  @override
  State<AddThingsScreen> createState() => _AddThingsScreenState();
}

class _AddThingsScreenState extends State<AddThingsScreen>
    with CustomValidator {
  final _formKey = GlobalKey<FormState>();

  //Controller for input field
  final TextEditingController _name = TextEditingController();
  final TextEditingController _counterValue = TextEditingController();
  final TextEditingController _incrementCounterValue =
      TextEditingController(text: "1");
  final TextEditingController _decrementCounterValue =
      TextEditingController(text: "1");
  final TextEditingController _resetValueController = TextEditingController();
  final textController = TextEditingController(text: '#2F19DB');

  //getting color from color picker
  // String background = "0xFFff9800";
  // String text = "0xFFFFFFFF";
  // String button = "0xFFffd600";
  // String buttonIcon = "0xFF000000";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            splashRadius: 20,
            icon: const Icon(Icons.close_rounded)),
        title: const Text("Add Thing"),
      ),
      body: SafeArea(child: SingleChildScrollView(
        child: Consumer<CounterCardColorSet>(
            builder: (context, colorProvider, child) {
          return Form(
            key: _formKey,
            child: Container(
              padding: EdgeInsets.all(5.h),
              child: Column(children: [
                // SizedBox(
                //   height: 3.h,
                // ),
                CustomTextFormField(
                  validator: (p0) => isEmpty(p0!),
                  labelName: "Name",
                  controller: _name,
                ),
                SizedBox(
                  height: 3.h,
                ),
                CustomTextFormField(
                  validator: (p0) => isEmpty(p0!),
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(5)
                  ],
                  labelName: "Counter Value",
                  controller: _counterValue,
                ),
                SizedBox(
                  height: 3.h,
                ),
                CustomTextFormField(
                  validator: (p0) => isEmpty(p0!),
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(5)
                  ],
                  labelName: "Increment By",
                  controller: _incrementCounterValue,
                ),
                SizedBox(
                  height: 3.h,
                ),
                CustomTextFormField(
                  validator: (p0) => isEmpty(p0!),
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(5)
                  ],
                  labelName: "Decrement By",
                  controller: _decrementCounterValue,
                ),
                SizedBox(
                  height: 3.h,
                ),
                CustomTextFormField(
                  validator: (p0) => isEmpty(p0!),
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(5)
                  ],
                  labelName: "Reset By",
                  controller: _resetValueController,
                ),
                SizedBox(
                  height: 3.h,
                ),
                SizedBox(
                    width: double.infinity,
                    height: 47,
                    child: OutlinedButton(
                        onPressed: () {
                          counterPreview(context);
                        },
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(
                              width: 1.0,
                              color: Theme.of(context).colorScheme.primary),
                        ),
                        child: const Text("Set Color"))),
                SizedBox(
                  height: 3.h,
                ),
                SubmitButton(
                  title: "Add Thing",
                  width: double.infinity,
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      CounterDetails counterDetails = CounterDetails(
                          id: UniqueKey().hashCode,
                          counterValue: int.parse(_counterValue.text),
                          counterName: _name.text,
                          createdAt: DateTime.now().toString(),
                          incrementBy: int.parse(_incrementCounterValue.text),
                          decrementBy: int.parse(_decrementCounterValue.text),
                          resetBy: int.parse(_resetValueController.text),
                          colorDetails: CounterColorDetails(
                              backgroundColor: colorProvider.background,
                              textColor: colorProvider.text,
                              buttonColor: colorProvider.button,
                              buttonIcon: colorProvider.buttonIcon));
                      log(counterDetails.toString());
                      context
                          .read<CounterRepository>()
                          .createItem(counterDetails);
                    }
                  },
                ),
                SizedBox(
                  height: 3.h,
                ),
              ]),
            ),
          );
        }),
      )),
    );
  }

  Future<void> counterPreview(BuildContext context) {
    return showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return SizedBox(
          height: 80.h,
          child: Consumer<CounterCardColorSet>(
              builder: (context, colorProvider, child) {
            return Center(
              child: Column(
                //  mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Container(
                    height: 60.0,
                    color: Theme.of(context).colorScheme.primary,
                    child: Row(
                      children: [
                        IconButton(
                          iconSize: 22.sp,
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          splashRadius: 20,
                          icon: Icon(Icons.close_rounded,
                              color: Theme.of(context).colorScheme.onPrimary),
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Text("Preview",
                            style: Theme.of(context).appBarTheme.titleTextStyle)
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 3.h,
                  ),

                  SizedBox(
                    height: 220,
                    width: 190,
                    child: GestureDetector(
                      onTap: () {},
                      child: Card(
                        color: Color(colorProvider.background.parseInt()),
                        child: Stack(
                          children: [
                            Column(
                              children: [
                                const Spacer(
                                  flex: 5,
                                ),
                                AnimatedFlipCounter(
                                  value: 100,
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.easeInOut,
                                  textStyle: TextStyle(
                                    fontSize: 26.sp,
                                    color: Color(colorProvider.text.parseInt()),
                                  ),
                                ),
                                const Spacer(
                                  flex: 1,
                                ),
                                Container(
                                  //margin: EdgeInsets.only(top: 5.h),
                                  padding: EdgeInsets.all(1.h),
                                  child: Text(
                                    "Sample Text",
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.center,
                                    maxLines: 2,
                                    style: TextStyle(
                                      fontSize: 19.sp,
                                      color:
                                          Color(colorProvider.text.parseInt()),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 1.h,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      color: Color(
                                          colorProvider.button.parseInt()),
                                      borderRadius: const BorderRadius.only(
                                          bottomLeft: Radius.circular(20.0),
                                          bottomRight: Radius.circular(20.0))),
                                  child: Row(
                                    children: [
                                      const Spacer(),
                                      TextButton(
                                          onPressed: () {
                                            // setState(() {
                                            //   number = number! + 1;
                                            // });
                                          },
                                          style: ButtonStyle(
                                            overlayColor:
                                                MaterialStateProperty.all(
                                                    Colors.transparent),
                                          ),
                                          child: Icon(
                                            Icons.add,
                                            color: Color(colorProvider
                                                .buttonIcon
                                                .parseInt()),
                                          )),
                                      const Spacer(),
                                      TextButton(
                                          onPressed: () {
                                            // setState(() {
                                            //   number = number! - 1;
                                            // });
                                          },
                                          style: ButtonStyle(
                                            overlayColor:
                                                MaterialStateProperty.all(
                                                    Colors.transparent),
                                          ),
                                          child: Icon(
                                            Icons.remove,
                                            color: Color(colorProvider
                                                .buttonIcon
                                                .parseInt()),
                                          )),
                                      const Spacer(),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                IconButton(
                                    iconSize: 22.sp,
                                    onPressed: () {},
                                    splashRadius: 20,
                                    icon: Icon(
                                      Icons.restore_rounded,
                                      color:
                                          Color(colorProvider.text.parseInt()),
                                    )),
                                const Spacer(),
                                IconButton(
                                    iconSize: 22.sp,
                                    onPressed: () {},
                                    splashRadius: 20,
                                    icon: Icon(
                                      Icons.delete_rounded,
                                      color:
                                          Color(colorProvider.text.parseInt()),
                                    ))
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  // const Divider(),
                  SizedBox(
                    height: 3.h,
                  ),
                  Row(
                    children: [
                      const Spacer(),
                      SelectedColorButton(
                        colorName: Color(colorProvider.background.parseInt()),
                        title: "Background",
                        onTap: () {
                          context
                              .read<CounterCardColorSet>()
                              .setPickerColor("background");
                          colorPickerTool(context, "background");
                        },
                      ),
                      const Spacer(),
                      SelectedColorButton(
                        colorName: Color(colorProvider.text.parseInt()),
                        title: "Text",
                        onTap: () {
                          context
                              .read<CounterCardColorSet>()
                              .setPickerColor("text");

                          colorPickerTool(context, "text");
                        },
                      ),
                      const Spacer(),
                    ],
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  Row(
                    children: [
                      const Spacer(),
                      SelectedColorButton(
                        colorName: Color(colorProvider.button.parseInt()),
                        title: "Button",
                        onTap: () {
                          context
                              .read<CounterCardColorSet>()
                              .setPickerColor("button");

                          colorPickerTool(context, "button");
                        },
                      ),
                      const Spacer(),
                      SelectedColorButton(
                        colorName: Color(colorProvider.buttonIcon.parseInt()),
                        title: "Button Icon",
                        onTap: () {
                          context
                              .read<CounterCardColorSet>()
                              .setPickerColor("button_icon");

                          colorPickerTool(context, "button_icon");
                        },
                      ),
                      const Spacer(),
                    ],
                  )
                ],
              ),
            );
          }),
        );
      },
    );
  }

  Future<dynamic> colorPickerTool(BuildContext context, String name) {
    return showDialog(
        context: context,
        builder: (context) {
          return Consumer<CounterCardColorSet>(
              builder: (context, themeProvider, child) {
            return AlertDialog(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
              insetPadding: const EdgeInsets.symmetric(horizontal: 20),
              scrollable: true,
              iconPadding: EdgeInsets.zero,
              icon: Container(
                alignment: Alignment.topRight,
                padding: EdgeInsets.only(right: 5.w),
                child: IconButton(
                  splashRadius: 20.sp,
                  onPressed: (() {
                    Navigator.pop(context);
                  }),
                  icon: Icon(
                    Icons.cancel,
                    size: 30.sp,
                    color: Theme.of(context)
                        .colorScheme
                        .onBackground
                        .withOpacity(0.8),
                  ),
                ),
              ),
              titlePadding:
                  const EdgeInsets.only(top: 0, left: 80, right: 80, bottom: 0),
              title: SizedBox(
                height: 220,
                child: Card(
                  color: Color(themeProvider.background.parseInt()),
                  child: Stack(
                    children: [
                      Column(
                        children: [
                          const Spacer(
                            flex: 5,
                          ),
                          AnimatedFlipCounter(
                            value: 100,
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                            textStyle: TextStyle(
                                fontSize: 26.sp,
                                color: Color(themeProvider.text.parseInt())),
                          ),
                          const Spacer(
                            flex: 1,
                          ),
                          Container(
                            //margin: EdgeInsets.only(top: 5.h),
                            padding: EdgeInsets.all(1.h),
                            child: Text(
                              "Sample Text",
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                              maxLines: 2,
                              style: TextStyle(
                                  fontSize: 19.sp,
                                  color: Color(themeProvider.text.parseInt())),
                            ),
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Color(themeProvider.button.parseInt()),
                                borderRadius: const BorderRadius.only(
                                    bottomLeft: Radius.circular(20.0),
                                    bottomRight: Radius.circular(20.0))),
                            child: Row(
                              children: [
                                const Spacer(),
                                TextButton(
                                    onPressed: () {
                                      // setState(() {
                                      //   number = number! + 1;
                                      // });
                                    },
                                    style: ButtonStyle(
                                      overlayColor: MaterialStateProperty.all(
                                          Colors.transparent),
                                    ),
                                    child: Icon(
                                      Icons.add,
                                      color: Color(
                                          themeProvider.buttonIcon.parseInt()),
                                    )),
                                const Spacer(),
                                TextButton(
                                    onPressed: () {
                                      // setState(() {
                                      //   number = number! - 1;
                                      // });
                                    },
                                    style: ButtonStyle(
                                      overlayColor: MaterialStateProperty.all(
                                          Colors.transparent),
                                    ),
                                    child: Icon(
                                      Icons.remove,
                                      color: Color(
                                          themeProvider.buttonIcon.parseInt()),
                                    )),
                                const Spacer(),
                              ],
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          IconButton(
                              iconSize: 22.sp,
                              onPressed: () {},
                              splashRadius: 20,
                              icon: Icon(
                                Icons.restore_rounded,
                                color: Color(themeProvider.text.parseInt()),
                              )),
                          const Spacer(),
                          IconButton(
                              iconSize: 22.sp,
                              onPressed: () {},
                              splashRadius: 20,
                              icon: Icon(
                                Icons.delete_rounded,
                                color: Color(themeProvider.text.parseInt()),
                              ))
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              contentPadding: const EdgeInsets.only(
                  top: 20, left: 24, right: 24, bottom: 0),
              // actionsPadding: const EdgeInsets.fromLTRB(10.0, 0, 10.0, 10.0),
              content: SizedBox(
                //color: Theme.of(context).colorScheme.background,
                height: 55.h,
                child: Column(
                  children: [
                    ColorPicker(
                      pickerColor: Color(themeProvider.pickerColor.parseInt()),
                      onColorChanged: (color) {
                        context
                            .read<CounterCardColorSet>()
                            .setColor(name, color.colorToString());
                      },
                      colorPickerWidth: 300,
                      labelTypes: const [
                        // ColorLabelType.rgb,
                        // ColorLabelType.hsv,
                        // ColorLabelType.hsl
                      ],
                      pickerAreaHeightPercent: 0.7,
                      enableAlpha: true,
                      displayThumbColor: true,
                      paletteType: PaletteType.hsvWithHue,
                      pickerAreaBorderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20.0),
                          topRight: Radius.circular(20.0)),
                      hexInputController: textController,
                      portraitOnly: true,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                      child: TextFormField(
                        controller: textController,
                        style: TextStyle(
                          fontFamily: "Roboto",
                          color: Theme.of(context)
                              .colorScheme
                              .onBackground
                              .withOpacity(0.8),
                          fontSize: 14.sp,
                        ),
                        onChanged: ((value) {}),
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.tag),
                          // suffix: IconButton(
                          //     onPressed: () => copyToClipboard,
                          //     icon: const Icon(Icons.content_paste_go_rounded)),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 0.0, horizontal: 12),
                        ),
                        autofocus: false,
                        maxLength: 9,
                        inputFormatters: [
                          UpperCaseTextFormatter(),
                          FilteringTextInputFormatter.allow(
                              RegExp(kValidHexPattern))
                        ],
                      ),
                    )
                  ],
                ),
              ),
              // actions: [
              //   TextButton(
              //       onPressed: () {
              //         Navigator.pop(context);
              //       },
              //       child: const Text("CANCEL")),
              //   TextButton(
              //       onPressed: () {
              //         switch (name) {
              //           case "background":print(themeProvider.background);
              //             break;
              //           case "text":
              //             break;
              //           case "button":
              //             break;
              //           case "button_icon":
              //             break;
              //         }
              //       },
              //       child: const Text("OK"))
              // ],
            );
          });
        });
  }

  void copyToClipboard(String input) {
    String textToCopy = input.replaceFirst('#', '').toUpperCase();
    if (textToCopy.startsWith('FF') && textToCopy.length == 8) {
      textToCopy = textToCopy.replaceFirst('FF', '');
    }
    Clipboard.setData(ClipboardData(text: '#$textToCopy'));
  }
}
