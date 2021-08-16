import 'package:allcareapp/Screen/edit_profile_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flavor_config/flavor_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:package_info/package_info.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  final PackageInfo packageInfo = await PackageInfo.fromPlatform();
  String version = packageInfo.version;

  FlavorConfig(
    flavorName: 'dev',
    values: {
      'commonFlavorBaseUrl': '',
      'commonFlavorCognitoUrl': '',
      'commonFlavorScope': '',
      'commonFlavorUsername': '',
      'commonFlavorPassword': '',
      'commonFlavorApiKey': '',
      'commonFlavorRedirect': '',
      'commonAppVersion': '${version}d',
      'commonDeliImage': ''
    },
  );

  runApp(AllCareApp());
}

class AllCareApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'All care',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: EditProfilePage(),
    );
  }
}
