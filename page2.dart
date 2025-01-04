import 'package:flutter/material.dart';

class Page2 extends StatelessWidget {
  final String bookName;
  final String notes;
  final int totalPages;
  final int pagesRead;
  final int pagesPerUnit;
  final String readingSpeed;
  final bool calculateDaysAndWeeks;

  const Page2({
    Key? key,
    required this.bookName,
    required this.notes,
    required this.totalPages,
    required this.pagesRead,
    required this.pagesPerUnit,
    required this.readingSpeed,
    required this.calculateDaysAndWeeks,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Images for known books, use a placeholder for others
    final Map<String, String> bookImages = {
      '1984':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT6xOM5vDy6RcLlu7_Qx8xY5fKf-bKa3mt8rgd0LZhgrR4-oPpXpzRNXxARUOhBYwVsWWM&usqp=CAU',
      'Manuscript Found in Accra':
          'https://booksellersnz.wordpress.com/wp-content/uploads/2013/04/cv_manuscript_found_in_accra.jpg?w=144',
      'Powerless':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSKXzGwTcq9PKpChuQhmcI7l8-mjOWkoqipB_nOs7F5OXnVu2b-uF1zwZTRbEx1YbrHMok&usqp=CAU',
    };

    // Default to a placeholder image if book is unknown
    final String bookImage = bookImages[bookName] ??
        'https://via.placeholder.com/180x250.png?text=No+Image+Available';

    int remainingPages = totalPages - pagesRead;
    String timeNeeded = "";

    if (pagesPerUnit > 0) {
      double timeToFinish = remainingPages / pagesPerUnit;

      if (readingSpeed == 'hour') {
        timeNeeded = "${timeToFinish.toStringAsFixed(1)} hour(s)";
      } else if (readingSpeed == 'day') {
        timeNeeded = "${timeToFinish.toStringAsFixed(1)} day(s)";
      } else if (readingSpeed == 'week') {
        timeNeeded = "${timeToFinish.toStringAsFixed(1)} week(s)";
      }

      if (calculateDaysAndWeeks && readingSpeed == 'hour') {
        double days = timeToFinish / 24;
        double weeks = days / 7;
        timeNeeded +=
            " (~${days.toStringAsFixed(1)} day(s), ~${weeks.toStringAsFixed(1)} week(s))";
      }
    } else {
      timeNeeded = "Invalid input for pages read per unit.";
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Book Reading Tracker - Details'),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),
              Text(
                bookName == 'None of the books'
                    ? 'No Book Selected'
                    : 'Book: $bookName',
                style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal),
              ),
              const SizedBox(height: 20),
              Image.network(
                bookImage,
                height: 250,
                width: 180,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 20),
              Text(
                'You have read $pagesRead pages so far.',
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 20),
              Text(
                'You still have $remainingPages pages to read.',
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 20),
              Text(
                'You will need $timeNeeded to finish the book.',
                style: const TextStyle(
                    fontSize: 20,
                    color: Colors.green,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              Text(
                'Notes: $notes',
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Icon(Icons.navigate_before, size: 50),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

