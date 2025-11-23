import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:oxyid/components/component.dart';
import 'package:oxyid/extensions/extension.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffeff3f6),

        leadingWidth: 80,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: profileAvatar(),
        ),
        centerTitle: false,
        title: userTitle('John Smith', 'student'),
        actions: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 3),
            margin: EdgeInsets.only(right: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Iconsax.info_circle_copy),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Iconsax.setting_2_copy),
                ),
              ],
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: context.hp(4)),
            Text(
              'Welcome \n to ID.',
              style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: context.hp(1)),
            Flexible(
              child: GridView(
                // padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                children: [
                  GridItem(
                    imagesrc: 'assets/images/add.png',
                    text: 'Generate QR',
                  ),
                  GridItem(imagesrc: 'assets/images/qr-code.png', text: 'Scan'),
                  GridItem(
                    imagesrc: 'assets/images/store.png',
                    text: 'Market Place',
                  ),
                ],
              ),
            ),
            // SizedBox(height: context.hp(1)),
            Center(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.only(left: 40, right: 40),
                  enableFeedback: true,
                  splashFactory: InkRipple.splashFactory,
                  shadowColor: Colors.black,
                  surfaceTintColor: Colors.deepPurple[200],
                  backgroundColor: Colors.deepPurple,
                  shape: RoundedSuperellipseBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 100,
                    vertical: 20,
                  ),
                  child: Text(
                    "History",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: context.hp(8)),
          ],
        ),
      ),
    );
  }

  Row userTitle(String name, String role) {
    return Row(
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
                color: Colors.black38,
              ),
            ),
          ],
        ),
      ],
    );
  }

  CircleAvatar profileAvatar() =>
      CircleAvatar(backgroundColor: Colors.black, radius: 100);
}
