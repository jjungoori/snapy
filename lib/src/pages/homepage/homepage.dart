import 'package:flutter/material.dart';
import 'package:snapy/src/controllers/buttonsController.dart';
import 'package:get/get.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    Get.put(ButtonsController());

    // const buttonColors = [Colors.red, Colors.red, Colors.yellow, Colors.green, Colors.white, Colors.blue, Colors.indigo, Colors.purple, Colors.black];

    return Scaffold(
      backgroundColor: theme.colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 300,
              height: 300,
              child: Obx(() {
                return GridView.count(
                  crossAxisCount: ButtonsController.to
                      .closestSquare(ButtonsController.to.buttonsCount),
                  children: List.generate(
                    9,
                        (int index) {
                      const customIndexs = [0,8];
                      return AnimationConfiguration.staggeredGrid(
                        position: index,
                        duration: const Duration(milliseconds: 375),
                        columnCount: ButtonsController.to
                            .closestSquare(ButtonsController.to.buttonsCount),
                        child: Padding(
                          padding: EdgeInsets.all(6),
                          child: ScaleAnimation(
                            child: FadeInAnimation(
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: customIndexs.contains(index) ? Color.fromARGB(255, 100, 100, 100) : Color.fromARGB(255, 50, 50, 50),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(customIndexs.contains(index) ? 30 : 15),
                                      side: BorderSide(color: Colors.transparent)
                                  )
                                ),
                                onPressed: (){
                                  // ButtonsController.to.buttonsCount += 1;
                                },
                                child: Text(""),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}

