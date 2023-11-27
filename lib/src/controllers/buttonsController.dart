import 'package:get/get.dart';
import 'dart:math';

enum ToggleType{
  plus, minus
}

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

  var _buttonToggles = List.filled(9, false);
  var _buttonTogglesDates = {};

  DateTime startingPoint = DateTime.now();
  DateTime endingPoint = DateTime.now();

  var _toggle = false.obs;
  set toggle(value) => this._toggle.value = value;
  get toggle => this._toggle.value;

  void executeToggle(ToggleType type, int index){
    _buttonToggles[index] = !_buttonToggles[index];
    if(_buttonToggles[index]){
      startingPoint = DateTime.now();
    }
    else{
      endingPoint = DateTime.now();
      if(_buttonTogglesDates[index] == null){
        _buttonTogglesDates[index] = List.empty(growable: true);
      }
      _buttonTogglesDates[index].add((startingPoint, endingPoint));
    }
  }

  //가까운 제곱수 찾기 for 버튼 정렬
  int closestSquare(int x) {
    double sqrtX = sqrt(x);
    return sqrtX.ceil().toInt();
  }
}
