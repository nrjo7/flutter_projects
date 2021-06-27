import 'package:flutter/foundation.dart';
class Transaction{
  String id;
  String state;
  String shopName;
  double quantity;
  double pricePerItem;
  double totalAmount;
  DateTime date;
  double otherExpense;
  String otherExpenseNote;
  Transaction({
    @required this.id,
    @required this.shopName,
    @required this.quantity,
    @required this.pricePerItem,
    @required this.totalAmount,
    @required this.otherExpense,
    @required this.otherExpenseNote,
    @required this.date,
    @required this.state,
  });
}
