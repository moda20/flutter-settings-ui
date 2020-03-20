import 'package:flutter/material.dart';
import 'package:settings_ui/src/colors.dart';
import 'package:settings_ui/src/settings_section.dart';



class SettingsList extends StatelessWidget {
  SettingUIColors SettingColors = new SettingUIColors();

  final List<SettingsSection> sections;
  ///The [backgroundColor] will override the default colors for dark and light mode
  final Color backgroundColor;
  ///The [textColor] will override the default colors for dark and light mode
  final Color textColor;
  ///The [headingTextColor] will override the default colors for dark and light mode
  final Color headingTextColor;
  SettingsList({Key key, this.sections, this.backgroundColor, this.headingTextColor, this.textColor}) : super(key: key);


  Color _computeBackgroundColor(context){
    if(this.backgroundColor!=null){
      return this.backgroundColor;
    }else{
      return Theme.of(context).brightness == Brightness.light
          ? backgroundColor
          : Colors.black;
    }
  }


  Color _computeTextColor(context){
    if(this.textColor!=null){
      return this.textColor;
    }else{
      return Theme.of(context).brightness == Brightness.light
          ? Theme.of(context).accentColor
          : Colors.black;
    }
  }

  Color _computeHeadingTextColor(context){
    if(this.headingTextColor!=null){
      return this.headingTextColor;
    }else{
      return Theme.of(context).brightness == Brightness.light
          ? Theme.of(context).accentColor
          : Colors.black;
    }
  }


  _initColorswap(context){
    SettingColors.backgroundColor=_computeBackgroundColor(context);
    SettingColors.borderColor=_computeHeadingTextColor(context).withAlpha(20);
    SettingColors.sectionHeadingTextcolor= _computeHeadingTextColor(context);
    SettingColors.tileTitleColor= _computeTextColor(context);
    SettingColors.borderLightColor=_computeHeadingTextColor(context).withAlpha(20);
    SettingColors.groupSubtitle=_computeTextColor(context).withAlpha(200);
    SettingColors.iosPressedTileColorDark=_computeTextColor(context).withBlue(5).withGreen(5).withRed(5);
    SettingColors.iosPressedTileColorLight=_computeTextColor(context).withBlue(5).withGreen(5).withRed(5);
    SettingColors.iosTileDarkColor=_computeBackgroundColor(context);
    SettingColors.itemPressedColor=_computeTextColor(context).withBlue(5).withGreen(5).withRed(5);
    SettingColors.mediumGrayColor=_computeTextColor(context).withAlpha(15);
  }



  @override
  Widget build(BuildContext context) {
    _initColorswap(context);
    return Container(
      color: SettingColors.backgroundColor,
      child: ListView.builder(
        itemCount: sections.length,
        itemBuilder: (context, index) {
          SettingsSection current = sections[index];
          SettingsSection futureOne;
          try {
            futureOne = sections[index + 1];
          } catch (e) {}

          // Add divider if title is null
          if (futureOne != null && futureOne.title != null) {
            current.showBottomDivider = false;
            return current;
          } else {
            current.showBottomDivider = true;
            return current;
          }
        },
      ),
    );
  }
}
