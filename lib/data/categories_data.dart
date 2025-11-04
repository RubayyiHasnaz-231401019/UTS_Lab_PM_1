import '../models/category.dart';

class CategoriesData {
  static const List<Category> categories = [
    Category(
      id: 'planets',
      name: 'Planet & Tata Surya',
      description: 'Jelajahi planet dan sistem tata surya kita',
      iconPath: 'assets/icons/categories/planet_icon.png',
      totalQuestions: 5,
    ),
    Category(
      id: 'stars',
      name: 'Bintang & Galaksi',
      description: 'Pelajari tentang bintang dan galaksi',
      iconPath: 'assets/icons/categories/galaxy_icon.png',
      totalQuestions: 5,
    ),
    Category(
      id: 'exploration',
      name: 'Eksplorasi Luar Angkasa',
      description: 'Misi luar angkasa dan astronot',
      iconPath: 'assets/icons/categories/rocket_icon.png',
      totalQuestions: 5,
    ),
    Category(
      id: 'phenomena',
      name: 'Fenomena Langit',
      description: 'Gerhana, meteor, dan fenomena langit',
      iconPath: 'assets/icons/categories/meteor_icon.png',
      totalQuestions: 5,
    ),
    Category(
      id: 'technology',
      name: 'Teknologi & Penemuan',
      description: 'Teleskop dan penemuan astronomi',
      iconPath: 'assets/icons/categories/telescope_icon.png',
      totalQuestions: 5,
    ),
  ];
}