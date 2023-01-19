import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reorderable_grid_view/reorderable_grid_view.dart';
import 'package:sizer/sizer.dart';
import 'package:things_counter/constants/extensions.dart';
import 'package:things_counter/data_provider/models/counter/counter_details.dart';
import 'package:things_counter/data_provider/repository/counter_repository.dart';
import 'package:things_counter/screens/add_thing_screen/add_things_screen.dart';
import 'package:things_counter/screens/settings/settings_screen.dart';
import 'package:things_counter/screens/things_details.dart/things_details.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      Provider.of<CounterRepository>(context, listen: false).getItems();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Things Counter"),
        toolbarHeight: 80,
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    barrierDismissible:
                        false, // user must tap button for close dialog!
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text(
                          'Reset Counter?',
                          style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color:
                                  Theme.of(context).colorScheme.onBackground),
                        ),
                        content: Text(
                          'This will reset all the counter value to their specific reset value.',
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
                              context
                                  .read<CounterRepository>()
                                  .resetAllCounter();

                              Navigator.of(context).pop();
                            },
                            child: const Text('RESET'),
                          )
                        ],
                      );
                    });
              },
              icon: Icon(
                Icons.restore_rounded,
                size: 22.sp,
              )),
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: ((context) {
                  return const SettingScreen();
                })));
              },
              icon: Icon(
                Icons.settings,
                size: 22.sp,
              )),
        ],
      ),
      body: SafeArea(
        child: Consumer<CounterRepository>(
            builder: (context, counterProvider, child) {
          return Container(
            padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
            child: ReorderableGridView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: counterProvider.get().length,
              itemBuilder: (context, index) =>
                  buildItem(index, Colors.green, counterProvider.get()[index]),
              padding: const EdgeInsets.only(top: 20),
              onReorder: (oldIndex, newIndex) {
                // CounterDetails oldCounterId=counterProvider.get()[oldIndex];
                // CounterDetails newCounterId=counterProvider.get()[newIndex];
                context
                    .read<CounterRepository>()
                    .changePosition(oldIndex, newIndex)
                    .whenComplete(
                        () => context.read<CounterRepository>().getItems());
              },
              dragWidgetBuilder: (index, child) {
                return buildItem(index, Colors.white.withOpacity(0.2),
                    counterProvider.get()[index]);
              },
              onDragStart: (index) {
                //log("onDragStart: $index");
              },
              placeholderBuilder: (dropIndex, dropInddex, dragWidget) {
                return  Card(
                  color: Colors.grey[350],
                );
              },
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.8,
              ),
            ),
          );
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return const AddThingsScreen();
          }));
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget buildItem(int index, Color color, CounterDetails counterDetails) {
    return GestureDetector(
      key: ValueKey(index),
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return ThingsDetails(
            counterDetails: counterDetails,
          );
        }));
      },
      child: Card(
        color: Color(counterDetails.colorDetails.backgroundColor.parseInt()),
        child: Stack(
          children: [
            Column(
              children: [
                const Spacer(
                  flex: 5,
                ),
                AnimatedFlipCounter(
                  value: counterDetails.counterValue,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  textStyle: TextStyle(
                    fontSize: 26.sp,
                    color:
                        Color(counterDetails.colorDetails.textColor.parseInt()),
                  ),
                ),
                const Spacer(
                  flex: 1,
                ),
                Container(
                  //margin: EdgeInsets.only(top: 5.h),
                  padding: EdgeInsets.all(1.h),
                  child: Text(
                    
                    counterDetails.counterName,
                  
                    //overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: Color(
                          counterDetails.colorDetails.textColor.parseInt()),
                    ),
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Container(
                  // height: 40,
                  decoration: BoxDecoration(
                      color: Color(
                          counterDetails.colorDetails.buttonColor.parseInt()),
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(20.0),
                          bottomRight: Radius.circular(20.0))),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextButton(
                            onPressed: () {
                              context
                                  .read<CounterRepository>()
                                  .increaseCounterValue(counterDetails.id,
                                      counterDetails.counterValue);
                            },
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all(
                                  const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(20)))),
                              overlayColor:
                                  MaterialStateProperty.all(Colors.transparent),
                            ),
                            child: Icon(
                              Icons.add,
                              color: Color(counterDetails
                                  .colorDetails.buttonIcon
                                  .parseInt()),
                            )),
                      ),
                      // const Spacer(),
                      Expanded(
                        child: TextButton(
                            onPressed: () {
                              context
                                  .read<CounterRepository>()
                                  .decreaseCounterValue(counterDetails.id,
                                      counterDetails.counterValue);
                            },
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all(
                                  const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                          bottomRight: Radius.circular(20)))),
                              overlayColor:
                                  MaterialStateProperty.all(Colors.transparent),
                            ),
                            child: Icon(
                              Icons.remove,
                              color: Color(counterDetails
                                  .colorDetails.buttonIcon
                                  .parseInt()),
                            )),
                      ),
                      //  // const Spacer(),
                    ],
                  ),
                )
              ],
            ),
            Row(
              children: [
                IconButton(
                    iconSize: 22.sp,
                    onPressed: () {
                      resetDialogBox(counterDetails);
                    },
                    splashRadius: 20,
                    icon: Icon(
                      Icons.restore_rounded,
                      color: Color(
                          counterDetails.colorDetails.textColor.parseInt()),
                    )),
                const Spacer(),
                IconButton(
                    iconSize: 22.sp,
                    onPressed: () {
                      deleteDialogBox(counterDetails);
                    },
                    splashRadius: 20,
                    icon: Icon(
                      Icons.delete_rounded,
                      color: Color(
                          counterDetails.colorDetails.textColor.parseInt()),
                    ))
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<dynamic> deleteDialogBox(CounterDetails counterDetails) {
    return showDialog(
        context: context,
        barrierDismissible: false, // user must tap button for close dialog!
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              'Delete Counter',
              style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).colorScheme.onBackground),
            ),
            content: Text(
              'Do you want delete the counter?',
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
                  context.read<CounterRepository>().deleteCounter(
                        counterDetails.id,
                      );

                  Navigator.of(context).pop();
                },
                child: const Text('DELETE'),
              )
            ],
          );
        });
  }

  Future<dynamic> resetDialogBox(CounterDetails counterDetails) {
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
              'This will reset the counter value to ${counterDetails.resetBy}.',
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
                        counterDetails.id,
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
