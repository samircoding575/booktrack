import 'package:flutter/material.dart';

class Page2 extends StatelessWidget {
  final String bookName;
  final int totalPages;
  final int pagesRead;
  final int pagesPerUnit;
  final String readingSpeed;
  final bool calculateDaysAndWeeks;

  const Page2({
    super.key,
    required this.bookName,
    required this.totalPages,
    required this.pagesRead,
    required this.pagesPerUnit,
    required this.readingSpeed,
    required this.calculateDaysAndWeeks,
  });

  @override
  Widget build(BuildContext context) {
    // Implement your reading calculations here

    return Scaffold(
      appBar: AppBar(
        title: const Text('Reading Progress'),
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: Text(
          'Book: $bookName\n'
          'Total Pages: $totalPages\n'
          'Pages Read: $pagesRead\n'
          'Pages per $readingSpeed: $pagesPerUnit',
          style: const TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
