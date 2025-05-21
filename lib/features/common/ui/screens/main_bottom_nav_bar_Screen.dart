
import 'package:craftybay/features/cart/ui/screens/cart_list_screen.dart';
import 'package:craftybay/features/categories/screens/category_list_sreen.dart';
import 'package:craftybay/features/products/ui/controllers/popular_new_controller.dart';
import 'package:craftybay/features/products/ui/controllers/popular_product_controller.dart';
import 'package:craftybay/features/products/ui/controllers/popular_special_controller.dart';
import 'package:craftybay/features/wishlist/ui/screens/wish_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../auth/ui/screens/sign_in_screen.dart';
import '../../../categories/controller/category_controller.dart';
import '../../../home/ui/screens/home_screen.dart';
import '../../controllers/home_slider_controller.dart';
import '../../controllers/main_bottom_nav_bar_controller.dart';

class MainBottomNavBarScreen extends StatefulWidget {
  const MainBottomNavBarScreen({super.key});

  static const String name = '/main-nav-bar-screen';

  @override
  State<MainBottomNavBarScreen> createState() => _MainBottomNavBarScreenState();
}

class _MainBottomNavBarScreenState extends State<MainBottomNavBarScreen> {
  final List<Widget> _screens = [
    const HomeScreen(),
    const CategoryListSreen(),
    const CartListScreen(),
    const WishListScreen()
  ];

  @override
  void initState() {
    super.initState();
    Get.find<NewProductController>().getNewProductList();
    Get.find<PopularProductController>().getPopularProductList();
    Get.find<SpecialProductController>().getSpecialProductList();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<HomeSliderController>().getSliders();
      Get.find<CategoryController>().getCategoryList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<MainBottomNavBarController>(
          builder: (controller) {
            return _screens[controller.selectedIndex];
          }
      ),
      bottomNavigationBar: GetBuilder<MainBottomNavBarController>(
          builder: (controller) {
            return NavigationBar(
              selectedIndex: controller.selectedIndex,
              onDestinationSelected: (int index) {
                if (controller.shouldNavigate(index)) {
                  controller.changeIndex(index);
                } else {
                  Get.to(() => const SignInScreen());
                }
              },
              destinations: const [
                NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
                NavigationDestination(icon: Icon(Icons.category), label: 'Category'),
                NavigationDestination(icon: Icon(Icons.shopping_cart), label: 'Cart'),
                NavigationDestination(
                    icon: Icon(Icons.favorite_border), label: 'Wishlist'),
              ],
            );
          }
      ),
    );
  }
}