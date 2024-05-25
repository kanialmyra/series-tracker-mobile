import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:series_tracker/models/series.dart';
import 'package:series_tracker/widgets/left_drawer.dart';

class SeriesPage extends StatefulWidget {
    const SeriesPage({Key? key}) : super(key: key);

    @override
    State<SeriesPage> createState() => _SeriesPageState();
}

class _SeriesPageState extends State<SeriesPage> {
Future<List<Series>> fetchSeries() async {
    var url = Uri.parse(
        'http://127.0.0.1:8000/json/');
    var response = await http.get(
        url,
        headers: {"Content-Type": "application/json"},
    );

    // melakukan decode response menjadi bentuk json
    var data = jsonDecode(utf8.decode(response.bodyBytes));

    // melakukan konversi data json menjadi object Book
    List<Series> listSeries = [];
    for (var d in data) {
        if (d != null) {
            listSeries.add(Series.fromJson(d));
        }
    }
    return listSeries;
}

@override
Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text('Series'),
        ),
        drawer: const LeftDrawer(),
        body: FutureBuilder(
            future: fetchSeries(),
            builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.data == null) {
                    return const Center(child: CircularProgressIndicator());
                } else {
                    if (!snapshot.hasData) {
                        return const Column(
                            children: [
                                Text(
                                    "Tidak ada data series.",
                                    style: TextStyle(
                                        color: Color(0xff59A5D8),
                                        fontSize: 20
                                    ),
                                ),
                                SizedBox(height: 8),
                            ],
                        );
                    } else {
                        return ListView.builder(
                            itemCount: snapshot.data!.length,
                            itemBuilder: (_, index) => Container(
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 16,
                                    vertical: 12
                                ),
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                        Text(
                                            "${snapshot.data![index].fields.name}",
                                            style: const TextStyle(
                                                fontSize: 18.0,
                                                fontWeight: FontWeight.bold,
                                            ),
                                        ),
                                        const SizedBox(height: 10),
                                        Text("${snapshot.data![index].fields.amount}"),
                                        const SizedBox(height: 10),
                                        Text("${snapshot.data![index].fields.description}")
                                    ],
                                ),
                            ),
                        );
                    }
                }
            }),
        );
    }
}