import 'package:event_booking_app/Utils/constants/assets_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NoEvents extends StatelessWidget {
  const NoEvents({
    super.key,
    required this.screenWidth,
  });

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: screenWidth * 0.8,
      child: SvgPicture.asset(
        color: Colors.grey,
        Assets.noevent,
        fit: BoxFit.cover,
      ),
    );
  }
}
