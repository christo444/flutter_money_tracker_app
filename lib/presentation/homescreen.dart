// ignore_for_file: body_might_complete_normally_nullable, unnecessary_null_comparison, must_be_immutable, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:money_tracker_1/model/money_model.dart';
import 'package:money_tracker_1/presentation/transaction_detail_screen.dart.dart';


class ScreenHome extends StatelessWidget {
  ScreenHome({super.key});
  final _formKey = GlobalKey<FormState>();
  final ValueNotifier<List<MoneyModel>> myMoney =ValueNotifier([]);
    // MoneyModel(
    //    id: "1", 
    //    transactionNarration: "Grocery", 
    //    transactionType: "Income", 
    //    transactionAmount: "2000"),
    //     MoneyModel(
    //    id: "1", 
    //    transactionNarration: "Grocery", 
    //    transactionType: "Income", 
    //    transactionAmount: "2000"),
    //     MoneyModel(
    //    id: "1", 
    //    transactionNarration: "Grocery", 
    //    transactionType: "Income", 
    //    transactionAmount: "2000"),
    //     MoneyModel(
    //    id: "1", 
    //    transactionNarration: "Grocery", 
    //    transactionType: "Income", 
    //    transactionAmount: "2000"),
    //     MoneyModel(
    //    id: "1", 
    //    transactionNarration: "Grocery", 
    //    transactionType: "Income", 
    //    transactionAmount: "2000"),
    //     MoneyModel(
    //    id: "1", 
    //    transactionNarration: "Grocery", 
    //    transactionType: "Income", 
    //    transactionAmount: "2000"),
    //     MoneyModel(
    //    id: "1", 
    //    transactionNarration: "Groce,ry", 
    //    transactionType: "Income", 
    //    transactionAmount: "2000"),
    //     MoneyModel(
    //    id: "1", 
    //    transactionNarration: "Grocery", 
    //    transactionType: "Income", 
    //    transactionAmount: "2000"),
    //     MoneyModel(
    //    id: "1", 
    //    transactionNarration: "Grocery", 
    //    transactionType: "Income", 
    //    transactionAmount: "2000"),
    //     MoneyModel(
    //    id: "1", 
    //    transactionNarration: "Grocery", 
    //    transactionType: "Income", 
    //    transactionAmount: "2000"),
    //    MoneyModel(
    //    id: "1", 
    //    transactionNarration: "Grocery", 
    //    transactionType: "Income", 
    //    transactionAmount: "2000"),
    //    MoneyModel(
    //    id: "1", 
    //    transactionNarration: "Grocery", 
    //    transactionType: "Income", 
    //    transactionAmount: "2000"),
    //    MoneyModel(
    //    id: "1", 
    //    transactionNarration: "Grocery", 
    //    transactionType: "Income", 
    //    transactionAmount: "2000")


