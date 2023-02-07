import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:qr_scanner_itlympics/views/homepage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class QrScannerServer extends StatefulWidget {
  const QrScannerServer({Key? key}) : super(key: key);

  @override
  State<QrScannerServer> createState() => _QrScannerServerState();
}

class _QrScannerServerState extends State<QrScannerServer> {

  MobileScannerController cameraController = MobileScannerController();
  bool screenOpened = false;

  void foundBarcode(Barcode barcode, MobileScannerArguments? args) async {
    if (!screenOpened) {
      final String code = barcode.rawValue ?? "----";
      screenOpened = true;

      List splitData = code.split(", ");
      confirmServer(splitData);
    }
  }

  Future confirmServer(List splitData) async {

    List serverInfo = splitData[0].split(":");

    showDialog(
        context: context,
        useSafeArea: true,
        builder: (BuildContext context) {
          Size size = MediaQuery.of(context).size;

          return AlertDialog(
            title: const Center(child: Text("Confirm Server",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
            )),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20)
            ),
            content: SizedBox(
              width: size.width * 0.7,
              height: size.height * 0.2,
              child: Column(
                children: [
                  Text(serverInfo[0],
                  style: const TextStyle(
                    fontSize: 16
                  ),),
                  const SizedBox(height: 20),
                  Text(splitData[1],
                  style: const TextStyle(
                    fontSize: 16
                  ),),
                  const SizedBox(height: 50),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: SizedBox(
                      width: size.width * 0.5,
                      height: 40,
                      child: ElevatedButton(
                          onPressed: () async {
                            final pref = await SharedPreferences.getInstance();
                            pref.setString("server", splitData[0]);
                            pref.setString("day", splitData[1]);

                            screenWasClosed();
                            Navigator.pop(context);
                            Navigator.pop(context);
                            showStatus(color: Colors.blue, text: "Server: ${splitData[0]} : ${splitData[1]}");
                            // Navigator.push(context, MaterialPageRoute(
                            //   builder: (context) => const HomePage()
                            // ));
                        },
                          child: const Text("CONFIRM",
                      style: TextStyle(
                        fontSize: 18
                      ),)),
                    ),
                  )
                ],
              ),
            ),
          );
        }
    );
  }

  screenWasClosed() {
    screenOpened = false;
  }

  showStatus({required Color color, required String text}) {    // Snackbar to show message of API Response
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text(text),
            backgroundColor: color,
            padding: const EdgeInsets.all(15),
            behavior: SnackBarBehavior.fixed,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            )
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Scan Server QR"),
          actions: [
            IconButton(
              onPressed: () =>
                  cameraController.toggleTorch(),
              icon: ValueListenableBuilder(
                  valueListenable: cameraController.torchState,
                  builder: (context, state, child) {
                    switch (state as TorchState) {
                      case TorchState.off:
                        return const Icon(Icons.flash_off, color: Colors.grey);
                      case TorchState.on:
                        return const Icon(Icons.flash_on, color: Colors.yellow);
                    }
                  }
              ),
              color: Colors.white,
              iconSize: 32.0,
            ),
            IconButton(
              onPressed: () => cameraController.switchCamera(),
              icon: ValueListenableBuilder(
                valueListenable: cameraController.cameraFacingState,
                builder: (context, state, child) {
                  switch (state as CameraFacing) {
                    case CameraFacing.front:
                      return const Icon(Icons.camera_front);
                    case CameraFacing.back:
                      return const Icon(Icons.camera_rear);
                  }
                },
              ),
              color: Colors.white,
              iconSize: 32.0,
            )
          ],
        ),
        body: Container(
            padding: EdgeInsets.all(8),
            child: Center(
                child: Container(
                    height: 250,
                    width: 250,
                    decoration: BoxDecoration(
                      border: Border.all(
                          width: 3
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: MobileScanner(
                      allowDuplicates: true,
                      controller: cameraController,
                      onDetect: foundBarcode,
                    )
                )
            )
        )
    );
  }
}
