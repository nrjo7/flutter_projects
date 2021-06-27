import 'package:flutter/cupertino.dart';

import '../models/transaction.dart';

class SaleData with ChangeNotifier {
  double _stock = 300;

  List<Transaction> _saleTransactions = [
    Transaction(
        date: DateTime(2021, 6, 7, 17),
        id: '1',
        shopName: 'Maveli Stores',
        state: 'Kerala',
        quantity: 10,
        pricePerItem: 50,
        totalAmount: 500,
        otherExpense: 50,
        otherExpenseNote: 'Petrol'),
    // Transaction(
    //     date: DateTime(2021, 6, 7, 17),
    //     id: '2',
    //     shopName: 'KK Stores',
    //     state: 'Kerala',
    //     quantity: 10,
    //     pricePerItem: 50,
    //     totalAmount: 500,
    //     otherExpense: 50,
    //     otherExpenseNote: 'Petrol'),
    Transaction(
        date: DateTime(2021, 6, 7, 17),
        id: '3',
        shopName: 'PP Stores',
        state: 'Karnataka',
        quantity: 10,
        pricePerItem: 50,
        totalAmount: 500,
        otherExpense: 50,
        otherExpenseNote: 'Petrol'),
    // Transaction(
    //     date: DateTime(2021, 6, 7, 17),
    //     id: '4',
    //     shopName: 'HH Stores',
    //     state: 'Kerala',
    //     quantity: 10,
    //     pricePerItem: 50,
    //     totalAmount: 500,
    //     otherExpense: 50,
    //     otherExpenseNote: 'Petrol'),
    // Transaction(
    //     date: DateTime(2021, 6, 7, 17),
    //     id: '5',
    //     shopName: 'MKK Stores',
    //     state: 'Kerala',
    //     quantity: 10,
    //     pricePerItem: 50,
    //     totalAmount: 500,
    //     otherExpense: 50,
    //     otherExpenseNote: 'Petrol'),
    // Transaction(
    //     date: DateTime(2021, 6, 7, 17),
    //     id: '6',
    //     shopName: 'CC Stores',
    //     state: 'Karnataka',
    //     quantity: 10,
    //     pricePerItem: 50,
    //     totalAmount: 500,
    //     otherExpense: 50,
    //     otherExpenseNote: 'Petrol'),
    // Transaction(
    //     date: DateTime(2021, 6, 7, 17),
    //     id: '7',
    //     shopName: 'Oreo Stores',
    //     state: 'Karnataka',
    //     quantity: 10,
    //     pricePerItem: 50,
    //     totalAmount: 500,
    //     otherExpense: 50,
    //     otherExpenseNote: 'Petrol'),
    // Transaction(
    //     date: DateTime(2021, 6, 7, 17),
    //     id: '8',
    //     shopName: 'Supplyco Stores',
    //     state: 'Kerala',
    //     quantity: 10,
    //     pricePerItem: 50,
    //     totalAmount: 500,
    //     otherExpense: 50,
    //     otherExpenseNote: 'Petrol'),
    // Transaction(
    //     date: DateTime(2021, 6, 7, 17),
    //     id: '9',
    //     shopName: 'MK Stores',
    //     state: 'Karnataka',
    //     quantity: 10,
    //     pricePerItem: 50,
    //     totalAmount: 500,
    //     otherExpense: 50,
    //     otherExpenseNote: 'Petrol'),
    // Transaction(
    //     date: DateTime(2021, 6, 7, 17),
    //     id: '10',
    //     shopName: 'Banglore Stores',
    //     state: 'Karnataka',
    //     quantity: 10,
    //     pricePerItem: 50,
    //     totalAmount: 500,
    //     otherExpense: 50,
    //     otherExpenseNote: 'Petrol'),
    // Transaction(
    //     date: DateTime(2021, 6, 7, 17),
    //     id: '11',
    //     shopName: 'MNP Stores',
    //     state: 'Karnataka',
    //     quantity: 10,
    //     pricePerItem: 50,
    //     totalAmount: 500,
    //     otherExpense: 50,
    //     otherExpenseNote: 'Petrol'),
  ];

  double get stock{
    return _stock;
  }
  List<Transaction> get items {
    return [..._saleTransactions];
  }
  List<Transaction> get keralaSaleList{
    return _saleTransactions.where((tx) {
      return tx.state == 'Kerala';
    }).toList();
  }
  List<Transaction> get karnatakaSaleList {
    return _saleTransactions.where((tx) {
      return tx.state == 'Karnataka';
    }).toList();
  }

  double get totalStockSold {
    double totalQty = 0.0;
    for (var i = 0; i < _saleTransactions.length; i++) {
      if (_saleTransactions.length != 0) {
        totalQty += _saleTransactions[i].quantity;
      }
    }
    return totalQty;
  }

  double get totalStockSoldKerala {
    double totalQty = 0.0;
    for (var i = 0; i < keralaSaleList.length; i++) {
      if (keralaSaleList.length != 0) {
        totalQty += keralaSaleList[i].quantity;
      }
    }
    return totalQty;
  }
  double get totalProfitKerala {
    double totalProfit = 0.0;
    for (var i = 0; i < keralaSaleList.length; i++) {
      if (keralaSaleList.length != 0) {
        totalProfit += keralaSaleList[i].totalAmount;
      }
    }
    return totalProfit;
  }
  double get totalExpenseKerala {
    double totalExpense = 0.0;
    for (var i = 0; i < keralaSaleList.length; i++) {
      if (keralaSaleList.length != 0) {
        totalExpense += keralaSaleList[i].otherExpense;
      }
    }
    return totalExpense;
  }

  double get totalStockSoldKarnataka {
    double totalQty = 0.0;
    for (var i = 0; i < karnatakaSaleList.length; i++) {
      if (karnatakaSaleList.length != 0) {
        totalQty += karnatakaSaleList[i].quantity;
      }
    }
    return totalQty;
  }
  double get totalProfitKarnataka {
    double totalProfit = 0.0;
    for (var i = 0; i < karnatakaSaleList.length; i++) {
      if (karnatakaSaleList.length != 0) {
        totalProfit += karnatakaSaleList[i].totalAmount;
      }
    }
    return totalProfit;
  }

  double get totalExpenseKarnataka {
    double totalExpense = 0.0;
    for (var i = 0; i < karnatakaSaleList.length; i++) {
      if (karnatakaSaleList.length != 0) {
        totalExpense += karnatakaSaleList[i].otherExpense;
      }
    }
    return totalExpense;
  }

  void addnewTx(
      String txShopName,
      double txquantity,
      double txPricePErItem,
      double txOtherExpense,
      String txOtherExpenseNote,
      chosenDate,
      String chosenState) {
    final newTx = Transaction(
        shopName: txShopName,
        quantity: txquantity,
        pricePerItem: txPricePErItem,
        otherExpense: txOtherExpense,
        otherExpenseNote: txOtherExpenseNote,
        date: chosenDate,
        totalAmount: txquantity * txPricePErItem,
        state: chosenState,
        id: DateTime.now().toString());

    _saleTransactions.add(newTx);
    notifyListeners();
  }

  void deleteTransaction(String id) {
    _saleTransactions.removeWhere((tx) => tx.id == id);
    notifyListeners();
  }
  
  void addstock(double addedstock){
    _stock+=addedstock;
    notifyListeners();
  }

  void updatestock(double updatedstock){
    _stock=updatedstock;
    notifyListeners();
  }
}
