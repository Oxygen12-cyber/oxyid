import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

final supabase = Supabase.instance.client;

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 80,
        leading: IconButton.filledTonal(
          onPressed: () => Navigator.pop(context),
          padding: EdgeInsets.all(15),
          iconSize: 20,
          icon: Icon(Iconsax.arrow_left_2_copy, color: Colors.white),
          style: IconButton.styleFrom(
            backgroundColor: Theme.of(
              context,
            ).colorScheme.primary.withAlpha(120),
          ),
        ),
        centerTitle: true,
        title: Text('Settings'),
      ),
      body: Center(
        child: IconButton(
          iconSize: 48,
          onPressed: () async {
            try {
              debugPrint('trying signout...');
              await supabase.auth.signOut();
              debugPrint('signing out');
              if (!context.mounted) return;
              showTopSnackBar(
                Overlay.of(context),
                CustomSnackBar.error(message: "User Signed Out successfully"),
              );
              await Future.delayed(Duration(milliseconds: 300));
              Navigator.pushNamed(context, '/loginPage');
            } on AuthException catch (err) {
              showTopSnackBar(
                Overlay.of(context),
                CustomSnackBar.error(message: err.message),
              );
            } on SocketException catch (err) {
              showTopSnackBar(
                Overlay.of(context),
                CustomSnackBar.error(
                  message: "${err.message}: No internet connection....",
                ),
              );
            } on TimeoutException catch (err) {
              showTopSnackBar(
                Overlay.of(context),
                CustomSnackBar.error(
                  message: "${err.message}\n Timeout:\n Please retry Later.",
                ),
              );
            } catch (err) {
              showTopSnackBar(
                Overlay.of(context),
                CustomSnackBar.error(message: err.toString()),
              );
            }
          },
          icon: Icon(Icons.exit_to_app_outlined, color: Colors.black),
        ),
      ),
    );
  }
}
