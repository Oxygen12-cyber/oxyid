import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:oxyid/components/component.dart';
import 'package:oxyid/extensions/extension.dart';
import 'package:oxyid/pages/historypage.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffeff3f6),

        leadingWidth: 70,
        leading: profileAvatar('assets/images/avatar_image2.png'),
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
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: context.hp(8)),
            RichText(
              text: TextSpan(
                text: 'Welcome\nto',
                style: GoogleFonts.montserrat(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                children: [
                  TextSpan(
                    text: " OxyID.",
                    style: GoogleFonts.montserrat(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple[600],
                    ),
                  ),
                ],
              ),
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
                    imagesrc: 'assets/icons/add.png',
                    text: 'Generate QR',
                  ),
                  GridItem(imagesrc: 'assets/icons/qr-code.png', text: 'Scan'),
                  GridItem(
                    imagesrc: 'assets/icons/store.png',
                    text: 'Market Place',
                  ),
                ],
              ),
            ),
            // SizedBox(height: context.hp(1)),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HistoryPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 150, vertical: 20),
                  enableFeedback: true,
                  splashFactory: InkRipple.splashFactory,
                  shadowColor: Colors.black,
                  surfaceTintColor: Colors.deepPurple[200],
                  backgroundColor: Colors.deepPurple,
                  shape: RoundedSuperellipseBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
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

  Container profileAvatar(String? imagesrc) => Container(
    padding: EdgeInsets.all(15),
    decoration: BoxDecoration(
      color: Colors.deepPurple[300],
      shape: BoxShape.circle,
    ),
    child: Image.asset(imagesrc!),
  );
}
