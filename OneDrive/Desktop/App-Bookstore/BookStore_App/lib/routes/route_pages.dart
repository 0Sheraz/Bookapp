import 'package:flutter_project_2303e/screens/about_page.dart';
import 'package:flutter_project_2303e/screens/cart_page.dart';
import 'package:flutter_project_2303e/screens/home_page.dart';
import 'package:flutter_project_2303e/screens/manage_user_page.dart';
import 'package:flutter_project_2303e/screens/order_page.dart';
import 'package:flutter_project_2303e/screens/product_view_page.dart';
import 'package:flutter_project_2303e/screens/approved_orders.dart';


class PageRoutes{
  static const String home = HomePage.routeName;
  static const String about = AboutUsPage.routeName;
  static const String muser = ManageUserPage.routeName;
  static const String prodview = ProductViewPage.routeName;
  static const String cart = CartPage.routeName;
  static const String order = OrderPage.routeName;
  static const String approvedorder = ApprovedOrderPage.routeName;  // This should now work correctly
}







