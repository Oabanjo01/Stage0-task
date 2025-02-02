import 'dart:async';
import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  Future<void> _launchURL() async {
    final Uri url = Uri.parse('https://hng.tech/hire/flutter-developers');
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      debugPrint('Hereee === Issue');
      throw Exception('Could not launch $url');
    } else {
      try {
        debugPrint('Hereee === $url');
        await launchUrl(
          url,
          mode: LaunchMode.externalApplication,
        );
      } catch (e) {
        debugPrint('Error launching URL: $e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.amber,
          title: (Text("Welcome to Linking")),
        ),
        body: Center(
          child: MaterialButton(
            onPressed: _launchURL,
            color: Colors.amber,
            child: Text("Link to url..."),
          ),
        ),
      ),
    );
  }
}
