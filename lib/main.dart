import 'package:event_booking_app/Utils/appThemeData.dart';
import 'package:event_booking_app/Utils/constants/app_colors.dart';
import 'package:event_booking_app/uI/Screens/home/home_screen.dart';
import 'package:event_booking_app/uI/provider/event_manage_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() {
  //Harshana Navod
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => EventProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Event Booking',
      theme: AppTheme.lightTheme,
      home: HomeScreen(),
    );
  }
}
