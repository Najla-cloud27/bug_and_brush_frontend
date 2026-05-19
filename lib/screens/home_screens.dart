import 'package:flutter/material.dart';

import '../models/kategori_model.dart';
import '../services/api_services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<Kategori>> kategori;

  @override
  void initState() {
    super.initState();

    kategori = ApiService.getKategori();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Bug & Brush')),

      body: FutureBuilder<List<Kategori>>(
        future: kategori,

        builder: (context, snapshot) {
          // loading
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          // error
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          // data kosong
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('Data kategori kosong'));
          }

          // tampil data
          final dataKategori = snapshot.data!;

          return ListView.builder(
            itemCount: dataKategori.length,

            itemBuilder: (context, index) {
              final kategori = dataKategori[index];

              return Card(
                child: ListTile(
                  title: Text(kategori.namaKategori),
                  subtitle: Text(kategori.warna),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
