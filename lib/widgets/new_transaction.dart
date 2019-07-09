import 'package:flutter/material.dart';

class NewTransction extends StatefulWidget {
  final Function createNewTransaction;

  NewTransction(this.createNewTransaction);

  @override
  _NewTransctionState createState() => _NewTransctionState();
}

class _NewTransctionState extends State<NewTransction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }

    widget.createNewTransaction(
      titleController.text,
      double.parse(amountController.text),
    );

		Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(labelText: 'Title'),
                controller: titleController,
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Amount'),
                onSubmitted: (_) => submitData(),
                controller: amountController,
              ),
              FlatButton(
                child: Text('Add Transaction'),
                onPressed: submitData,
                textColor: Colors.green,
              ),
            ],
          ),
        ),
        elevation: 5);
  }
}
