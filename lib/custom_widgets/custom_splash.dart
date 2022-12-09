import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CustomSplash extends StatelessWidget {
  const CustomSplash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return Container(
      padding: const EdgeInsets.all(5),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Lottie.asset(
              'assets/logo2.json',
              width: size.width * 0.5,
              height: size.height * 0.3,
              fit: BoxFit.fill
          ),
          const SizedBox(height: 250),

          Row(
            children: const [
              VerticalDivider(width: 50),
              Text("Powered by ",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold
                  )),
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text("Programmer's Varsity"),
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
        ],
      ),
    );
  }
}
