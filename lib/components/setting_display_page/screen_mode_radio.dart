import 'package:flutter/material.dart';
import 'package:gunter/config/option_config.dart';
import 'package:gunter/provider/setting_provider.dart';
import 'package:gunter/theme.dart';
import 'package:provider/provider.dart';

class ScreenModeRadio extends StatefulWidget {
  const ScreenModeRadio({super.key});

  @override
  State<ScreenModeRadio> createState() => _ScreenModeRadioState();
}

class _ScreenModeRadioState extends State<ScreenModeRadio> {

  @override
  Widget build(BuildContext context) {
    SettingProvider settingProvider = Provider.of<SettingProvider>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: screenModeList.map(
        (e) {
          return Row(
            children: <Widget>[
              Radio<bool>(
                value: e.value,
                groupValue: settingProvider.getScreenMode.value,
                activeColor: customDarkAccentColor,
                onChanged: (bool? value) {
                 settingProvider.setScreenMode(e);
                },
              ),
              Text(e.title),
            ],
          );
        },
      ).toList(),
    );
  }
}
