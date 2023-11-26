import 'package:get/get.dart';
import 'dart:math';

class ButtonsController extends GetxController {
// final ButtonsRepository repository;

  static ButtonsController get to => Get.find();

  ButtonsController();

  // final _obj = ''.obs;
  // set obj(value) => this._obj.value = value;
  // get obj => this._obj.value;

  final _buttonsCount = 9.obs;
  set buttonsCount(value) => this._buttonsCount.value = value;
  get buttonsCount => this._buttonsCount.value;

  final _buttonToggles = {};
  final _customButtonToggles = {};

  void toggle(){

  }

  //가까운 제곱수 찾기 for 버튼 정렬
  int closestSquare(int x) {
    double sqrtX = sqrt(x);
    return sqrtX.ceil().toInt();
  }
}
