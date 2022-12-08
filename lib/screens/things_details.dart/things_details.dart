import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../add_thing_screen/add_things_screen.dart';

class ThingsDetails extends StatefulWidget {
  const ThingsDetails({super.key});

  @override
  State<ThingsDetails> createState() => _ThingsDetailsState();
}

class _ThingsDetailsState extends State<ThingsDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(
      //   elevation: 0,
      //   backgroundColor: Theme.of(context).colorScheme.primary,
      //   actions: [
      //     IconButton(
      //         onPressed: () {},
      //         icon: Icon(
      //           Icons.restore_rounded,
      //           size: 22.sp,
      //         )),
      //     IconButton(
      //         onPressed: () {},
      //         icon: Icon(
      //           Icons.settings,
      //           size: 22.sp,
      //         )),
      //     IconButton(
      //         onPressed: () {},
      //         icon: Icon(
      //           Icons.more_vert_rounded,
      //           size: 22.sp,
      //         ))
      //   ],
      // ),
      body: SafeArea(
          child: Column(
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
            height: 30.h,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(40.0),
                    bottomRight: Radius.circular(40.0))),
            child: Column(
              children: [
                const Flexible(
                  child: IconButtonRow(),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Text(
                  "123",
                  maxLines: 2,
                  style: Theme.of(context).textTheme.headline1!.copyWith(
                      fontWeight: FontWeight.w500,
                      fontSize: 45.sp,
                      color: Theme.of(context).colorScheme.surface),
                ),
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      "Swimming is the best then east ",
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headline2!.copyWith(
                          fontWeight: FontWeight.w500,
                          fontSize: 22.sp,
                          color: Theme.of(context).colorScheme.surface),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0.0)),
              margin: const EdgeInsets.all(20.0),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
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
                    const CardItemInfo(
                      title: "Created at: ",
                      info: "2022/10/08 12:12:00",
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    const CardItemInfo(
                      title: "Increase by: ",
                      info: "10",
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    const CardItemInfo(
                      title: "Decrease by: ",
                      info: "10",
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    const CardItemInfo(
                      title: "Reset value: ",
                      info: "10",
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
               ],
                ),
              ),
            ),
          )
        ],
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return const AddThingsScreen();
          }));
        },
        child: const Icon(Icons.edit),
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
      children: [
        Text(
          title,
          style: TextStyle(
              fontSize: 16.sp,
              color:
                  Theme.of(context).colorScheme.onBackground.withOpacity(0.9)),
        ),
        const SizedBox(
          width: 5.0,
        ),
        Text(
          info,
          style: TextStyle(
              fontSize: 15.sp,
              color:
                  Theme.of(context).colorScheme.onBackground.withOpacity(0.8)),
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
       const SizedBox(width: 10.0,)
      ],
    );
  }
}
