import 'package:event_booking_app/Utils/constants/app_colors.dart';
import 'package:event_booking_app/Utils/constants/app_text.dart';
import 'package:event_booking_app/uI/Widgets/No_Event_Component.dart';
import 'package:event_booking_app/uI/Widgets/Event_Card.dart';
import 'package:event_booking_app/uI/provider/event_manage_provider.dart';
import 'package:event_booking_app/uI/widgets/Home_Upper_Section.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final eventProvider = Provider.of<EventProvider>(context);
    final filteredEvents = eventProvider.getFilteredItems();
    // print('Filtered events count: ${filteredEvents.length}');

    return Scaffold(
      backgroundColor: AppColors.PRIMARY_COLOR,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final isPortrait = constraints.maxWidth < constraints.maxHeight;
            final screenWidth = constraints.maxWidth;
            final screenHeight = constraints.maxHeight;

            return Column(
              children: [
                SizedBox(
                  height:
                      isPortrait ? screenHeight * 0.35 : screenHeight * 0.75,
                  child: UpperSection(
                    height: screenHeight,
                    width: screenWidth,
                  ),
                ),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30.0),
                        topRight: Radius.circular(30.0),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: screenWidth * 0.03, vertical: 10),
                          child: Text(
                            UpcomingEventTitle,
                            style: TextStyle(
                              fontSize: screenWidth * 0.05,
                              fontWeight: FontWeight.bold,
                              color: AppColors.darkText,
                            ),
                          ),
                        ),
                        Expanded(
                          child: filteredEvents.isEmpty
                              ? NoEvents(screenWidth: screenWidth)
                              : ListView.builder(
                                  itemCount: filteredEvents.length,
                                  itemBuilder: (context, index) {
                                    final event = filteredEvents[index];
                                    return EventCard(
                                      artistName: event.artistName,
                                      description: event.description,
                                      date: event.date,
                                      imageUrl: event.image,
                                      location: event.location,
                                      ticketPrice: event.ticketPrice.toString(),
                                      title: event.title,
                                    );
                                  },
                                ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
