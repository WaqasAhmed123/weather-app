import 'package:flutter/material.dart';
import 'package:weather/widgets/background_color.dart';

Widget sunTiming({sunEvent, time, context}) {
  return Container(
    width: 160,
    height: 120,
    decoration: BoxDecoration(
        gradient: gradientBackground,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFF7CBFD))),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(
                Icons.wb_sunny_rounded,
                color: Color(0xFFD9D9D9),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  sunEvent,
                  style: const TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      color: Colors.white),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            time,
            style: Theme.of(context).textTheme.titleMedium,
          )
        ],
      ),
    ),
  );
}
