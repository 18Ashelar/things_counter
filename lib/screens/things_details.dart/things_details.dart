import 'dart:developer';

import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:things_counter/constants/extensions.dart';
import 'package:things_counter/data_provider/models/counter/counter_details.dart';

import '../../data_provider/repository/counter_repository.dart';
import '../add_thing_screen/add_things_screen.dart';

class ThingsDetails extends StatefulWidget {
  const ThingsDetails({super.key, required this.counterDetails});

  final CounterDetails counterDetails;

  @override
  State<ThingsDetails> createState() => _ThingsDetailsState();
}

class _ThingsDetailsState extends State<ThingsDetails> {
  CounterDetails? counterDetails;

  @override
  void initState() {
    createdAt=DateFormat("yyyy-MM-dd hh:mm").parse(widget.counterDetails.createdAt);
   log(widget.counterDetails.createdAt.toString());
    counterDetails = widget.counterDetails;
    super.initState();
  }

  DateTime? createdAt;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 70,
        title:const  Text("Details"),
        actions: [
          IconButton(
              onPressed: () {
                resetDialogBox(context);
              },
              icon: Icon(
                Icons.restore_rounded,
                size: 22.sp,
              )),
          const SizedBox(width: 10)
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 3.h),
            Card(
              //color: Color.fromARGB(255, 233, 233, 233),
              elevation: 4,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0.0)),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    CounterCard(counterDetails: counterDetails),

                    SizedBox(
                      height: 5.h,
                    ),
                    //Divider(),
                    Text(
                      "DETAILS",
                      style: TextStyle(
                          fontSize: 18.sp,
                          color: Theme.of(context).colorScheme.onBackground,
                          fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),

                    CardItemInfo(
                      title: "Title:",
                      info: counterDetails!.counterName.toString(),
                    ),

                    SizedBox(
                      height: 1.h,
                    ),
                    CardItemInfo(
                      title: "Created at: ",
                      info: DateFormat("yyyy-MM-dd hh:mm").format(createdAt!),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    CardItemInfo(
                      title: "Increase by: ",
                      info: counterDetails!.incrementBy.toString(),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    CardItemInfo(
                      title: "Decrease by: ",
                      info: counterDetails!.decrementBy.toString(),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    CardItemInfo(
                      title: "Reset value: ",
                      info: counterDetails!.resetBy.toString(),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return  AddThingsScreen(counterDetails: counterDetails,);
          }));
        },
        child: const Icon(Icons.edit),
      ),
    );
  }

  Future<dynamic> resetDialogBox(BuildContext context) {
    return showDialog(
        context: context,
        barrierDismissible: false, // user must tap button for close dialog!
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              'Reset Counter?',
              style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).colorScheme.onBackground),
            ),
            content: Text(
              'This will reset the counter value to the ${counterDetails!.resetBy}.',
              style: TextStyle(
                  fontSize: 14.sp,
                  color: Theme.of(context)
                      .colorScheme
                      .onBackground
                      .withOpacity(0.8)),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('CANCEL'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                onPressed: () {
                  context.read<CounterRepository>().resetCounterValue(
                        counterDetails!.id,
                      );
                  Navigator.of(context).pop();
                },
                child: const Text('RESET'),
              )
            ],
          );
        });
  }
}

class CounterCard extends StatelessWidget {
  const CounterCard({
    Key? key,
    required this.counterDetails,
  }) : super(key: key);

  final CounterDetails? counterDetails;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Color(counterDetails!.colorDetails.backgroundColor.parseInt()),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            SizedBox(
              width: 45.sp,
              height: 45.sp,
              child: RawMaterialButton(
                shape: const CircleBorder(),
                elevation: 4.0,
                fillColor:
                    Color(counterDetails!.colorDetails.buttonColor.parseInt()),
                child: Icon(Icons.add,
                    color: Color(
                        counterDetails!.colorDetails.buttonIcon.parseInt())),
                onPressed: () {
                  context.read<CounterRepository>().increaseCounterValue(
                      counterDetails!.id, counterDetails!.counterValue);
                },
              ),
            ),
            const Spacer(),
            Consumer<CounterRepository>(
                builder: (context, counterProvider, child) {
              return AnimatedFlipCounter(
                value: counterDetails!.counterValue,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                textStyle: TextStyle(
                  fontSize: 35.sp,
                  color:
                      Color(counterDetails!.colorDetails.textColor.parseInt()),
                ),
              );
            }),
            const Spacer(),
            SizedBox(
              width: 45.sp,
              height: 45.sp,
              child: RawMaterialButton(
                shape: const CircleBorder(),
                elevation: 4.0,
                fillColor:
                    Color(counterDetails!.colorDetails.buttonColor.parseInt()),
                child: Icon(Icons.remove,
                    color: Color(
                        counterDetails!.colorDetails.buttonIcon.parseInt())),
                onPressed: () {
                  context.read<CounterRepository>().decreaseCounterValue(
                      counterDetails!.id, counterDetails!.counterValue);
                },
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}

class CardItemInfo extends StatelessWidget {
  const CardItemInfo({Key? key, required this.title, required this.info})
      : super(key: key);

  final String title;
  final String info;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 130,
          child: Text(
            title,
            style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
                color: Theme.of(context)
                    .colorScheme
                    .onBackground
                    .withOpacity(0.9)),
          ),
        ),
        // const SizedBox(
        //   width: 5.0,
        // ),
        Expanded(
          child: Text(
            info,
            //maxLines: 2,
            style: TextStyle(
                fontSize: 14.sp,
                height: 1.2,
                color: Theme.of(context)
                    .colorScheme
                    .onBackground
                    .withOpacity(0.8)),
          ),
        )
      ],
    );
  }
}

class IconButtonRow extends StatelessWidget {
  const IconButtonRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 3.w,
        ),
        IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            splashRadius: 20,
            icon: Icon(
              Icons.arrow_back,
              color: Theme.of(context).colorScheme.surface,
              size: 22.sp,
            )),
        const Spacer(
          flex: 5,
        ),
        IconButton(
            onPressed: () {},
            splashRadius: 20,
            icon: Icon(
              Icons.restore_rounded,
              color: Theme.of(context).colorScheme.surface,
              size: 22.sp,
            )),
        // IconButton(
        //     onPressed: () {},
        //     splashRadius: 20,
        //     icon: Icon(
        //       Icons.settings,
        //       color: Theme.of(context).colorScheme.surface,
        //       size: 22.sp,
        //     )),
        // IconButton(
        //     onPressed: () {},
        //     splashRadius: 20,
        //     icon: Icon(
        //       Icons.more_vert_rounded,
        //       color: Theme.of(context).colorScheme.surface,
        //       size: 22.sp,
        //     )),
        const SizedBox(
          width: 10.0,
        )
      ],
    );
  }
}
