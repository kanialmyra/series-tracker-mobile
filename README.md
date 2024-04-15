## TUGAS 7
### Cara mengimplementasikan checklist
    (1) Membuat sebuah program Flutter baru dengan tema tracker seperti tugas-tugas sebelumnya

    Langkah-langkah:
        1. Membuat folder lokal bernama trackerseries
        2. Masuk ke direktori tersebut di command prompt
        3. Generate proyek flutter baru dengan nama series_tracker dengan menjalankan command berikut:
            flutter create series_tracker
        4. Masuk ke proyek tersebut
        5. Merapikan struktur proyek dengan langkah-langkah berikut:
        6. Membuat file bernama menu.dart pada series_tracker/lib
        7. Menambahkan kode berikut pada file tersebut:
            import 'package:flutter/material.dart';
        8. Cut baris ke-39 hingga akhir pada main.dart ke menu.dart
        9. Mengimport menu.dart pada main.dart dengan menambahkan kode berikut pada main.dart:
            import 'package:book_tracker/menu.dart';
        
    (2) Membuat tiga tombol sederhana dengan masing-masing warna berbeda yang memiliki ikon dan teks untuk:
        - Melihat daftar item (Lihat Item)
        - Menambah item (Tambah Item)
        - Logout (Logout)

    Langkah-langkah:
        1. Menghapus kata 'const' dan 'title: ...' pada main.dart
        2. Mengubah 'StatefulWidget' menjadi 'StatelessWidget' pada menu.dart
        3. Mengubah baris bawahnya menjadi:
            MyHomePage({super.key});
        4. Menghapus seluruh class _MyHomePageState
        5. Menambahkan widget build di bawah 'MyHomePage({super.key});' sebagai berikut:
            @override
            Widget build(BuildContext context) {
                return Scaffold(
                    ...
                );
            }
        6. Mendefinisikan tipe item untuk masing-masing card dengan membuat class TrackerItem pada menu.dart sebagai berikut:
            class TrackerItem {
                final String name;
                final IconData icon;

                TrackerItem(this.name, this.icon);
            }
        7. Menambagkan list buttons di bawah 'MyHomePage({super.key});' sebagai berikut:
            final List<TrackerItem> items = [
                TrackerItem("Lihat Item", Icons.library_books_rounded),
                TrackerItem("Tambah Item", Icons.library_add_rounded),
                TrackerItem("Logout", Icons.logout),
            ];
        8. Melengkapi bagian 'return Scaffold' pada menu.dart menjadi sebagai berikut:
            return Scaffold(
                appBar: AppBar(
                title: const Text(
                    'Series Tracker',
                ),
                ),
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
    
    (3) Memunculkan Snackbar dengan tulisan:
        - "Kamu telah menekan tombol Lihat Item" ketika tombol Lihat Item ditekan.
        - "Kamu telah menekan tombol Tambah Item" ketika tombol Tambah Item ditekan.
        - "Kamu telah menekan tombol Logout" ketika tombol Logout ditekan.

        Langkah-langkah:
        1. Membuat widget stateless baru untuk menampilkan card dan menampilkan snackbar dengan menambahkan class berikut pada menu.dart:
            class TrackerCard extends StatelessWidget {
                final TrackerItem item;

                const TrackerCard(this.item, {super.key}); // Constructor

                @override
                Widget build(BuildContext context) {
                return Material(
                    color: Colors.indigo.shade200,
                    child: InkWell(
                    // Area responsive terhadap sentuhan
                    onTap: () {
                        // Memunculkan SnackBar ketika diklik
                        ScaffoldMessenger.of(context)
                        ..hideCurrentSnackBar()
                        ..showSnackBar(SnackBar(
                            content: Text("Kamu telah menekan tombol ${item.name}!")));
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
        2. Menjalankan command berikut untuk mendeteksi isu pada proyek hingga tidak ada isu yang terdeteksi:
            flutter analyze

### Pertanyaan
#### Q1. Apa perbedaan utama antara stateless dan stateful widget dalam konteks pengembangan aplikasi Flutter?
    - Stateless widget: bersifat statis, artinya setelah widget tersebut dibuat, propertinya tidak dapat diubah kembali. Selain itu, stateless widget tidak menyimpan data, sehingga tidak dapat dirender ulang setelah pertama kali dibuat. Hal ini menyebabkan stateless widget memiliki performa yang lebih efisien

    - Stateful widget: sebaliknya, stateful widget bersifat dinamis, artinya artinya setelah widget tersebut dibuat, propertinya dapat diubah kembali. Stateful widget juga menyimpan data sehingga dapat dirender ulang ketika status internalnya berubah.

#### Q2. Sebutkan seluruh widget yang kamu gunakan untuk menyelesaikan tugas ini dan jelaskan fungsinya masing-masing.
    Widget yang saya gunakan pada tugas ini adalah header dan card yang akan berfungsi sebagai button. Header berfungsi untuk menampilkan judul aplikasi, sementara untuk button, untuk sementara ini hanya memiliki fungsi untuk menampilkan pesan (snackbar) pada layar jika ditekan.