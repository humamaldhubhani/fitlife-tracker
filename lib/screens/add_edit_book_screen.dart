import 'package:flutter/material.dart';

// lib/screens/add_edit_book_screen.dart
class AddEditBookScreen extends StatelessWidget {
  const AddEditBookScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add/Edit Book')),
      body: const Center(child: Text('Add/Edit Book Screen')),
    );
  }
}
