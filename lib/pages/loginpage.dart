import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:oxyid/extensions/extension.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

final supabase = Supabase.instance.client;

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  bool verifyUser(String? email, String? password) {
    if (email != null && password != null) {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(surfaceTintColor: Colors.transparent),
      body: ScrollConfiguration(
        behavior: ScrollBehavior().copyWith(scrollbars: false),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,

              children: [
                // SizedBox(height: context.hp(2)),
                SizedBox(
                  // height: 20,
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Lottie.asset('assets/images/loginanime.json'),
                      Center(
                        child: Text(
                          'ID.',
                          textAlign: TextAlign.left,
                          style: GoogleFonts.chango(
                            color: Colors.deepPurple[600],
                            fontSize: 100,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: context.hp(4)),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 24,
                        horizontal: 12,
                      ),
                      hintText: "School email",
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
                        borderSide: BorderSide(
                          width: 2,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: context.hp(2)),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: TextField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 24,
                        horizontal: 12,
                      ),
                      hintText: "Password",
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
                        borderSide: BorderSide(
                          width: 2,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: context.hp(5)),

                FilledButton.tonal(
                  style: FilledButton.styleFrom(
                    elevation: 4,
                    padding: EdgeInsets.symmetric(
                      horizontal: context.wp(20),
                      vertical: 30,
                    ),

                    backgroundColor: Theme.of(context).colorScheme.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () async {
                    debugPrint('login clicked');
                    if (verifyUser(
                      _emailController.text,
                      _passwordController.text,
                    )) {
                      try {
                        await supabase.auth.signInWithPassword(
                          email: _emailController.text,
                          password: _passwordController.text,
                        );
                        if (!context.mounted) return;
                        showTopSnackBar(
                          Overlay.of(context),
                          CustomSnackBar.success(
                            message: "Successfully Signed In",
                          ),
                        );
                        await Future.delayed(Duration(milliseconds: 350));

                        Navigator.pushNamed(context, '/homePage');
                      } on AuthException catch (err) {
                        showTopSnackBar(
                          Overlay.of(context),
                          CustomSnackBar.error(message: err.message),
                        );
                      } on SocketException catch (err) {
                        showTopSnackBar(
                          Overlay.of(context),
                          CustomSnackBar.error(
                            message:
                                "${err.message}: No internet connection....",
                          ),
                        );
                      } on TimeoutException catch (err) {
                        showTopSnackBar(
                          Overlay.of(context),
                          CustomSnackBar.error(
                            message:
                                "${err.message}\nSign In timeout\n Please retry Later.",
                          ),
                        );
                      } catch (err) {
                        showTopSnackBar(
                          Overlay.of(context),
                          CustomSnackBar.error(message: err.toString()),
                        );
                      }
                    } else {
                      showTopSnackBar(
                        Overlay.of(context),
                        CustomSnackBar.error(
                          message: "Incorrect SignIn Details",
                        ),
                      );
                    }
                  },
                  child: Text(
                    'Login',
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.inversePrimary,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                InkWell(
                  onTap: () => showTopSnackBar(
                    Overlay.of(context),
                    CustomSnackBar.info(message: "Contacting support"),
                  ),

                  child: Text(
                    "contact Support",
                    style: GoogleFonts.poppins(
                      color: Colors.black38,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
