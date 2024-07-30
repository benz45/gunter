import 'package:flutter/material.dart';

class ListButton extends StatelessWidget {
  final List<String> buttonLabels = [
    'ตั้งค่าหน้าจอ',
    'ตั้งค่าเสียง',
  ];

  ListButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: buttonLabels.length,
      itemBuilder: (context, index) {
        return ElevatedButton(
             style: ElevatedButton.styleFrom(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.zero, // No border radius
              ),
            ),
            onPressed: () {
              // Handle button press
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('${buttonLabels[index]} pressed')),
              );
            },
            child: Text(buttonLabels[index]),
          );
      },
    );
  }
}
