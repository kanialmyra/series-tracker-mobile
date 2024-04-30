import 'package:flutter/material.dart';
import 'package:series_tracker/widgets/left_drawer.dart';
import 'package:series_tracker/screens/trackerlist_form.dart';
import 'package:series_tracker/widgets/tracker_card.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  final List<TrackerItem> items = [
    TrackerItem("Lihat Item", Icons.library_books_rounded, Colors.indigo.shade100),
    TrackerItem("Tambah Item", Icons.library_add_rounded, Colors.indigo.shade200),
    TrackerItem("Logout", Icons.logout, Colors.indigo.shade300),
];

  @override
  Widget build(BuildContext context) {
        return Scaffold(
                appBar: AppBar(
                title: const Text(
                    'Series Tracker',
                ),
                backgroundColor: Colors.indigo,
                foregroundColor: Colors.white,
                ),
                drawer: const LeftDrawer(),
                body: SingleChildScrollView(
                // Widget wrapper yang dapat discroll
                child: Padding(
                    padding: const EdgeInsets.all(10.0), // Set padding dari halaman
                    child: Column(
                    // Widget untuk menampilkan children secara vertikal
                    children: <Widget>[
                        const Padding(
                        padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                        // Widget Text untuk menampilkan tulisan dengan alignment center dan style yang sesuai
                        child: Text(
                            'Track your watch list!', // Text yang menandakan tracker
                            textAlign: TextAlign.center,
                            style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            ),
                        ),
                        ),
                        // Grid layout
                        GridView.count(
                        // Container pada card kita.
                        primary: true,
                        padding: const EdgeInsets.all(20),
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        crossAxisCount: 3,
                        shrinkWrap: true,
                        children: items.map((TrackerItem item) {
                            // Iterasi untuk setiap item
                            return TrackerCard(item);
                        }).toList(),
                        ),
                    ],
                    ),
                ),
                ),
                );
    }
}


