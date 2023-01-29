import 'package:flutter/material.dart';

Widget scoreBoard(String title, String info) {
  return Expanded(
      child: Container(
    margin: const EdgeInsets.all(26.0),
    padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 19.0),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20.0),
    ),
    child: Column(
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 8.0,
        ),
        Text(
          info,
          style: const TextStyle(
            fontSize: 34,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
  ));
}
