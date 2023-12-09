import 'package:flutter/material.dart';

class MealItemMetaData extends StatelessWidget {
  const MealItemMetaData({Key? key, required this.icon, required this.label})
      : super(key: key);

  final IconData icon;
  final String label;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 15, color: Colors.white),
        const SizedBox(width: 5,),
        Text(label, style: const TextStyle().copyWith(
          color: Colors.white
        ),)
      ],
    );
  }
}
