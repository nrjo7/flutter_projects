
import '../screens/sale_detail_screen.dart';
import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../providers/sales_transactions.dart';

class TransactionItem extends StatefulWidget {
  const TransactionItem({
    Key key,
    @required this.transaction,
  }) : super(key: key);

  final Transaction transaction;

  @override
  _TransactionItemState createState() => _TransactionItemState();
}

class _TransactionItemState extends State<TransactionItem> {
  void selectSale(BuildContext context) {
    Navigator.of(context).pushNamed(SaleDetailScreen.routeName, arguments: {
      'shopName': widget.transaction.shopName,
      'quantity': widget.transaction.quantity,
      'pricePerItem': widget.transaction.pricePerItem,
      'otherExpense': widget.transaction.otherExpense,
      'otherExpenseNote': widget.transaction.otherExpenseNote,
      'date': widget.transaction.date,
    });
  }
  
  void deleteSale(String id){
    Provider.of<SaleData>(context,listen: false).deleteTransaction(id);

  }
  @override
  Widget build(BuildContext context) {
    return Card(
        margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
        elevation: 5,
        child: InkWell(
          onTap: ()=>selectSale(context),
          child: ListTile(
              leading: CircleAvatar(
                  backgroundColor: Colors.amber[400],
                  radius: 30,
                  child: Padding(
                      padding: EdgeInsets.all(6),
                      child: FittedBox(
                          child: Text('\₹${widget.transaction.totalAmount}',
                              style: Theme.of(context).textTheme.title)))),
              title: Text(widget.transaction.shopName,
                  style: Theme.of(context).textTheme.title),
              subtitle: Text(
                DateFormat.yMMMMd().format(widget.transaction.date),
              ),
              trailing: MediaQuery.of(context).size.width > 460
                  ? FlatButton.icon(
                      onPressed: () => deleteSale(widget.transaction.id),
                      icon: Icon(Icons.delete),
                      textColor: Theme.of(context).errorColor,
                      label: Text('DELETE'))
                  : IconButton(
                      icon: Icon(Icons.delete),
                      color: Theme.of(context).errorColor,
                      onPressed: () =>deleteSale(widget.transaction.id),
                    )),
        ));
  }
}
