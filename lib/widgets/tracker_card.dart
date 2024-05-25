import 'package:series_tracker/screens/trackerlist_form.dart';
import 'package:flutter/material.dart';
import 'package:series_tracker/screens/list_series.dart';

class TrackerItem {
    final String name;
    final IconData icon;
    final Color color;

    TrackerItem(this.name, this.icon, this.color);
}

class TrackerCard extends StatelessWidget {
    final TrackerItem item;

    const TrackerCard(this.item, {super.key}); // Constructor

    @override
    Widget build(BuildContext context) {
    return Material(
        color: item.color,
        child: InkWell(
        // Area responsive terhadap sentuhan
        onTap: () {
            // Memunculkan SnackBar ketika diklik
            ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
                content: Text("Kamu telah menekan tombol ${item.name}!")));
            
            if (item.name == "Tambah Item") {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => TrackerFormPage()),
                );
            }
            if (item.name == "Lihat Item") {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => SeriesPage()),
                );
            }
        },
        child: Container(
            // Container untuk menyimpan Icon dan Text
            padding: const EdgeInsets.all(8),
            child: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Icon(
                    item.icon,
                    color: Colors.white,
                    size: 30.0,
                ),
                const Padding(padding: EdgeInsets.all(3)),
                Text(
                    item.name,
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.white),
                ),
                ],
            ),
            ),
        ),
        ),
    );
    }
}