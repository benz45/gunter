import 'dart:convert';
import 'dart:io';

import 'package:gunter/business/encrypter_business.dart';
import 'package:gunter/config/option_config.dart';
import 'package:gunter/model/setting_model.dart';
import 'package:path_provider/path_provider.dart';

class DirectoryBusiness {
  late EncrypterBusiness _encrypterBusiness;
  DirectoryBusiness() {
    _encrypterBusiness = EncrypterBusiness();
  }

  Future<ConfigModel?> getResourseConfig() async {
    Directory directory = await getApplicationDocumentsDirectory();
    Directory settingDirectory = Directory('${directory.path}/rebirth-setting');
    if (!await settingDirectory.exists()) {
      settingDirectory.create();
    }
    String settingDirectoryPath = settingDirectory.path;
    if (settingDirectoryPath != null) {
      File resourseFile = File('$settingDirectoryPath/resourse.aes256');
      bool isResourseFileExits = await resourseFile.exists();
      if (!isResourseFileExits) {
        String jsonString = json.encode(defaultConfig);
        resourseFile.writeAsString(_encrypterBusiness.encrypt(jsonString));
        return defaultConfig;
      } else {
        String? encrypted = await resourseFile.readAsString();
        if (encrypted != null) {
          String? decrypted = _encrypterBusiness.decrypt(encrypted);
          if (decrypted != null) {
            ConfigModel setting = ConfigModel.fromJson(json.decode(decrypted));
            return setting;
          }
        }
      }
    }
  }

  Future updateResourseFile(ConfigModel? config) async {
    if (config == null) return;
    Directory directory = await getApplicationDocumentsDirectory();
    Directory settingDirectory = Directory('${directory.path}/rebirth-setting');
    if (!await settingDirectory.exists()) {
      settingDirectory.create();
    }
    String settingDirectoryPath = settingDirectory.path;
    if (settingDirectoryPath != null) {
      File resourseFile = File('$settingDirectoryPath/resourse.aes256');
      bool isResourseFileExits = await resourseFile.exists();
      if (isResourseFileExits) {
        String jsonString = json.encode(config);
        resourseFile.writeAsString(_encrypterBusiness.encrypt(jsonString));
        return config;
      }
    }
  }
}
