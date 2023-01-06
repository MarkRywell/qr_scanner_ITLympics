import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CustomSplash extends StatelessWidget {
  const CustomSplash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return Container(
        width: size.width,
        height: size.height,
        padding: const EdgeInsets.all(5),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Padding(
              padding: const EdgeInsets.only(top: 100),
              child: Lottie.asset(
                  'assets/logo2.json',
                  width: size.width * 0.9,
                  height: size.height * 0.4,
                  fit: BoxFit.fill
              ),
            ),
            const SizedBox(height: 200),
            const VerticalDivider(width: 50),
            const Text("Developed by ",
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold
                )),

            Container(
              padding: const EdgeInsets.all(3),
              child: Image.asset(
                'assets/logo1.png',
                height: 100,
                width: 100,
              ),
            )
          ],
        )

    );
  }
}
