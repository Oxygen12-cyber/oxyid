import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:oxyid/components/component.dart';
import 'package:oxyid/extensions/extension.dart';
import 'package:blobs/blobs.dart';
import 'package:supabase_flutter/supabase_flutter.dart';



class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  BlobController blobcontroller = BlobController();
  late AnimationController _myanimeController;
  late Animation<double> _bobAnime;
  late Animation<double> _swingAnime;

  

  @override
  void initState() {
    _myanimeController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 4),
    )..repeat(reverse: true);

    _bobAnime = Tween<double>(begin: -8, end: 8).animate(
      CurvedAnimation(parent: _myanimeController, curve: Curves.easeInBack),
    );

    _swingAnime = Tween<double>(begin: -10, end: 10).animate(
      CurvedAnimation(
        parent: _myanimeController,
        curve: Curves.fastLinearToSlowEaseIn,
      ),
    );

    super.initState();
  }

  @override
  void dispose() {
    _myanimeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

  final supabase = Supabase.instance.client;
  final metadata = supabase.auth.currentUser?.userMetadata;

  final fullName = metadata?['full_name'] as String? ?? 'Unknown User';
  final role = metadata?['Role'] as String? ?? 'No username';
    return Scaffold(
      resizeToAvoidBottomInset: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,

        leadingWidth: 70,
        leading: profileAvatar('assets/images/avatar_image2.png'),
        centerTitle: false,
        title: userTitle(fullName, role),
        actions: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
            margin: EdgeInsets.only(right: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 1)],
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
                  onPressed: () {
                    Navigator.pushNamed(context, '/settingsPage');
                  },
                  icon: Icon(Iconsax.setting_2_copy),
                ),
              ],
            ),
          ),
        ],
      ),
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          AnimatedBuilder(
            animation: _myanimeController,
            builder: (context, child) {
              return Stack(
                children: [
                  Positioned(
                    right: 70,
                    // right: 100,
                    top: -100,
                    child: Transform.translate(
                      offset: Offset(_bobAnime.value, _swingAnime.value),
                      child: SizedBox(
                        width: 200,
                        child: Blob.fromID(
                          id: ['15-7-957982'],
                          size: 400,
                          controller: blobcontroller,
                          styles: BlobStyles(color: Color(0xffE7CFFF)),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: -200,
                    // // right: 100,
                    bottom: -200,
                    child: Transform.translate(
                      offset: Offset(_bobAnime.value, _swingAnime.value),
                      child: SizedBox(
                        width: 200,
                        child: Blob.fromID(
                          id: ['11-8-957982'],
                          size: 400,
                          controller: blobcontroller,
                          styles: BlobStyles(color: Color(0xffE7CFFF)),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20, top: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: context.hp(15)),
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
                        text: " ID.",
                        style: GoogleFonts.chango(
                          fontSize: 60,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepPurple[600],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: context.hp(2)),
                Flexible(
                  child: GridView(
                    padding: EdgeInsets.zero,
                    // padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    children: [
                      GridItem(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) => CustomDialog(),
                          );
                        },
                        imagesrc: 'assets/icons/add.png',
                        text: 'Generate QR',
                      ),
                      GridItem(
                        onTap: () {
                          Navigator.pushNamed(context, '/streaksPage');
                        },
                        imagesrc: 'assets/icons/fire2.png',
                        text: 'Streaks',
                      ),
                      GridItem(
                        onTap: () =>
                            Navigator.pushNamed(context, '/marketPage'),
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
                      Navigator.pushNamed(context, '/historyPage');
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 3,
                      // padding: EdgeInsets.all(25),
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
                        vertical: 25,
                      ),
                      child: Text(
                        "History",
                        textAlign: TextAlign.center,
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
        ],
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
                color: Colors.deepPurpleAccent.withAlpha(100),
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
