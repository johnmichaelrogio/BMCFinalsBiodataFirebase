import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController GenderController = TextEditingController();
  final TextEditingController AgeController = TextEditingController();
  final TextEditingController BirthController = TextEditingController();
  final TextEditingController AddressController = TextEditingController();
  final TextEditingController CivilStatusController = TextEditingController();
  final TextEditingController NationalityController = TextEditingController();

  final TextEditingController PhoneController = TextEditingController();
  final TextEditingController EmailController = TextEditingController();


  final TextEditingController courseController = TextEditingController();
  final TextEditingController sectionController = TextEditingController();
  final TextEditingController YearLevelController = TextEditingController();

  final TextEditingController SkillsController = TextEditingController();
  


  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> saveData() async {
    if (nameController.text.trim().isEmpty ||
        GenderController.text.trim().isEmpty ||
        AgeController.text.trim().isEmpty ||
        BirthController.text.trim().isEmpty ||
        AddressController.text.trim().isEmpty ||
        CivilStatusController.text.trim().isEmpty ||
        NationalityController.text.trim().isEmpty ||
        PhoneController.text.trim().isEmpty ||
        EmailController.text.trim().isEmpty ||
        courseController.text.trim().isEmpty ||
        sectionController.text.trim().isEmpty ||
        YearLevelController.text.trim().isEmpty ||
        SkillsController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill in all fields')),
      );
      return;
    }

    await firestore.collection('students').add({
      'name': nameController.text.trim(),
      'Gender': GenderController.text.trim(),
      'Age': AgeController.text.trim(),
      'Birth': BirthController.text.trim(),
      'Address': AddressController.text.trim(),
      'CivilStatus': CivilStatusController.text.trim(),
      'Nationality': NationalityController.text.trim(),
      'Phone': PhoneController.text.trim(),
      'Email': EmailController.text.trim(),
      'course': courseController.text.trim(),
      'section': sectionController.text.trim(),
      'YearLevel': YearLevelController.text.trim(),
      'Skills': SkillsController.text.trim(),
      'createdAt': FieldValue.serverTimestamp(),
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Data saved successfully')),
    );

    nameController.clear();
    GenderController.clear();
    AgeController.clear();
    BirthController.clear();
    AddressController.clear();
    CivilStatusController.clear();
    NationalityController.clear();
    PhoneController.clear();
    EmailController.clear();
    courseController.clear();
    sectionController.clear();
    YearLevelController.clear();
    SkillsController.clear();
    
  }

  @override
  void dispose() {
    nameController.dispose();
    GenderController.dispose();
    AgeController.dispose();
    BirthController.dispose();
    AddressController.dispose();
    CivilStatusController.dispose();
    NationalityController.dispose();
    PhoneController.dispose();
    EmailController.dispose();
    courseController.dispose();
    sectionController.dispose();
    YearLevelController.dispose();
    SkillsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BioData'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: GenderController,
              decoration: const InputDecoration(
                labelText: 'Gender',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: AgeController,
              decoration: const InputDecoration(
                labelText: 'Age',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: BirthController,
              decoration: const InputDecoration(
                labelText: 'Birth',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: AddressController,
              decoration: const InputDecoration(
                labelText: 'Address',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: CivilStatusController,
              decoration: const InputDecoration(
                labelText: 'CivilStatus',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: NationalityController,
              decoration: const InputDecoration(
                labelText: 'Nationality',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: PhoneController,
              decoration: const InputDecoration(
                labelText: 'Phone',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: EmailController,
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: courseController,
              decoration: const InputDecoration(
                labelText: 'Course',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: sectionController,
              decoration: const InputDecoration(
                labelText: 'Section',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: YearLevelController,
              decoration: const InputDecoration(
                labelText: 'YearLevel',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: SkillsController,
              decoration: const InputDecoration(
                labelText: 'Skills',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: saveData,
              child: const Text('Save to Firebase'),
            ),
          ],
        ),
      ),
    );
  }
}