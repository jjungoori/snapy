import 'package:flutter/material.dart';
import 'package:snapy/src/controllers/buttonsController.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    Get.put(ButtonsController());

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
                return AnimatedSwitcher(
                  duration: Duration(milliseconds: 500),
                  switchInCurve: Curves.easeOut,
                  switchOutCurve: Curves.easeIn,
                  transitionBuilder: (Widget child, Animation<double> anim) {
                    return RotationTransition(
                      turns: anim,
                      child: FadeTransition(child: child, opacity: anim),
                    );
                  },
                  child: GridView.builder(
                    key: ValueKey<int>(ButtonsController.to.buttonsCount),
                    shrinkWrap: true, // GridView의 크기를 자식들의 크기에 맞춥니다.
                    physics: NeverScrollableScrollPhysics(), // 스크롤을 비활성화합니다.
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: ButtonsController.to
                          .closestSquare(ButtonsController.to.buttonsCount),
                      crossAxisSpacing: 10, // 가로 간격을 조정합니다.
                      mainAxisSpacing: 10, // 세로 간격을 조정합니다.
                      childAspectRatio: 1, // 자식들의 가로세로 비율을 1:1로 설정합니다.
                    ),
                    itemCount:
                        ButtonsController.to.buttonsCount, // 4개의 아이템을 생성합니다.
                    itemBuilder: (context, index) {
                      const double br = 20;
                      return AnimatedGridItem(
                        index: index,
                        onTap: () {
                          ButtonsController.to.buttonsCount += 1;
                        },
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

class AnimatedGridItem extends StatefulWidget {
  final int? index; // 아이템의 인덱스
  final Function() onTap;

  AnimatedGridItem({Key? key, this.index, required this.onTap})
      : super(key: key);

  @override
  _AnimatedGridItemState createState() => _AnimatedGridItemState();
}

class _AnimatedGridItemState extends State<AnimatedGridItem>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  Animation<double>? _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(_controller!)
      ..addListener(() {
        setState(() {});
      });

    _controller!.forward();
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ScaleTransition(
      scale: _animation!,
      child: InkWell(
        // 여기서 아이템의 UI를 구성합니다.
        onTap: widget.onTap,
        child: Ink(
          decoration: BoxDecoration(
            color: theme.colorScheme.primary,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(
            child: Text('Item ${widget.index}'),
          ),
        ),
      ),
    );
  }
}
