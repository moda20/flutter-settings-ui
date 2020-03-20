import 'dart:ui';

import 'package:flutter/material.dart';

class SettingUIColors{
   Color _mediumGrayColor = Color(0xFFC7C7CC);
   Color _itemPressedColor = Color(0xFFD9D9D9);
   Color _borderColor = Color(0xFFBCBBC1);
   Color _borderLightColor = Color.fromRGBO(49, 44, 51, 1);
   Color _backgroundColor = Color(0xFFEFEFF4);
   Color _groupSubtitle = Color(0xFF777777);
   Color _iosTileDarkColor = Color.fromRGBO(28, 28, 30, 1);
   Color _iosPressedTileColorDark = Color.fromRGBO(44, 44, 46, 1);
   Color _iosPressedTileColorLight = Color.fromRGBO(230, 229, 235, 1);
   Color _sectionHeadingTextcolor = Colors.black;
   Color _tileTitleColor = Colors.black87;
   SettingUIColors._privateConstructor();

  static final SettingUIColors _instance = SettingUIColors._privateConstructor();

  factory SettingUIColors() {
    return _instance;
  }

   Color get iosPressedTileColorLight => _iosPressedTileColorLight;

   set iosPressedTileColorLight(Color value) {
     _iosPressedTileColorLight = value;
   }

   Color get iosPressedTileColorDark => _iosPressedTileColorDark;

   set iosPressedTileColorDark(Color value) {
     _iosPressedTileColorDark = value;
   }

   Color get iosTileDarkColor => _iosTileDarkColor;

   set iosTileDarkColor(Color value) {
     _iosTileDarkColor = value;
   }

   Color get groupSubtitle => _groupSubtitle;

   set groupSubtitle(Color value) {
     _groupSubtitle = value;
   }

   Color get backgroundColor => _backgroundColor;

   set backgroundColor(Color value) {
     _backgroundColor = value;
   }

   Color get borderLightColor => _borderLightColor;

   set borderLightColor(Color value) {
     _borderLightColor = value;
   }

   Color get borderColor => _borderColor;

   set borderColor(Color value) {
     _borderColor = value;
   }

   Color get itemPressedColor => _itemPressedColor;

   set itemPressedColor(Color value) {
     _itemPressedColor = value;
   }

   Color get mediumGrayColor => _mediumGrayColor;

   set mediumGrayColor(Color value) {
     _mediumGrayColor = value;
   }

   Color get sectionHeadingTextcolor => _sectionHeadingTextcolor;

   set sectionHeadingTextcolor(Color value) {
     _sectionHeadingTextcolor = value;
   }

   Color get tileTitleColor => _tileTitleColor;

   set tileTitleColor(Color value) {
     _tileTitleColor = value;
   }


}