  final transactioncontroller = TextEditingController();
  final amountcontroller = TextEditingController();
  String? selectedType;

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        toolbarHeight: 75,
        title: Text("Money Tracker",style: TextStyle(color: Colors.white),
        ),
      ),
      body: ValueListenableBuilder(
        valueListenable: myMoney,
        builder: (context,List<MoneyModel> value,_) {
          return ListView.separated(
            itemBuilder: (context,index){
              return ListTile(
              leading: Container(
                padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            shape: BoxShape.circle
                          ),
                           child: Text((index+1).toString(),style: TextStyle(
                                                                            fontSize: 15,
                                                                            color: Colors.white
                           ),)
              ),
              title:  Row(
                children: [
                  Text(value[index].transactionNarration,style: TextStyle(
                                                                   fontSize: 25
                  ),
                  ),
                  Spacer(),
                  IconButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => TransactionDetailScreen(
                                transaction: value[index],
                              ),
                            ),
                          );
                        },
                        icon: Icon(Icons.arrow_forward_rounded, size: 18),
                      ),

                ],
              ),
              subtitle: Row(
                children: [
                  Column(
                    children: [
                      Text("Transaction Amt: ₹${value[index].transactionAmount}"),
                      Text("Transaction Type: ${value[index].transactionType}")
                    ],
                  ),
                  Spacer(),
                  IconButton(
                      onPressed: () {
                      final item = myMoney.value[index];
                      transactioncontroller.text = item.transactionNarration;
                      amountcontroller.text = item.transactionAmount;
                      selectedType = item.transactionType;

                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                            title: Center(
                              child: Text(
                                "Edit Transaction",
                                style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            content: Form(
                              key: _formKey,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  TextFormField(
                                    controller: transactioncontroller,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return "Enter a Transaction";
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                      hintText: "Transaction",
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                  SizedBox(height: 16),
                                  DropdownButtonFormField<String>(
                                    value: selectedType,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return "Select a Transaction Type";
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                      hintText: "Transaction Type",
                                      border: UnderlineInputBorder(),
                                    ),
                                    items: ['Income', 'Expense']
                                        .map((type) => DropdownMenuItem(value: type, child: Text(type)))
                                        .toList(),
                                    onChanged: (value) {
                                      selectedType = value;
                                    },
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 30),
                                    child: TextFormField(
                                      controller: amountcontroller,
                                      keyboardType: TextInputType.number,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return "Enter a Transaction";
                                        }
                                        return null;
                                      },
                                      decoration: InputDecoration(
                                        hintText: "Add Amount",
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(6),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.of(context).pop(),
                                child: Text("Cancel", style: TextStyle(color: Colors.purple)),
                              ),
                              TextButton(
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    final updated = MoneyModel(
                                      id: myMoney.value[index].id,
                                      transactionNarration: transactioncontroller.text,
                                      transactionType: selectedType!,
                                      transactionAmount: amountcontroller.text,
                                    );
                                    final updatedList = List<MoneyModel>.from(myMoney.value);
                                    updatedList[index] = updated;
                                    myMoney.value = updatedList;
                                    Navigator.of(context).pop();
                                  }
                                },
                                child: Text("Update"),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    icon: Icon(Icons.edit,size: 20,)
                    ),
                    IconButton(
                      onPressed: (){
                        showDialog(
                          context: context, 
                          builder: (context) => AlertDialog(
                            title: Text("Are you sure you want to delete"),
                            actions: [
                              TextButton(
                                onPressed: (){
                                  myMoney.value = List.from(myMoney.value)..removeAt(index);
                                  Navigator.of(context).pop();
                                }, 
                                child: Text("Yes", style: TextStyle(color: Colors.red))
                           ),
                           TextButton(
                            onPressed: (){
                              Navigator.of(context).pop();
                            }, 
                            child: Text("No", style: TextStyle(color: Colors.red)),
                          )
                          ],
                          )
                          );

                      }, 
                      icon: Icon(Icons.delete)
                      )
                ],
              ),
          
              );
            }, 
            separatorBuilder: (context,index){
              return Divider();
            }, 
            itemCount: value.length
            );
        }
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: (){
            transactioncontroller.clear();
            amountcontroller.clear();
            selectedType=null;
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Center(
          child: Text(
            "Add a Transaction",
            style: TextStyle(
               color: Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
       content: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: transactioncontroller,
                validator: (value) {
                  if(value!.isEmpty || value == null){
                    return "Enter a Transaction";
                  }
                },
                decoration: InputDecoration(
                  hintText: "Transaction",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              DropdownButtonFormField<String>(
                value: selectedType,
                validator: (value) {
                 if (value == null || value.isEmpty) {
                  return "Select a Transaction Type";
                       }
                 return null;
                  },
                decoration: InputDecoration(
                  hintText: "Transaction Type",
                  border: UnderlineInputBorder(),
                ),
                items: ['Income', 'Expense']
                    .map((type) => DropdownMenuItem(value: type, child: Text(type)))
                    .toList(),
                onChanged: (value) {
                  selectedType = value;
                },
              ),
              Padding(
                padding: EdgeInsets.only(top:30),
                child: TextFormField(
                  controller: amountcontroller,
                  keyboardType: TextInputType.number,
                  validator: (value) {
                  if (value == null || value.isEmpty){
                    return "Enter a Transaction";
                  }
                },
                  decoration: InputDecoration(
                    hintText:  "Add Amount",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6)
                      )
                      ),
                ),
              )
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text("Cancel", style: TextStyle(color: Colors.purple)
            ),
          ),
          TextButton(
              onPressed: (){
                if(_formKey.currentState!.validate()){
                  final nextId =myMoney.value.length + 1;

                  final newTransaction = MoneyModel(
                    id: nextId.toString(), 
                    transactionNarration: transactioncontroller.text, 
                    transactionType: selectedType!, 
                    transactionAmount: amountcontroller.text
                    );
                     myMoney.value = [...myMoney.value, newTransaction];
                     Navigator.of(context).pop();
                }
              }, 
              child: Text("Add")
              ),
        ],
      );
    },
  );
},
          child: Icon(Icons.add,color: Colors.white,),
          backgroundColor: Colors.blue,
          ),
    );
  }
}
