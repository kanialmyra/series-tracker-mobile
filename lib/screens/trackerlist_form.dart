import 'dart:convert';

import 'package:series_tracker/screens/menu.dart';
import 'package:flutter/material.dart';
import 'package:series_tracker/widgets/left_drawer.dart';

class TrackerFormPage extends StatefulWidget {
    const TrackerFormPage({super.key});

    @override
    State<TrackerFormPage> createState() => _TrackerFormPageState();
}

class _TrackerFormPageState extends State<TrackerFormPage> {
  final _formKey = GlobalKey<FormState>();
  String _name = "";
  int _amount = 0;
  String _description = "";
    @override
    Widget build(BuildContext context) {
        return Scaffold(
          appBar: AppBar(
              title: const Center(
                  child: Text(
                  'Form Tambah Series',
                  ),
              ),
              backgroundColor: Colors.indigo,
              foregroundColor: Colors.white,
              ),
              drawer: const LeftDrawer(),
              body: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                        Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                                decoration: InputDecoration(
                                    hintText: "Judul Series",
                                    labelText: "Judul Series",
                                    border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                    ),
                                ),
                                onChanged: (String? value) {
                                    setState(() {
                                    _name = value!;
                                    });
                                },
                                validator: (String? value) {
                                    if (value == null || value.isEmpty) {
                                    return "Judul tidak boleh kosong!";
                                    }
                                    return null;
                                },
                            ),
                        ),
                        Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                                decoration: InputDecoration(
                                    hintText: "Deskripsi",
                                    labelText: "Deskripsi",
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5.0),
                                    ),
                                ),
                                onChanged: (String? value) {
                                    setState(() {
                                    _description = value!;
                                    });
                                },
                                validator: (String? value) {
                                    if (value == null || value.isEmpty) {
                                    return "Deskripsi tidak boleh kosong!";
                                    }
                                    return null;
                                },
                            ),
                        ),
                        Align(
                            alignment: Alignment.bottomCenter,
                            child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ElevatedButton(
                                    style: ButtonStyle(
                                        backgroundColor: MaterialStateProperty.all(Colors.indigo),
                                    ),
                                    onPressed: () {
                                        if (_formKey.currentState!.validate()) {
                                            showDialog(
                                                context: context,
                                                builder: (context) {
                                                    return AlertDialog(
                                                        title: const Text('Buku berhasil tersimpan'),
                                                        content: SingleChildScrollView(
                                                            child: Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment.start,
                                                                children: [
                                                                    Text('Judul: $_name'),
                                                                    Text('Jumlah Episode: $_amount'),
                                                                    Text('Deskripsi: $_description'),
                                                                ],
                                                            ),
                                                        ),
                                                        actions: [
                                                            TextButton(
                                                                child: const Text('OK'),
                                                                onPressed: () {
                                                                    Navigator.pop(context);
                                                                    _formKey.currentState!.reset();
                                                                },
                                                            ),
                                                        ],
                                                    );
                                                },
                                            );
                                        }
                                    },
                                    child: const Text(
                                        "Save",
                                        style: TextStyle(color: Colors.white),
                                    ),
                                ),
                            ),
                        ),
                        ]
                  )
                ),
              ),
          );
    }
}