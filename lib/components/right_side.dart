import 'dart:io';

import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gunter/business/execute_bat_file.dart';
import 'package:gunter/components/window_buttons.dart';
import 'package:process_run/shell.dart';

class RightSide extends StatelessWidget {
  const RightSide({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.black26, Colors.black45],
              stops: [0.0, 1.0]),
        ),
        child: Column(
          children: [
            WindowTitleBarBox(
              child: Row(
                children: [
                  Expanded(child: MoveWindow()),
                  const WindowButtons(),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    child: const Text("ตั้งค่าหน้าจอ"),
                  ),
                  const Divider(),
                  Center(
                    child: FutureBuilder<String>(
                      future: loadAsset(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          if (snapshot.hasError) {
                            return Text('Error: ${snapshot.error}');
                          }
                          return Text('${snapshot.data}');
                        } else {
                          return CircularProgressIndicator();
                        }
                      },
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                              Radius.circular(10)), // No border radius
                        ),
                        fixedSize: const Size(200, 40)),
                    onPressed: () {
                      var shell = Shell();
                      shell.run("rcrb-setting\\run.bat").then((result) {
                        print(result);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('ตั้งค่าหน้าจอเรียบร้อย'), backgroundColor: Colors.green.shade200,),
                        );
                      }).catchError((onError) {
                        print('Shell.run error!');
                        print(onError);
                      });
                      // Process.run(
                      //     'C:\\Users\\worad\\OneDrive\\Documents\\rcrb-setting\\run.bat',
                      //     []).then((ProcessResult results) {
                      //   print(results.stdout);
                      // });
                    },
                    child: const Text(
                      "ใช้ขนาดตามหน้าจอ",
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<String> loadAsset() async {
    return await rootBundle
        .loadString('./rcrb-setting/temp/screen_resolution.conf');
  }
}
