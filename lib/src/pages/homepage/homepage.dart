import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 300,
              height: 300,
              child: GridView.builder(
                shrinkWrap: true, // GridView의 크기를 자식들의 크기에 맞춥니다.
                physics: NeverScrollableScrollPhysics(), // 스크롤을 비활성화합니다.
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10, // 가로 간격을 조정합니다.
                  mainAxisSpacing: 10, // 세로 간격을 조정합니다.
                  childAspectRatio: 1, // 자식들의 가로세로 비율을 1:1로 설정합니다.
                ),
                itemCount: 4, // 4개의 아이템을 생성합니다.
                itemBuilder: (context, index) {
                  const double br = 20;
                  return InkWell(
                    borderRadius: BorderRadius.circular(br),
                    onTap: () {},
                    child: Ink(
                      height: 50, // 동그라미의 높이를 설정합니다.
                      width: 50, // 동그라미의 너비를 설정합니다.
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(br),
                        color: theme.colorScheme.primary, // 배경색을 설정합니다.
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
