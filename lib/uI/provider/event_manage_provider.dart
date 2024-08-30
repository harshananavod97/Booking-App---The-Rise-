import 'package:event_booking_app/Utils/constants/assets_constant.dart';
import 'package:event_booking_app/uI/model/event_model.dart';
import 'package:flutter/material.dart';

class EventProvider extends ChangeNotifier {
  String _selectedCategory = 'All';
  String _selectedLocation = 'All';
  DateTime _selectedDate = DateTime.now();

  String get selectedCategory => _selectedCategory;
  String get selectedLocation => _selectedLocation;
  DateTime get selectedDate => _selectedDate;

  void updateCategory(String category) {
    _selectedCategory = category;
    notifyListeners();
  }

  void updateLocation(String location) {
    _selectedLocation = location;
    notifyListeners();
  }

  void updateDate(DateTime date) {
    _selectedDate = date;
    notifyListeners();
  }

  List<Event> getFilteredItems() {
    List<Event> allEvents = [
      Event(
        artistName: 'DJ Mark, The Melody Makers',
        image: Assets.music1,
        title: 'Summer Beats Festival',
        description:
            'Join us for an exhilarating night of live music performances, featuring top bands and solo artists from around the country. The Summer Beats Festival promises a vibrant atmosphere, stunning visuals, and a night filled with unforgettable musical experiences.',
        location: 'Colombo',
        category: 'Music',
        date: DateTime(2024, 8, 31),
        ticketPrice: 2500.00,
      ),
      Event(
        artistName: 'Creative Visionaries',
        image: Assets.art2,
        title: 'Modern Art Exhibition',
        description:
            'Discover the latest trends in modern art at the Modern Art Exhibition 2024. Featuring works from creative visionaries, this event is a must-see for art enthusiasts.',
        location: 'Galle',
        category: 'Art',
        date: DateTime(2024, 8, 31),
        ticketPrice: 4500.00,
      ),
      Event(
        artistName: 'Tech Innovators',
        image: Assets.technology2,
        title: 'Innovate Tech Conference 2024',
        description:
            'Explore the latest trends and innovations in the tech industry at the Innovate Tech Conference 2024. This event brings together industry leaders, tech enthusiasts, and innovators to discuss emerging technologies, network with peers, and gain insights into the future of technology.',
        location: 'Kandy',
        category: 'Technology',
        date: DateTime(2024, 8, 31),
        ticketPrice: 5000.00,
      ),
      Event(
        artistName: 'Various Artists',
        image: Assets.art1,
        title: 'Art Expo 2024',
        description:
            'Experience the beauty and creativity of contemporary art at the Art Expo 2024. This exhibition features a diverse collection of artworks from renowned artists, including paintings, sculptures, and installations that challenge the boundaries of art and culture.',
        location: 'Galle',
        category: 'Art',
        date: DateTime(2024, 8, 31),
        ticketPrice: 4000.00,
      ),
      Event(
        artistName: 'DJ Mark, The Melody Makers',
        image: Assets.music2,
        title: 'Summer Beats Festival',
        description:
            'Join us for an exhilarating night of live music performances, featuring top bands and solo artists from around the country. The Summer Beats Festival promises a vibrant atmosphere, stunning visuals, and a night filled with unforgettable musical experiences.',
        location: 'Colombo',
        category: 'Music',
        date: DateTime(2024, 8, 31),
        ticketPrice: 2500.00,
      ),
      Event(
        artistName: 'Creative Visionaries',
        image: Assets.art1,
        title: 'Modern Art Exhibition',
        description:
            'Discover the latest trends in modern art at the Modern Art Exhibition 2024. Featuring works from creative visionaries, this event is a must-see for art enthusiasts.',
        location: 'Galle',
        category: 'Art',
        date: DateTime(2024, 8, 31),
        ticketPrice: 4500.00,
      ),
      Event(
        artistName: 'Tech Innovators',
        image: Assets.technology2,
        title: 'Innovate Tech Conference 2024',
        description:
            'Explore the latest trends and innovations in the tech industry at the Innovate Tech Conference 2024. This event brings together industry leaders, tech enthusiasts, and innovators to discuss emerging technologies, network with peers, and gain insights into the future of technology.',
        location: 'Kandy',
        category: 'Technology',
        date: DateTime(2024, 8, 31),
        ticketPrice: 5000.00,
      ),
      Event(
        artistName: 'DJ Alex & The Groove Masters',
        image: Assets.music2,
        title: 'Autumn Rhythm Fest',
        description:
            'Get ready for a spectacular night of music with DJ Alex and The Groove Masters. Enjoy vibrant beats and energetic performances that will keep you dancing all night long.',
        location: 'Colombo',
        category: 'Music',
        date: DateTime(2024, 9, 1),
        ticketPrice: 3000.00,
      ),
      Event(
        artistName: 'Future Tech Leaders',
        image: Assets.technology1,
        title: 'Future Tech Summit 2024',
        description:
            'Join us at the Future Tech Summit 2024 to explore cutting-edge technologies and innovations. Network with industry leaders and discover what the future holds in the world of technology.',
        location: 'Kandy',
        category: 'Technology',
        date: DateTime(2024, 9, 1),
        ticketPrice: 5500.00,
      ),
      Event(
        artistName: 'Creative Visionaries',
        image: Assets.art1,
        title: 'Modern Art Exhibition',
        description:
            'Discover the latest trends in modern art at the Modern Art Exhibition 2024. Featuring works from creative visionaries, this event is a must-see for art enthusiasts.',
        location: 'Galle',
        category: 'Art',
        date: DateTime(2024, 9, 1),
        ticketPrice: 4500.00,
      ),
      Event(
        artistName: 'The Classical Ensemble',
        image: Assets.music2,
        title: 'Classical Night Gala',
        description:
            'Enjoy an evening of classical music performances by The Classical Ensemble. This gala event promises a night of enchanting melodies and timeless compositions.',
        location: 'Negombo',
        category: 'Music',
        date: DateTime(2024, 9, 2),
        ticketPrice: 3500.00,
      ),
      Event(
        artistName: 'Tech Innovators',
        image: Assets.art2,
        title: 'AI & Robotics Expo 2024',
        description:
            'Explore the future of AI and robotics at the AI & Robotics Expo 2024. This event features cutting-edge innovations and insights from the world of artificial intelligence.',
        location: 'Jaffna',
        category: 'Technology',
        date: DateTime(2024, 9, 2),
        ticketPrice: 6000.00,
      ),
      Event(
        artistName: 'Contemporary Artists',
        image: Assets.art2,
        title: 'Contemporary Art Fair',
        description:
            'Dive into the world of contemporary art at the Contemporary Art Fair 2024. Experience the creativity and innovation of today\'s most exciting artists.',
        location: 'Matara',
        category: 'Art',
        date: DateTime(2024, 9, 2),
        ticketPrice: 4800.00,
      ),
      Event(
        artistName: 'DJ Mark, The Melody Makers',
        image: Assets.music2,
        title: 'Summer Beats Festival',
        description:
            'Join us for an exhilarating night of live music performances, featuring top bands and solo artists from around the country. The Summer Beats Festival promises a vibrant atmosphere, stunning visuals, and a night filled with unforgettable musical experiences.',
        location: 'Colombo',
        category: 'Music',
        date: DateTime(2024, 9, 3),
        ticketPrice: 2500.00,
      ),
      Event(
        artistName: 'Creative Visionaries',
        image: Assets.art1,
        title: 'Modern Art Exhibition',
        description:
            'Discover the latest trends in modern art at the Modern Art Exhibition 2024. Featuring works from creative visionaries, this event is a must-see for art enthusiasts.',
        location: 'Galle',
        category: 'Art',
        date: DateTime(2024, 9, 3),
        ticketPrice: 4500.00,
      ),
      Event(
        artistName: 'Tech Innovators',
        image: Assets.technology1,
        title: 'Innovate Tech Conference 2024',
        description:
            'Explore the latest trends and innovations in the tech industry at the Innovate Tech Conference 2024. This event brings together industry leaders, tech enthusiasts, and innovators to discuss emerging technologies, network with peers, and gain insights into the future of technology.',
        location: 'Kandy',
        category: 'Technology',
        date: DateTime(2024, 9, 3),
        ticketPrice: 5000.00,
      ),
    ];

    return allEvents.where((event) {
      final matchesCategory =
          _selectedCategory == 'All' || event.category == _selectedCategory;
      final matchesLocation =
          _selectedLocation == 'All' || event.location == _selectedLocation;

      final matchesDate = event.date.year == _selectedDate.year &&
          event.date.month == _selectedDate.month &&
          event.date.day == _selectedDate.day;

      return matchesCategory && matchesLocation && matchesDate;
    }).toList();
  }
}
