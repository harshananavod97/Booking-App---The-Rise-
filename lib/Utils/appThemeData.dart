import 'package:event_booking_app/Utils/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      brightness: Brightness.light,
      fontFamily: GoogleFonts.nunito().fontFamily,
      primaryColor: AppColors.PRIMARY_COLOR,
      primaryTextTheme: GoogleFonts.nunitoTextTheme(),
    );
  }
}
