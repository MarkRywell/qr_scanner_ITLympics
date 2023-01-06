import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {

  final String textTitle;
  final String textData;

  const CustomText({
    required this.textTitle,
    required this.textData,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      height: 50,
      child: Row(
        children: [
          Expanded(
            child: SizedBox(
              width: 80,
              child: Text(textTitle,
                  style: const TextStyle(
                    fontSize: 16,
                  )),
            ),
          ),
          const SizedBox(),
          Expanded(
            child: Text(textData,
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold
                )),
          )
        ],
      ),
    );
  }
}
