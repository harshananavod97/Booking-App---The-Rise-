import 'package:event_booking_app/Utils/constants/app_colors.dart';
import 'package:event_booking_app/Utils/constants/app_text.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class BookingConfirmationScreen extends StatefulWidget {
  final String title;
  final String location;
  final DateTime date;
  final String ticketPrice;
  final String imageUrl;
  final String description;
  final String artistName;

  BookingConfirmationScreen({
    required this.description,
    required this.title,
    required this.location,
    required this.date,
    required this.ticketPrice,
    required this.imageUrl,
    required this.artistName,
  });

  @override
  _BookingConfirmationScreenState createState() =>
      _BookingConfirmationScreenState();
}

class _BookingConfirmationScreenState extends State<BookingConfirmationScreen> {
  bool showMore = false;
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final formattedDate = DateFormat('dd MMM yyyy').format(widget.date);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          bookConfirmTitle,
          style: TextStyle(color: Colors.white.withOpacity(0.8)),
        ),
        backgroundColor: AppColors.PRIMARY_COLOR,
        leading: BackButton(
          color: Colors.white.withOpacity(0.8),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: 16 / 12,
                child: Container(
                  width: double.infinity,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: SvgPicture.asset(
                      widget.imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                bookingDetail,
                style: TextStyle(
                    fontSize: screenWidth * 0.06,
                    fontWeight: FontWeight.bold,
                    color: AppColors.PRIMARY_COLOR),
              ),
              const SizedBox(height: 16),
              _buildDetailText(ArtisTitle, widget.artistName),
              const SizedBox(height: 12),
              _buildDetailText(EventTitle, widget.title),
              const SizedBox(height: 12),
              _buildDetailText(LocationTitle, widget.location),
              const SizedBox(height: 12),
              _buildDetailText(DateTitle, formattedDate),
              const SizedBox(height: 12),
              _buildDetailText(
                  ticketprice, ' ${formatCurrency(widget.ticketPrice)}'),
              const SizedBox(height: 15),
              Text(
                descriptionTitle,
                style: TextStyle(
                    fontSize: screenWidth * 0.05,
                    fontWeight: FontWeight.bold,
                    color: AppColors.PRIMARY_COLOR),
              ),
              const SizedBox(height: 8),
              _buildDescription(),
              const SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.SECONDORY_COLOR,
                    padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.1,
                      vertical: screenWidth * 0.03,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    confirmButtonTitle,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: screenWidth * 0.045,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDetailText(String label, String value) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey[300]!, width: 1),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              label,
              style: TextStyle(
                  fontSize: screenWidth * 0.045,
                  fontWeight: FontWeight.bold,
                  color: AppColors.PRIMARY_COLOR),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: TextStyle(
                  fontSize: screenWidth * 0.045,
                  color: AppColors.darkText,
                  fontWeight: FontWeight.w800),
              textAlign: TextAlign.end,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDescription() {
    final screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ExpandableText(
        widget.description,
        expandText: 'see more',
        collapseText: 'see less',
        maxLines: 5,
        textAlign: TextAlign.justify,
        style: TextStyle(
          color: AppColors.darkText,
          fontSize: screenWidth * 0.049,
          fontWeight: FontWeight.w600,
        ),
        linkColor: Colors.blue,
      ),
    );
  }

  String formatCurrency(String amount) {
    double value = double.tryParse(amount) ?? 0.0;
    final formatter = NumberFormat.currency(
      locale: 'si_LK',
      symbol: 'LKR ',
      decimalDigits: 2,
    );
    return formatter.format(value);
  }
}
