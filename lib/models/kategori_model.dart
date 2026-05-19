class Kategori {
  final int id;
  final String namaKategori;
  final String warna;

  Kategori({required this.id, required this.namaKategori, required this.warna});

  factory Kategori.fromJson(Map<String, dynamic> json) {
    return Kategori(
      id: json['id'],
      namaKategori: json['nama_kategori'],
      warna: json['warna'],
    );
  }
}
