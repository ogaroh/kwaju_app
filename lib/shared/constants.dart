import 'package:assessment/shared/theme/colors.dart';
import 'package:flutter/cupertino.dart';

const kDefaultGradient = LinearGradient(
  colors: [
    kPrimaryColor,
    kSecondaryColor,
  ],
);

const categories = [
  {
    'title': 'Kitchen/Pantry',
    'imageUrl':
        'https://api.ashfordkitchensandinteriors.co.uk/wp-content/uploads/2023/08/Ashford-Kitchens-Interiors-Choosing-the-Ideal-Kitchen-Layout-1-2048x1393-1.jpeg',
    'active': true,
  },
  {
    'title': 'Home Bar',
    'imageUrl':
        'https://www.foodandwine.com/thmb/8rtGtUmtC0KiJCDxAUXP_cfwgM8=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/GTM-Best-US-Bars-Katana-Kitten-FT-BLOG0423-fa9f2ba9925c47abb4afb0abd25d915a.jpg',
    'active': false,
  },
  {
    'title': 'Living Area',
    'imageUrl':
        'https://i.pinimg.com/736x/30/fd/fd/30fdfd121bb2074db9a4a458779631ef.jpg',
    'active': false,
  },
  {
    'title': 'Bathroom',
    'imageUrl':
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQpO4fwT5sap1PGkGFUtT1KLYVsm2PPZjs3qg&s',
    'active': false,
  },
  {
    'title': 'Other',
    'imageUrl':
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSNmZE35PwXKAe-GOstBix5cT_VuQ6kxsfEGA&s',
    'active': false,
  },
];

final options = [
  'Dairy',
  'Grains',
  'Cereal',
  'Dairy',
];

final subcategories = [
  'All',
  'Yoghurt',
  'Cheese',
  'Ghee',
];
final brands = [
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSzMXvvRWAWGgW58qimSt6VXU-JG_ezJv42kg&s',
  'https://pbs.twimg.com/profile_images/907517028784918528/tx_0mh3z_400x400.jpg',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTZywFC-c3dB_ehAzlZcMQEza4sxesPZWthXA&s',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSKBNva6drqjQcplWlOShUny6DRO8p2DkrfzA&s',
  'https://www.tendersure.africa/wp-content/uploads/2022/03/Fresha-logo-e1647586226910.png',
];
