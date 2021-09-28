import 'package:allcareapp/Screen/edit_profile_page.dart';
import 'package:allcareapp/Screen/first_page.dart';
import 'package:allcareapp/Screen/second_page.dart';
import 'package:allcareapp/bloc/all_service/all_service_bloc.dart';
import 'package:allcareapp/service/SampleService.dart';
import 'package:flavor_config/flavor_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:package_info/package_info.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  final PackageInfo packageInfo = await PackageInfo.fromPlatform();
  String version = packageInfo.version;

  FlavorConfig(
    flavorName: 'dev',
    values: {
      'commonFlavorBaseUrl':
          'https://yz2eevnsle.execute-api.ap-southeast-1.amazonaws.com/dev/',
      'commonFlavorApiKey': 'xZ77221YLzab0GIVwI14tpuj3BLAZc9d7loyjk10',
      'commonAppVersion': '${version}d',
    },
  );

  SampleService sampleService = new SampleService();

  runApp(
    MultiBlocProvider(providers: [
      BlocProvider<AllServiceBloc>(
        create: (context) => AllServiceBloc(),
      )
    ], child: AllCareApp())

  );
      // MultiBlocProvider(providers: [
      //   BlocProvider<...>(
      //     create: (context) => bloc,
      //   )
      // ], child: ));
}

class AllCareApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: <String, WidgetBuilder>{
        '/firstPage': (BuildContext context) => new FirstPage(),
        '/secondPage': (BuildContext context) => new SecondPage(),
      },
      title: 'All care',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: FirstPage(),
    );
  }
}
