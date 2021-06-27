import 'package:business_app/providers/sales_transactions.dart';
import '../screens/karnataka_details_screen.dart';
import '../screens/kerala_details_screen.dart';
import '../screens/kerala_screen.dart';
import '../screens/sale_detail_screen.dart';
import '../screens/stock_details_screen.dart';
import 'package:flutter/material.dart';
import './screens/home_screen.dart';
import 'package:provider/provider.dart';
import '../screens/karnataka_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (ctx)=>SaleData(),
          child: MaterialApp(debugShowCheckedModeBanner: false,
          title: 'Business',
          theme: ThemeData(
              primarySwatch: Colors.teal,
              accentColor: Colors.white,
              canvasColor: Color.fromRGBO(255, 254, 229, 1),
              fontFamily: 'Raleway',
              textTheme: ThemeData.light().textTheme.copyWith(
                  body1: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
                  body2: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
                  title: TextStyle(
                      fontSize: 20,
                      fontFamily: 'RobotoCondensed',
                      fontWeight: FontWeight.bold))),
          // home: CategoryScreen(),
          initialRoute: '/',
          routes: {
            '/': (ctx) => HomeScreen(),
            KeralaScreen.routeName: (ctx) => KeralaScreen(),
            KarnatakaScreen.routeName: (ctx) => KarnatakaScreen(),
            SaleDetailScreen.routeName: (_) => SaleDetailScreen(),
            KeralaDetailsScreen.routeName:(_)=>KeralaDetailsScreen(),
            KarnatakaDetailsScreen.routeName:(_)=>KarnatakaDetailsScreen(),
            StockDetailsScreen.routeName:(_)=>StockDetailsScreen(),
          },
          // onGenerateRoute: (settings) {
          //   print(settings.arguments);
          //   return MaterialPageRoute(builder: (ctx) => CategoryScreen());
          // },
          onUnknownRoute: (settings) {
            return MaterialPageRoute(builder: (ctx) => HomeScreen());
          }),
    );
  }
}
