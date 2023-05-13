import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';

class UMKM {
  String id;
  String nama;
  String jenis;

  UMKM({required this.id, required this.nama, required this.jenis});
}

class DaftarUMKM {
  List<UMKM> listUMKM = <UMKM>[];
  
  //constructor
  DaftarUMKM(dynamic json) {
    //loop isi elemen data untuk ambil data
    for (var val in json) {
      var id = val["id"];
      var nama = val['name'];
      var jenis = val["jenis"];
      //tambahkan ke array
      listUMKM.add(UMKM(id: id, nama: nama, jenis: jenis));
    }
  }

  //map dari json ke atribut
  factory DaftarUMKM.fromJson(dynamic json) {
    return DaftarUMKM(json);
  }
}

class DaftarUMKMCubit extends Cubit<DaftarUMKM> {
  String url = "http://178.128.17.76:8000/daftar_umkm";

  //constructor
  DaftarUMKMCubit() : super(DaftarUMKM([])) {
    fetchData();
  }
  
  //map dari json ke atribut
  void setFromJson(Map<String, dynamic> json) {
    var data = json['data'];
    emit(DaftarUMKM(data));
  }

  void fetchData() async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      setFromJson(jsonDecode(response.body));
    } else {
      throw Exception('Gagal load');
    }
  }
}