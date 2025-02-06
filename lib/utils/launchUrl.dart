import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/link.dart';

Future<void> _launchURL() async {
  final Uri url = Uri.parse('https://hng.tech/hire/flutter-developers');
  if (!await launchUrl(
    url,
    mode: LaunchMode.externalApplication,
  )) {
    throw Exception('Could not launch $url');
  } else {
    try {
      await launchUrl(
        url,
        mode: LaunchMode.externalApplication,
      );
    } catch (e) {
      throw Exception('Error launching URL: $e');
    }
  }
}
