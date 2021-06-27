import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'transaction_item.dart';
import '../providers/sales_transactions.dart';

class TransactionList extends StatelessWidget {
  final String stateName;
  TransactionList(this.stateName);

  @override
  Widget build(BuildContext context) {
    final salesData=Provider.of<SaleData>(context);
    final sale=salesData.items;
    return  sale.isEmpty? Center(
          child: LayoutBuilder(builder: (cntx, constraints) {
            return Column(children: <Widget>[
              SizedBox(height: 20),
              Text('No Transactions Yet',
                  style: Theme.of(context).textTheme.title),
              SizedBox(
                height: 60,
              ),
              Container(
                  height: constraints.maxHeight * 0.4,
                  child: Image.asset('assets/images/waiting.png',
                      fit: BoxFit.cover))
            ]);
          }),
        )
            : ListView.builder(
                itemCount: sale.length,
                itemBuilder: (ctx, i) {
                  if (sale[i].state==stateName){
                  return TransactionItem(
                      key: ValueKey(sale[i].id),
                      transaction: sale[i]);}
                },
              );
  }
}
