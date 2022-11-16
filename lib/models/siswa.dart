class Siswa {
  String? nis, nama, kelas, alamat;

  Siswa({this.nis, this.nama, this.kelas, this.alamat});

  factory Siswa.fromJson(Map<String, dynamic> json) {
    return Siswa(
      nis: json['nis'],
      nama: json['nama'],
      kelas: json['kelas'],
      alamat: json['alamat'],
    );
  }
}
