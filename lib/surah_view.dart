import 'package:flutter/material.dart';

import 'dbhelper.dart';

class SurahView extends StatefulWidget {
  const SurahView({super.key});

  @override
  State<SurahView> createState() => _SurahViewState();
}

class _SurahViewState extends State<SurahView> {
  List<dynamic> allsurahList = [];
  @override
  void initState() {
    getAllSurah();

    super.initState();
  }

  getAllSurah() async {
    DBHelper database = DBHelper.instance;
    allsurahList = await database.getAllSurah();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: allsurahList.length,
          itemBuilder: (context, index) {
            return SurahCard(
              surahNameUrdu: allsurahList[index]['ArabicName'],
              surahNameEnglish: allsurahList[index]['EnglishName'],
              totalAyat: allsurahList[index]['NumberOfAyats'],
              description: allsurahList[index]['Meaning'],
            );
          }),
    );
  }
}

class SurahCard extends StatelessWidget {
  final String surahNameUrdu;
  final String surahNameEnglish;
  final int totalAyat;
  final String description;

  const SurahCard(
      {super.key,
      required this.surahNameUrdu,
      required this.surahNameEnglish,
      required this.totalAyat,
      required this.description});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      elevation: 8,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              surahNameUrdu,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              surahNameEnglish,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 10),
            Text(
              'Total Ayat: $totalAyat',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 10),
            Text(
              description,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
