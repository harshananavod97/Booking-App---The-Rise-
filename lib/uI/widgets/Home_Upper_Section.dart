import 'package:date_picker_timetable/date_picker_widget.dart';
import 'package:event_booking_app/Utils/constants/app_colors.dart';
import 'package:event_booking_app/Utils/constants/app_text.dart';
import 'package:event_booking_app/uI/Styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/event_manage_provider.dart';

class UpperSection extends StatelessWidget {
  final double height;
  final double width;

  const UpperSection({
    super.key,
    required this.height,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.SECONDORY_COLOR, AppColors.PRIMARY_COLOR],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30.0),
          bottomRight: Radius.circular(30.0),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: height * 0.005),
            Center(
              child: TextComponent(
                text: appTitle,
                size: width * 0.05,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            _buildFilters(context),
          ],
        ),
      ),
    );
  }

  Widget _buildFilters(BuildContext context) {
    DatePickerController _controller = DatePickerController();
    final eventProvider = Provider.of<EventProvider>(context);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.05),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            dateTitle,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: width * 0.04,
            ),
          ),
          SizedBox(height: height * 0.005),
          DatePicker(
            controller: _controller,
            DateTime.now(),
            initialSelectedDate: DateTime.now(),
            dateTextStyle:
                const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            monthTextStyle:
                const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            dayTextStyle:
                const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            selectionColor: AppColors.PRIMARY_COLOR,
            selectedTextColor: Colors.white,
            onDateChange: (date) {
              eventProvider.updateDate(date);
            },
          ),
          SizedBox(height: height * 0.004),
          Row(
            children: [
              _buildDropdown(
                label: CategoryTitle,
                value: eventProvider.selectedCategory,
                items: CatergoryList,
                onChanged: (value) {
                  if (value != null) {
                    eventProvider.updateCategory(value);
                  }
                },
              ),
              SizedBox(width: width * 0.02),
              _buildDropdown(
                label: 'Location',
                value: eventProvider.selectedLocation,
                items: locationList,
                onChanged: (value) {
                  if (value != null) {
                    eventProvider.updateLocation(value);
                  }
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDropdown({
    required String label,
    required String? value,
    required List<String> items,
    required void Function(String?) onChanged,
  }) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: width * 0.04,
            ),
          ),
          SizedBox(height: height * 0.01),
          Container(
            height: height * 0.06,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 2,
                  blurRadius: 4,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                isExpanded: true,
                value: value,
                items: items.map((item) {
                  return DropdownMenuItem<String>(
                    value: item,
                    child: Padding(
                      padding: EdgeInsets.all(width * 0.02),
                      child: Text(item),
                    ),
                  );
                }).toList(),
                onChanged: onChanged,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
