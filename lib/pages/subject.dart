import 'package:flutter/material.dart';
import 'package:college_app/appwidgets/navigation_drawer.dart';
import 'package:photo_view/photo_view.dart';
import '../constants/constants.dart';
import 'package:college_app/appwidgets/BottomappBar.dart';

class Subject {
  final int credit;
  final double mark;

  Subject(this.credit, this.mark);
  List<Subject> subjects = [];
}

class CalculatorPage1 extends StatefulWidget {
  const CalculatorPage1({Key? key}) : super(key: key);

  @override
  _CalculatorPage1State createState() => _CalculatorPage1State();
}

class _CalculatorPage1State extends State<CalculatorPage1> {
  List<Subject> subjects = [];
  TextEditingController creditController = TextEditingController();
  TextEditingController markController = TextEditingController();

  void addSubject() {
    int credit = int.tryParse(creditController.text) ?? 0;
    double mark = double.tryParse(markController.text) ?? 0;

    setState(() {
      subjects.add(Subject(credit, mark));
      creditController.clear();
      markController.clear();
    });
  }

  void removeSubject(int index) {
    setState(() {
      subjects.removeAt(index);
    });
  }

  double calculateGPA() {
    double totalCreditPoints = 0;
    double totalCredits = 0;

    for (var subject in subjects) {
      totalCreditPoints += subject.credit * subject.mark;
      totalCredits += subject.credit;
    }

    double gpa = totalCreditPoints / totalCredits;
    return gpa.isNaN ? 0.0 : gpa;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0E21),
      endDrawer: const NavigationDrawerWidget(),
      appBar: AppBar(
        title: const Row(
          children: [
            Icon(Icons.calculate_outlined),
            SizedBox(
              width: 10,
            ),
            Text('GPA Calculator'),
          ],
        ),
        backgroundColor: const Color(0xFF0A0E21),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 12),
                    child: TextField(
                      controller: creditController,
                      keyboardType: TextInputType.number,
                      decoration:
                          kTextFieldDecoration.copyWith(hintText: 'Credit'),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: TextField(
                    controller: markController,
                    keyboardType: TextInputType.number,
                    decoration: kTextFieldDecoration.copyWith(hintText: 'Mark'),
                  ),
                ),
                const SizedBox(width: 16),
                ElevatedButton(
                  onPressed: addSubject,
                  child: const Text('Add'),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: subjects.length,
                itemBuilder: (context, index) {
                  Subject subject = subjects[index];
                  return ListTile(
                    title: Text(
                      'Credit: ${subject.credit}, Mark: ${subject.mark}',
                      style: kheadingprogress.copyWith(
                          fontSize: 15, color: Colors.white),
                    ),
                    trailing: IconButton(
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.white,
                      ),
                      onPressed: () => removeSubject(index),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'GPA: ${calculateGPA().toStringAsFixed(2)}',
              style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            Expanded(
              child: GestureDetector(
                onDoubleTap: () {
                  Navigator.pop(
                      context); // Zoom out action, for example, you can navigate back or perform any other action.
                },
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    color: const Color(0xFF0A0E21),
                    width: double.maxFinite,
                    height: 200,
                    child: PhotoView(
                      imageProvider:
                          const AssetImage('assets/Exam-2-420x210.jpg'),
                      minScale: PhotoViewComputedScale.contained * 0.8,
                      maxScale: PhotoViewComputedScale.covered * 2,
                      initialScale: PhotoViewComputedScale.contained,
                    ),
                  ),
                ),
              ),
            ),
            const Align(
                alignment: Alignment.bottomCenter, child: BottomappBar()),
          ],
        ),
      ),
    );
  }
}
