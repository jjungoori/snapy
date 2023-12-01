import 'package:flutter/material.dart';
import 'package:snapy/src/controllers/authController.dart';
import 'package:snapy/src/controllers/buttonsController.dart';
import 'package:get/get.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final AuthController authController = Get.find();
    Get.put(ButtonsController());

    const buttonColors = [
      Colors.red,
      Colors.orange,
      Colors.yellow,
      Colors.green,
      Colors.tealAccent,
      Colors.blue,
      Colors.indigo,
      Colors.purple,
      Colors.pinkAccent
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(authController.user!.email!),
      ),
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
                      final radius = BorderRadius.circular(
                          ButtonsController.to.isToggled(index) ? 30 : 15);

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
                                backgroundColor:
                                    ButtonsController.to.isToggled(index)
                                        ? Color.fromARGB(255, 100, 100, 100)
                                        : Color.fromARGB(255, 50, 50, 50),
                                shape: RoundedRectangleBorder(
                                  borderRadius: radius,
                                  side: BorderSide(color: Colors.transparent),
                                ),
                              ),
                              onPressed: () {
                                ButtonsController.to
                                    .executeToggle(ToggleType.plus, index);
                                // ButtonsController.to.buttonsCount += 1;
                              },
                              child: Stack(
                                fit: StackFit.expand,
                                children: [
                                  // 버튼의 콘텐츠를 여기에 배치

                                  Positioned(
                                    top: 15,
                                    right: 0, // 우측 상단에 배치
                                    child: CustomPaint(
                                      size: Size(20, 20), // 세모 크기 설정
                                      painter: TrianglePainter(
                                        buttonColors[index],
                                      ), // 장식의 색상과 radius
                                    ),
                                  ),
                                ],
                              ),
                            )),
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

class TrianglePainter extends CustomPainter {
  final Color color;

  TrianglePainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    var path = Path();
    // 세모의 정점을 정의 (우측 상단 모서리에서 시작)
    path.moveTo(size.width, 0); // 우측 상단 점
    path.lineTo(size.width - size.width, 0); // 좌측 상단 점
    path.lineTo(size.width, size.height); // 우측 하단 점
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
