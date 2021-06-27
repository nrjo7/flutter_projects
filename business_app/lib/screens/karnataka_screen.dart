
import 'package:flutter/material.dart';
import '../widgets/new_transaction.dart';
import '../widgets/transaction_list.dart';
class KarnatakaScreen extends StatefulWidget {
  static const routeName = '/karnataka-screen';
  static const stateName ='Karnataka';

  _KarnatakaScreenState createState() => _KarnatakaScreenState();
}

class _KarnatakaScreenState extends State<KarnatakaScreen> {


  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet<void>(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return  GestureDetector(
            onTap: () {},
            child: Padding(
            padding: MediaQuery.of(context).viewInsets,
            child: Wrap(
              children: <Widget>[
                NewTransaction(KarnatakaScreen.stateName),
              ],
            )),
            behavior: HitTestBehavior.opaque,
          );
      },
    );
  }



  Widget build(BuildContext context) {
    //print(userTransactions.length);
    final mediaQuery = MediaQuery.of(context);
    final isLandscape = mediaQuery.orientation == Orientation.landscape;
    final appBar = AppBar(
      title: Text('Sales in Kerala'),
    );
    final txList = Container(
        height: (mediaQuery.size.height -
                appBar.preferredSize.height -
                mediaQuery.padding.top) *
            0.88,
        child:TransactionList(KarnatakaScreen.stateName));
    return Scaffold(
          //appBar: appBar,
          // drawer: MainDrawer(totalStockSoldKL: totalQuantitySold,totalProfitKL:totalProfit,totalExpenseKL:totalExpense),
          body: SingleChildScrollView(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[txList])),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
          floatingActionButton: FloatingActionButton(backgroundColor:Colors.amber,
            child: Icon(Icons.add),
            onPressed: () => _startAddNewTransaction(context),
          ),
    );
  }
}