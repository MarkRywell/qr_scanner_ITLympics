import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:qr_scanner_itlympics/views/data_page.dart';

class QRScanner extends StatefulWidget {
  const QRScanner({Key? key}) : super(key: key);

  @override
  State<QRScanner> createState() => _QRScannerState();
}

class _QRScannerState extends State<QRScanner> {

  MobileScannerController cameraController = MobileScannerController();
  bool screenOpened = false;

  void foundBarcode(Barcode barcode, MobileScannerArguments? args) {

    if (!screenOpened) {
      final String code = barcode.rawValue ?? "----";
      debugPrint('Barcode found! $code');
      screenOpened = true;
      Navigator.push(context,
          MaterialPageRoute(
              builder: (context) => DataPage(screenClosed: screenWasClosed, value: code)
          ));
    }
  }

  screenWasClosed() {
    screenOpened = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("QR Code Scanner"),
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
