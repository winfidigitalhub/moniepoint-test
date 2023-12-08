class Vehicles {
  final String type;
  final String status;
  final String imagePath;

  const Vehicles({
    required this.type,
    required this.status,
    required this.imagePath,
  });
}

const allVehicles = [
  {
    'type': 'Ocean Freight',
    'status': 'International',
    'imagePath': 'assets/images/oceanfreight.png',
  },
  {
    'type': 'Cargo Freight',
    'status': 'International',
    'imagePath': 'assets/images/cargofreight.png',
  },
  {
    'type': 'Air Freight',
    'status': 'International',
    'imagePath': 'assets/images/airfreight .png',
  },
];
