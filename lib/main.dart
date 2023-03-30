import 'package:defender_admin/screens/contact_us.dart';
import 'package:defender_admin/screens/login_screen.dart';
import 'package:defender_admin/screens/main_screen.dart';
import 'package:defender_admin/screens/privacy_policy.dart';
import 'package:defender_admin/screens/profile_view.dart';
import 'package:defender_admin/screens/settings.dart';
import 'package:defender_admin/screens/terms_and_conditions.dart';
import 'package:defender_admin/screens/today_visitor_detailview.dart';
import 'package:defender_admin/screens/todays_visitor.dart';
import 'package:defender_admin/screens/yesterdays_visitor.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:defender_admin/screens/yesterday_visitor_detailview.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        cursorColor: Colors.deepPurple.shade600,
        primaryColor: Colors.deepPurple.shade600,
        accentColor: Colors.black,
      ),
      debugShowCheckedModeBanner: false,
      title: 'Admin',
      initialRoute: MainScreen.screenID,
      routes: {
        LoginScreen.screenID: (context) => LoginScreen(),
        ContactUsScreen.screenID: (context) => ContactUsScreen(),
        MainScreen.screenID: (context) => MainScreen(),
        TermsAndConditions.screenID: (context) => TermsAndConditions(),
        PrivacyPolicy.screenID: (context) => PrivacyPolicy(),
        SettingsScreen.screenID: (context) => SettingsScreen(),
        ProfileView.screenID: (context) => ProfileView(),
        TodaysVisitor.screenID: (context) => TodaysVisitor(),
        YesterdaysVisitor.screenID: (context) => YesterdaysVisitor(),
        YesterdayVisitorDetailView.screenID: (context) => YesterdayVisitorDetailView(),
        TodayVisitorDetailView.screenID: (context) => TodayVisitorDetailView(),
      },
    );
  }
}
