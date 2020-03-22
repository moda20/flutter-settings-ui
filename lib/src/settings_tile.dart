import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:settings_ui/src/cupertino_settings_item.dart';

import 'colors.dart';

enum _SettingsTileType { simple, switchTile }


///Used as an abstract for the  Setting Tile for both android and iOS
///[titleTextStyle] will override the default color inherited from the sectionList color attribute for the title
///[subtitleTextStyle] will override the default color inherited from the sectionList color attribute for the subtitle
/// Those textStyles only apply to android for the moment
class SettingsTile extends StatelessWidget {
  SettingUIColors SettingColors = new  SettingUIColors();

  final String title;
  final TextStyle titleTextStyle;
  final String subtitle;
  final TextStyle subtitleTextStyle;
  final Widget leading;
  final Widget trailing;
  final VoidCallback onTap;
  final Function(bool value) onToggle;
  final bool switchValue;
  final _SettingsTileType _tileType;

  SettingsTile({
    Key key,
    @required this.title,
    this.subtitle,
    this.leading,
    this.trailing,
    this.onTap,
    this.titleTextStyle,
    this.subtitleTextStyle
  })  : _tileType = _SettingsTileType.simple,
        onToggle = null,
        switchValue = null,
        super(key: key);

  SettingsTile.switchTile({
    Key key,
    @required this.title,
    this.subtitle,
    this.leading,
    this.trailing,
    this.titleTextStyle,
    this.subtitleTextStyle,
    @required this.onToggle,
    @required this.switchValue,
  })  : _tileType = _SettingsTileType.switchTile,
        onTap = null,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return iosTile();
    } else {
      return androidTile();
    }
  }

  Widget iosTile() {
    if (_tileType == _SettingsTileType.switchTile) {
      return CupertinoSettingsItem(
        type: SettingsItemType.toggle,
        label: title,
        leading: leading,
        switchValue: switchValue,
        onToggle: onToggle,
      );
    } else {
      return CupertinoSettingsItem(
        type: SettingsItemType.modal,
        label: title,
        value: subtitle,
        trailing: trailing,
        hasDetails: false,
        leading: leading,
        onPress: onTap,
      );
    }
  }

  Widget androidTile() {
    if (_tileType == _SettingsTileType.switchTile) {
      return SwitchListTile(
        secondary: leading,
        value: switchValue,
        onChanged: onToggle,
        title: Text(
            title,
            style: titleTextStyle==null?TextStyle(
                color: SettingColors.tileTitleColor
            ):titleTextStyle
        ),
        subtitle: subtitle != null ? Text(
            subtitle,
          style: subtitleTextStyle==null?TextStyle(
              color: SettingColors.groupSubtitle
          ):subtitleTextStyle,
        ) : null,
      );
    } else {
      return ListTile(
        title: Text(
            title,
          style: titleTextStyle==null?TextStyle(
              color: SettingColors.tileTitleColor
          ):titleTextStyle
        ),
        subtitle: subtitle != null ? Text(
            subtitle,
          style: subtitleTextStyle==null?TextStyle(
              color: SettingColors.groupSubtitle
          ):subtitleTextStyle,
        ) : null,
        leading: leading,
        trailing: trailing,
        onTap: onTap,
      );
    }
  }
}
