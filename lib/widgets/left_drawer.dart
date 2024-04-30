import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:series_tracker/screens/menu.dart';
import 'package:series_tracker/screens/trackerlist_form.dart';
import 'package:series_tracker/screens/trackerlist_form.dart';
import 'package:series_tracker/screens/list_series.dart';

class LeftDrawer extends StatelessWidget {
    const LeftDrawer({super.key});

    @override
        Widget build(BuildContext context) {
        return Drawer(
            child: ListView(
                children: [
                    const DrawerHeader(
                    decoration: BoxDecoration(
                        color: Colors.indigo,
                    ),
                    child: Column(
                        children: [
                            Text(
                                'Series Tracker',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                ),
                            ),
                            Padding(padding: EdgeInsets.all(10)),
                            Text(
                              "Catat seluruh progress series yang sedang kamu tonton disini!",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.white
                                )
                            ),
                        ],
                    ),
                    ),
                    ListTile(
                        leading: const Icon(Icons.home_outlined),
                        title: const Text('Halaman Utama'),
                        // Bagian redirection ke MyHomePage
                        onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MyHomePage(),
                            ));
                        },
                    ),
                    ListTile(
                        leading: const Icon(Icons.library_add_rounded),
                        title: const Text('Tambah Finished Series'),
                        // Bagian redirection ke TrackerFormPage
                        onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => TrackerFormPage(),
                            ));
                        },
                    ),
                    ListTile(
                        leading: const Icon(Icons.library_books_rounded),
                        title: const Text('Daftar Series'),
                        onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const SeriesPage()),
                            );
                        },
                    ),
                ],
            ),
        );
    }
}