// NABEGHEHA.COM

class Plant {
  final int plantId;
  final int price;
  final String size;
  final double rating;
  final int humidity;
  final String temperature;
  final String category;
  final String plantName;
  final String imageURL;
  bool isFavorated;
  final String decription;
  bool isSelected;

  Plant({
    required this.plantId,
    required this.price,
    required this.category,
    required this.plantName,
    required this.size,
    required this.rating,
    required this.humidity,
    required this.temperature,
    required this.imageURL,
    required this.isFavorated,
    required this.decription,
    required this.isSelected,
  });

  //List of Plants data
  static List<Plant> plantList = [
    Plant(
      plantId: 0,
      price: 22,
      category: 'آپارتمانی',
      plantName: 'سانسویریا',
      size: 'کوچک',
      rating: 4.5,
      humidity: 34,
      temperature: '23 - 34',
      imageURL: 'assets/images/plant-one.png',
      isFavorated: false,
      decription:
          'این گیاه یکی از بهترین گیاهان است. در بیشتر مناطق جهان رشد می کند و می تواند حتی در سخت ترین شرایط آب و هوایی نیز زنده بماند.',
      isSelected: false,
    ),
    Plant(
      plantId: 1,
      price: 11,
      category: 'محل‌کار',
      plantName: 'فیلودندرون',
      size: 'متوسط',
      rating: 4.8,
      humidity: 56,
      temperature: '19 - 22',
      imageURL: 'assets/images/plant-two.png',
      isFavorated: false,
      decription:
          'این گیاه یکی از بهترین گیاهان است. در بیشتر مناطق جهان رشد می کند و می تواند حتی در سخت ترین شرایط آب و هوایی نیز زنده بماند.',
      isSelected: false,
    ),
    Plant(
      plantId: 2,
      price: 18,
      category: 'آپارتمانی',
      plantName: 'دیزی ساحلی',
      size: 'بزرگ',
      rating: 4.7,
      humidity: 34,
      temperature: '22 - 25',
      imageURL: 'assets/images/plant-three.png',
      isFavorated: false,
      decription:
          'این گیاه یکی از بهترین گیاهان است. در بیشتر مناطق جهان رشد می کند و می تواند حتی در سخت ترین شرایط آب و هوایی نیز زنده بماند.',
      isSelected: false,
    ),
    Plant(
      plantId: 3,
      price: 30,
      category: 'محل‌کار',
      plantName: 'بلوستم بزرگ',
      size: 'کوچک',
      rating: 4.5,
      humidity: 35,
      temperature: '23 - 28',
      imageURL: 'assets/images/plant-one.png',
      isFavorated: false,
      decription:
          'این گیاه یکی از بهترین گیاهان است. در بیشتر مناطق جهان رشد می کند و می تواند حتی در سخت ترین شرایط آب و هوایی نیز زنده بماند.',
      isSelected: false,
    ),
    Plant(
      plantId: 4,
      price: 24,
      category: 'پیشنهادی',
      plantName: 'بلوستم بزرگ',
      size: 'بزرگ',
      rating: 4.1,
      humidity: 66,
      temperature: '12 - 16',
      imageURL: 'assets/images/plant-four.png',
      isFavorated: false,
      decription:
          'این گیاه یکی از بهترین گیاهان است. در بیشتر مناطق جهان رشد می کند و می تواند حتی در سخت ترین شرایط آب و هوایی نیز زنده بماند.',
      isSelected: false,
    ),
    Plant(
      plantId: 5,
      price: 24,
      category: 'محل‌کار',
      plantName: 'مریم گلی',
      size: 'متوسط',
      rating: 4.4,
      humidity: 36,
      temperature: '15 - 18',
      imageURL: 'assets/images/plant-five.png',
      isFavorated: false,
      decription:
          'این گیاه یکی از بهترین گیاهان است. در بیشتر مناطق جهان رشد می کند و می تواند حتی در سخت ترین شرایط آب و هوایی نیز زنده بماند.',
      isSelected: false,
    ),
    Plant(
      plantId: 6,
      price: 19,
      category: 'باغچه‌ایی',
      plantName: 'پلمباگو',
      size: 'کوچک',
      rating: 4.2,
      humidity: 46,
      temperature: '23 - 26',
      imageURL: 'assets/images/plant-six.png',
      isFavorated: false,
      decription:
          'این گیاه یکی از بهترین گیاهان است. در بیشتر مناطق جهان رشد می کند و می تواند حتی در سخت ترین شرایط آب و هوایی نیز زنده بماند.',
      isSelected: false,
    ),
    Plant(
      plantId: 7,
      price: 23,
      category: 'باغچه‌ایی',
      plantName: 'تریتونیا',
      size: 'متوسط',
      rating: 4.5,
      humidity: 34,
      temperature: '21 - 24',
      imageURL: 'assets/images/plant-seven.png',
      isFavorated: false,
      decription:
          'این گیاه یکی از بهترین گیاهان است. در بیشتر مناطق جهان رشد می کند و می تواند حتی در سخت ترین شرایط آب و هوایی نیز زنده بماند.',
      isSelected: false,
    ),
    Plant(
      plantId: 8,
      price: 46,
      category: 'پیشنهادی',
      plantName: 'تریتونیا',
      size: 'متوسط',
      rating: 4.7,
      humidity: 46,
      temperature: '21 - 25',
      imageURL: 'assets/images/plant-eight.png',
      isFavorated: false,
      decription:
          'این گیاه یکی از بهترین گیاهان است. در بیشتر مناطق جهان رشد می کند و می تواند حتی در سخت ترین شرایط آب و هوایی نیز زنده بماند.',
      isSelected: false,
    ),
  ];

  //Get the favorated items
  static List<Plant> getFavoritedPlants() {
    List<Plant> travelList = Plant.plantList;
    return travelList.where((element) => element.isFavorated == true).toList();
  }

  //Get the cart items
  static List<Plant> addedToCartPlants() {
    List<Plant> selectedPlants = Plant.plantList;
    return selectedPlants
        .where((element) => element.isSelected == true)
        .toList();
  }
}
