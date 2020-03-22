import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:settings_ui/src/cupertino_settings_section.dart';
import 'package:settings_ui/src/settings_tile.dart';
import 'colors.dart';
import 'colors.dart';

// ignore: must_be_immutable
class SettingsSection extends StatelessWidget {
  SettingUIColors SettingColors = new SettingUIColors();
  final String title;
  final TextStyle titleTextStyle;
  final List<SettingsTile> tiles;
  ///[headhingTextcolor] will ovverrride the global theme from the settings list
  final Color headhingTextcolor;
  bool showBottomDivider = false;

  SettingsSection({
    Key key,
    this.tiles,
    this.title,
    this.headhingTextcolor,
    this.titleTextStyle
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS)
      return iosSection();
    else if (Platform.isAndroid)
      return androidSection(context);
    else
      return androidSection(context);
  }

  Widget iosSection() {
    return CupertinoSettingsSection(tiles,
        header: title == null ? null : Text(title));
  }

  Widget androidSection(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      title == null
          ? Container()
          : Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                title,
                style: titleTextStyle==null?TextStyle(
                    color: headhingTextcolor!=null?headhingTextcolor:SettingColors.sectionHeadingTextcolor,
                    fontWeight: FontWeight.bold):titleTextStyle,
              ),
            ),
      ListView.separated(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: tiles.length,
        separatorBuilder: (BuildContext context, int index) =>
            Divider(height: 1),
        itemBuilder: (BuildContext context, int index) {
          return tiles[index];
        },
      ),
      if (showBottomDivider) Divider(height: 1)
    ]);
  }
}
