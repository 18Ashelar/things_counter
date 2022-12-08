import 'package:flutter/cupertino.dart';

class CounterCardColorSet extends ChangeNotifier {
  String background = "0xFFff9800";
  String text = "0xFFFFFFFF";
  String button = "0xFFffd600";
  String buttonIcon = "0xFF000000";
  String pickerColor="0xFFF1F1F1";


  void setPickerColor(String colorType)
  {
     switch (colorType) {
      case "background":
        pickerColor = background;
        break;
      case "text":
        pickerColor = text;
        break;
      case "button":
        pickerColor = button;
        break;
      case "button_icon":
        pickerColor = buttonIcon;
        break;
    }
    notifyListeners();

  }

   
  void setColor(String colorType,String colorValue)
  {
     switch (colorType) {
      case "background":
        background = colorValue;
        break;
      case "text":
        text = colorValue;
        break;
      case "button":
        button = colorValue;
        break;
      case "button_icon":
        buttonIcon = colorValue;
        break;
    }
    pickerColor=colorValue;
    notifyListeners();
  }

  // void setBackgroundColor(String backgroundColor) {
  //   background = backgroundColor;
  //   notifyListeners();
  // }

  // void setTextColor(String textColor) {
  //   text = textColor;
  //   notifyListeners();
  // }

  // void setButton(String buttonColor) {
  //   button = buttonColor;
  //   notifyListeners();
  // }

  // void setBackground(String buttonIconColor) {
  //   buttonIcon = buttonIconColor;
  //   notifyListeners();
  // }
}
