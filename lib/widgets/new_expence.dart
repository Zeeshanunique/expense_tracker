import 'package:flutter/material.dart';

class NewExpence extends StatefulWidget {
  const NewExpence({super.key});

  @override
  State<NewExpence> createState() => _NewExpenceState();
}

class _NewExpenceState extends State<NewExpence> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            controller: _titleController,
            maxLength: 50,
            decoration: const InputDecoration(
              label: Text('Title'),
            ),
          ),
          TextField(
            controller: _amountController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              prefixText: '\$',
              label: Text('Amount'),
            ),
          ),
          Row(children: [
            TextButton(
              onPressed: () {},
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                print(_titleController.text);
                print(_amountController.text);
              },
              child: const Text('Save'),
            ),
          ])
        ],
      ),
    );
  }
}
