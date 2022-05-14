class KategoriModel {
  String idKategori = "";
  String kategori = "";

  KategoriModel(this.idKategori, this.kategori);

  KategoriModel.fromJson(Map<String, dynamic> json) {
    idKategori = json['id_kategori'];
    kategori = json['kategori'];
  }
}
