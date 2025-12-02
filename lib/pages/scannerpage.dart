import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class ScannerPage extends StatefulWidget {
  const ScannerPage({super.key});

  @override
  State<ScannerPage> createState() => _ScannerPageState();
}

class _ScannerPageState extends State<ScannerPage> {
  final MobileScannerController _scannerController = MobileScannerController();

  bool myScanning = true;

  @override
  void dispose() {
    _scannerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: MobileScanner(
        scanWindow: Rect.fromCenter(
          center: Offset(
            MediaQuery.of(context).size.width / 2,
            MediaQuery.of(context).size.height / 2,
          ),
          width: 250,
          height: 250,
        ),
        overlayBuilder: (context, constraints) {
          return ScannerOverlay();
        },
        tapToFocus: true,
        controller: _scannerController,

        onDetect: (barcodes) {
          if (!myScanning) {
            debugPrint('nothing detected');
            Future.delayed(Duration(seconds: 1), () {
              if (!context.mounted) return;
              showTopSnackBar(
                Overlay.of(context),
                CustomSnackBar.error(message: 'nothing detected'),
              );
              return;
            });
            return;
          }
          if (barcodes.barcodes.isNotEmpty) {
            final barcode = barcodes.barcodes.first;
            if (barcode.rawValue != null) {
              setState(() => myScanning = false);
              debugPrint(barcode.rawValue);
              showTopSnackBar(
                Overlay.of(context),
                CustomSnackBar.success(
                  message: barcodes.barcodes.first.rawValue!,
                ),
              );
              Future.delayed(const Duration(seconds: 1), () {
                setState(() => myScanning = true);
              });
            }
          }
        },
      ),
    );
  }
}

class ScannerOverlay extends StatelessWidget {
  const ScannerOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    return ColorFiltered(
      colorFilter: ColorFilter.mode(
        Colors.black.withAlpha(125),
        BlendMode.srcOut,
      ),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.black,
              backgroundBlendMode: BlendMode.dstOut,
            ),
          ),
          Center(
            child: Container(
              height: 250,
              width: 250,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
