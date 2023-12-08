class ReceiptDetails {
  final String shipmentName;
  final String shipmentNumber;
  final String destinationFrom;
  final String destinationTo;

  const ReceiptDetails({
    required this.shipmentName,
    required this.shipmentNumber,
    required this.destinationFrom,
    required this.destinationTo,
  });
}

const allReceiptDetails = [
  {
    'shipmentName': 'Summer linen jacket',
    'shipmentNumber': '#NEJ20089934122231',
    'destinationFrom': 'Barcelona',
    'destinationTo': 'Paris',
  },
  {
    'shipmentName': 'Tapered-fit jeans AW',
    'shipmentNumber': '#NEJ35870264978659',
    'destinationFrom': 'Columbia',
    'destinationTo': 'Paris',
  },
  {
    'shipmentName': 'Macbook Pro M2',
    'shipmentNumber': '#NE43857340857904',
    'destinationFrom': 'Paris',
    'destinationTo': 'Morocco',
  },
  {
    'shipmentName': 'Office setup desk',
    'shipmentNumber': '#NEJ23481570754963',
    'destinationFrom': 'France',
    'destinationTo': 'Germany',
  },
];
