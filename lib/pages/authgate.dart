import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:oxyid/pages/homepage.dart';
import 'package:oxyid/pages/loginpage.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Supabase.instance.client.auth.onAuthStateChange,
      builder: (context, snapshot) {
        // for Loading Page
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            body: Center(child: Lottie.asset('assets/images/coming_soon.json')),
          );
        }

        // session prep
        final session = snapshot.data?.session;
        debugPrint('Session user: ${session?.user.email}');
        // redirect to homepage
        if (session != null) {
          debugPrint('trying to load homepage');
          return HomePage();
        }

        //default to loginpage onElse
        return LoginPage();
      },
    );
  }
}
