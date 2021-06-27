import 'package:business_app/screens/stock_details_screen.dart';
import 'package:provider/provider.dart';
import '../screens/karnataka_details_screen.dart';
import '../screens/kerala_details_screen.dart';
import '../providers/sales_transactions.dart';
import '../models/transaction.dart';
import 'package:flutter/material.dart';

class MainDrawer extends StatefulWidget {


  @override
  _MainDrawerState createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  Widget buildListTile(
    String title,
    IconData icon,
    Function tapHandler
  ) {
    return ListTile(
      leading: Icon(icon),
      title: Text(
        title,
        style: TextStyle(
            fontFamily: 'RobotoCondensed',
            fontSize: 24,
            fontWeight: FontWeight.w700),
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: 150,
            width: double.infinity,
            color: Theme.of(context).primaryColor,
            alignment: Alignment.centerLeft,
            child: Text(
              '   Business App',
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 30,
                  color: Theme.of(context).accentColor),
            ),
          ),
          buildListTile(
            'Stock',
            Icons.shopping_bag_outlined,
            (){Navigator.of(context).pushNamed(StockDetailsScreen.routeName);}
          ),
          Container(
            height: 100,
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(left: 72),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Consumer<SaleData>(builder: (ctx,saleData,child)=>Text('Total Stocks Sold: ${saleData.totalStockSold.toStringAsFixed(0)}',
                    style: TextStyle(
                        fontFamily: 'RobotoCondensed',
                        fontSize: 18,
                        fontWeight: FontWeight.w700)),),
                Consumer<SaleData>(builder: (ctx,saleData,child)=>Text(
                    'Remaining Stocks: ${(saleData.stock - saleData.totalStockSold).toStringAsFixed(0)}',
                    style: TextStyle(
                        fontFamily: 'RobotoCondensed',
                        fontSize: 18,
                        fontWeight: FontWeight.w700)),)
              ],
            ),
          ),
          buildListTile(
            'Kerala',
            Icons.location_pin,
            (){Navigator.of(context).pushNamed(KeralaDetailsScreen.routeName,arguments: {});}
          ),
          buildListTile(
            'Karnataka',
            Icons.location_pin,
            (){Navigator.of(context).pushNamed(KarnatakaDetailsScreen.routeName);}
          ),
        ],
      ),
    );
  }
}
