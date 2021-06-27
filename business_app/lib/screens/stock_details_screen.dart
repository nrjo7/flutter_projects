import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/sales_transactions.dart';

class StockDetailsScreen extends StatefulWidget {
  static const routeName = '/stock-details';

  @override
  _StockDetailsScreenState createState() => _StockDetailsScreenState();
}

class _StockDetailsScreenState extends State<StockDetailsScreen> {
  final _addStockController = TextEditingController();
  final _updateStockController =TextEditingController();
  Widget buildSectionTitle(BuildContext context, String text) {
    return Container(
        child: Text(text, style: Theme.of(context).textTheme.title),
        margin: EdgeInsets.symmetric(vertical: 10));
  }

  Widget buildContainer(Widget child) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(10)),
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        height: 150,
        width: 300,
        child: child);
  }

  void _addStockSubmit() {
    Provider.of<SaleData>(context,listen: false).addstock(double.parse(_addStockController.text));
    Navigator.of(context).pop();
  }

  void _updateStockSubmit() {
    Provider.of<SaleData>(context,listen: false).addstock(double.parse(_updateStockController.text));    
    Navigator.of(context).pop();
  }

  void _addStock(BuildContext ctx) {
    showModalBottomSheet<void>(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return GestureDetector(
          onTap: () {},
          child: Padding(
              padding: MediaQuery.of(context).viewInsets,
              child: Wrap(
                children: <Widget>[
                  Card(
                      elevation: 5,
                      child: Container(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          children: <Widget>[
                            TextField(
                              decoration: InputDecoration(
                                  labelText: 'Number Of Stocks'),
                              controller: _addStockController,
                              keyboardType: TextInputType.number,
                              onSubmitted: (_) => _addStockSubmit(),
                              autofocus: true,
                            ),
                            RaisedButton(
                                color: Theme.of(context).primaryColor,
                                textColor:
                                    Theme.of(context).textTheme.button.color,
                                child: Text('Add Stock'),
                                onPressed: _addStockSubmit)
                          ],
                        ),
                      )),
                ],
              )),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  void _updateStock(BuildContext ctx) {
    showModalBottomSheet<void>(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return GestureDetector(
          onTap: () {},
          child: Padding(
              padding: MediaQuery.of(context).viewInsets,
              child: Wrap(
                children: <Widget>[
                  Card(
                      elevation: 5,
                      child: Container(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          children: <Widget>[
                            TextField(
                              decoration: InputDecoration(
                                  labelText: 'Number Of Stocks'),
                              controller: _updateStockController,
                              keyboardType: TextInputType.number,
                              onSubmitted: (_) => _updateStockSubmit(),
                              autofocus: true,
                            ),
                            RaisedButton(
                                color: Theme.of(context).primaryColor,
                                textColor:
                                    Theme.of(context).textTheme.button.color,
                                child: Text('Update Stock'),
                                onPressed: _updateStockSubmit)
                          ],
                        ),
                      )),
                ],
              )),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Stock Details')),
        body: Column(
          children: [
            Container(
                height: 250,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Colors.amber.withOpacity(0.7), Colors.amber],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight),
                    color: Colors.white,
                    border: Border.all(color: Colors.grey, width: 3),
                    borderRadius: BorderRadius.circular(10)),
                margin: EdgeInsets.all(10),
                padding:
                    EdgeInsets.only(top: 5, left: 10, right: 10, bottom: 10),
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Consumer<SaleData>(builder:(ctx,saleData,child)=> Text(
                      'Total Stocks: ${saleData.stock.toStringAsFixed(0)}',
                      textAlign: TextAlign.left,
                      style: Theme.of(context).textTheme.title,
                    ),),
                    Divider(
                      color: Colors.grey[800],
                      thickness: 2,
                    ),
                    Consumer<SaleData>(
                      builder: (ctx, saleData, child) => Text(
                          'Total Stocks Sold: ${saleData.totalStockSold.toStringAsFixed(0)}',
                          style: TextStyle(
                              fontFamily: 'RobotoCondensed',
                              fontSize: 18,
                              fontWeight: FontWeight.w700)),
                    ),
                    Divider(
                      color: Colors.grey[800],
                      thickness: 2,
                    ),
                    Consumer<SaleData>(
                      builder: (ctx, saleData, child) => Text(
                          'Remaining Stocks: ${(saleData.stock - saleData.totalStockSold).toStringAsFixed(0)}',
                          style: TextStyle(
                              fontFamily: 'RobotoCondensed',
                              fontSize: 18,
                              fontWeight: FontWeight.w700)),
                    )
                  ],
                )),
            SizedBox(height: 10),
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                      onPressed: () => _addStock(context),
                      child: Text('Add Stock'),
                      style: ButtonStyle(
                          alignment: Alignment.center,
                          backgroundColor:
                              MaterialStateProperty.all(Colors.teal[900]),
                          foregroundColor: MaterialStateProperty.all(
                              Theme.of(context).accentColor),
                          elevation: MaterialStateProperty.all(5),
                          fixedSize:
                              MaterialStateProperty.all(Size.fromWidth(130)))),
                  TextButton(
                      onPressed: () => _updateStock(context),
                      child: Text('Update Stock'),
                      style: ButtonStyle(
                          alignment: Alignment.center,
                          backgroundColor:
                              MaterialStateProperty.all(Colors.teal[900]),
                          foregroundColor: MaterialStateProperty.all(
                              Theme.of(context).accentColor),
                          elevation: MaterialStateProperty.all(5),
                          fixedSize:
                              MaterialStateProperty.all(Size.fromWidth(130)))),
                ],
              ),
            )
          ],
        ));
  }
}
