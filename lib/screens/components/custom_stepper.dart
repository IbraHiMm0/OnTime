import 'package:flutter/material.dart';
import 'package:ontimeapp/presentation/resources/color_manager.dart';
import 'package:ontimeapp/presentation/resources/styles_manager.dart';
import 'package:ontimeapp/presentation/resources/values_manager.dart';

class CustomStepper extends StatelessWidget {
  const CustomStepper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                margin: const EdgeInsets.only(left: 8, right: 5),
                height: 18,
                width: 18,
                decoration: BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.black)),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(left: 17),
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
            decoration: const BoxDecoration(
                border: Border(
                    left: BorderSide(
                      color: Colors.red,
                    ))),
          ),
        ],
      ),
    );
  }
}