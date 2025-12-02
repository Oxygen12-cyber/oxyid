import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:oxyid/components/component.dart';
import 'package:oxyid/extensions/extension.dart';
import 'package:blobs/blobs.dart';
import 'package:oxyid/model/model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AdminHomePage extends StatefulWidget {
  const AdminHomePage({super.key});

  @override
  State<AdminHomePage> createState() => _HomePageState();
}

class _HomePageState extends State<AdminHomePage>
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

    _bobAnime = Tween<double>(begin: -12, end: 10).animate(
      CurvedAnimation(parent: _myanimeController, curve: Curves.easeInBack),
    );

    _swingAnime = Tween<double>(begin: -8, end: 12).animate(
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
    return Scaffold(
      resizeToAvoidBottomInset: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,

        leadingWidth: 70,
        leading: profileAvatar('assets/images/avatar_image2.png'),
        centerTitle: false,
        title: userTitle('testname', "bunny"),
        actions: [
          Container(
            height: 40,
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(horizontal: 6),
            margin: EdgeInsets.only(right: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 1)],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {},
                  iconSize: 20,
                  icon: Icon(Iconsax.info_circle_copy),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/settingsPage');
                  },
                  iconSize: 20,
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
                    text: 'ID.',
                    style: GoogleFonts.chango(
                      fontSize: 90,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple[600],
                    ),
                    children: [
                      TextSpan(
                        text: "  Admin",
                        style: GoogleFonts.poppins(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: context.hp(2)),
                Flexible(
                  child: ScrollConfiguration(
                    behavior: ScrollConfiguration.of(context).copyWith(
                      scrollbars: false,
                      overscroll: false,
                      physics: const ClampingScrollPhysics(),
                    ),
                    child: GridView(
                      padding: EdgeInsets.zero,
                      // padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                      ),
                      children: [
                        GridItem(
                          onTap: () {
                            Navigator.pushNamed(context, '/scannerPage');
                          },
                          imagesrc: 'assets/icons/qr-code.png',
                          text: 'Scan',
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
                        GridItem(
                          onTap: () => moreSheet(context),
                          imagesrc: 'assets/icons/more.png',
                          text: 'More',
                        ),
                      ],
                    ),
                  ),
                ),
                // SizedBox(height: context.hp(1)),
                Center(
                  child: SizedBox(
                    width: double.infinity,
                    height: context.hp(8),
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

  Future<dynamic> moreSheet(BuildContext context) {
    return showModalBottomSheet(
      elevation: 2,
      isDismissible: true,
      isScrollControlled: true,
      enableDrag: true,
      showDragHandle: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      context: context,
      builder: (context) => DraggableScrollableSheet(
        expand: false,
        initialChildSize: 0.6,
        minChildSize: 0.6,
        maxChildSize: 0.8,
        builder: (_, context) => Align(
          alignment: Alignment.topCenter,
          child: GridView.builder(
            // padding: EdgeInsets.all(15),
            controller: context,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
            ),
            itemCount: sheetItem.length,
            itemBuilder: (context, index) {
              return AdminMenuGridItem(
                theIcon: sheetItem[index]['icon'],
                name: sheetItem[index]['name'],
                theRoute: sheetItem[index]['route'],
              );
            },
          ),
        ),
      ),
    );
  }
}
