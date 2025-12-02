import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:oxyid/extensions/extension.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';

class GridItem extends StatelessWidget {
  final String imagesrc;
  final String text;
  final void Function()? onTap;
  // final void Function() onTap;

  const GridItem({
    super.key,
    required this.imagesrc,
    required this.text,
    this.onTap,
    // required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: Colors.white,
        boxShadow: [
          BoxShadow(color: Colors.black26, spreadRadius: 0, blurRadius: 20),
        ],
      ),
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              height: 90,
              width: 90,
              decoration: BoxDecoration(
                color: getRandomColor(),
                borderRadius: BorderRadius.circular(90),
              ),
              child: Image.asset(
                imagesrc,
                width: 48,
                height: 48,
                fit: BoxFit.cover,
              ),
            ),
            Text(
              text,
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

class HistoryItem extends StatelessWidget {
  final String titleText;
  final String subtitleText;
  const HistoryItem({
    super.key,
    // required this.leadingIcon,
    required this.titleText,
    required this.subtitleText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      child: ListTile(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
        tileColor: Colors.deepPurple[200],
        isThreeLine: true,
        contentPadding: EdgeInsets.symmetric(horizontal: 4, vertical: 0),
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15.0),
          child: Icon(Iconsax.scanning, size: 32),
        ),
        title: Text(titleText),
        subtitle: Text(subtitleText),
      ),
    );
  }
}

class CustomDialog extends StatelessWidget {
  const CustomDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();

    return SimpleDialog(
      contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 18),
      title: Text(
        'Attendance data',
        textAlign: TextAlign.center,
        style: GoogleFonts.ubuntuSansMono(fontWeight: FontWeight.bold),
      ),
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              hintText: "course code",
              hintStyle: TextStyle(
                color: Colors.black38,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black45),
                borderRadius: BorderRadius.circular(12),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black45),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ),
        SizedBox(height: 24),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,

            spacing: 12,
            children: [
              OutlinedButton(
                onPressed: () => Navigator.pop(context),
                style: OutlinedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 18, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
                child: Text(
                  'cancel',
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),

              FilledButton.tonal(
                style: FilledButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 18, vertical: 12),

                  backgroundColor: Theme.of(context).colorScheme.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
                onPressed: () {
                  Navigator.pop(context);
                  showModalBottomSheet(
                    backgroundColor: Colors.deepPurple[200],
                    enableDrag: true,
                    showDragHandle: true,
                    isDismissible: true,
                    context: context,
                    builder: (context) {
                      return Container(
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.deepPurple[200],
                        ),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(height: 10),
                              Text("your QrID."),
                              SizedBox(height: 15),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                child: myQr(controller.text),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
                child: Text(
                  'Generate ID.',
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class AdminMenuGridItem extends StatelessWidget {
  final Icon theIcon;
  final String name;
  final String theRoute;
  const AdminMenuGridItem({
    super.key,
    required this.theIcon,
    required this.name,
    required this.theRoute,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.wp(30),
      height: context.hp(5),
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerHigh,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Theme.of(context).colorScheme.primary,
          width: 2,
        ),
      ),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, theRoute);
        },
        child: Column(
          spacing: 4,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            theIcon,
            Text(
              name,
              textAlign: TextAlign.left,
              style: GoogleFonts.poppins(
                letterSpacing: 1,
                wordSpacing: 1,
                fontSize: 14,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Container profileAvatar(String? imagesrc) => Container(
  padding: EdgeInsets.all(15),
  decoration: BoxDecoration(
    color: Colors.deepPurple[300],
    shape: BoxShape.circle,
  ),
  child: Image.asset(imagesrc!),
);

Row userTitle(String name, String role) => Row(
  mainAxisAlignment: MainAxisAlignment.start,
  children: [
    Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name,
          style: GoogleFonts.notoSansDeseret(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          role,
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.deepPurpleAccent.withAlpha(100),
          ),
        ),
      ],
    ),
  ],
);

Container myQr(String data) => Container(
  child: PrettyQrView.data(
    data: data,
    decoration: const PrettyQrDecoration(
      shape: PrettyQrShape.custom(
        PrettyQrSquaresSymbol(),
        finderPattern: PrettyQrDotsSymbol(),
        alignmentPatterns: PrettyQrSquaresSymbol(),
      ),
    ),
  ),
);
