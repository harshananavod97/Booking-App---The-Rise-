class Event {
  final String image;
  final String title;
  final String description;
  final String location;
  final String category;
  final DateTime date;
  final double ticketPrice;
  final String artistName;

  Event({
    required this.image,
    required this.title,
    required this.description,
    required this.location,
    required this.category,
    required this.date,
    required this.ticketPrice,
    required this.artistName,
  });
}
