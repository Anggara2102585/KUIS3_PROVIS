import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetilUMKM {
  String ?id;
  String ?nama;
  String ?jenis;
  String ?omzet_bulan;
  String ?lama_usaha;
  String ?member_sejak;
  String ?jumlah_pinjaman_sukses;

  DetilUMKM(Map<String, dynamic> json) {
    id = json['id']; 
    nama = json['nama']; 
    jenis = json['jenis'];
    omzet_bulan = json['omzet_bulan'];
    lama_usaha = json['lama_usaha'];
    member_sejak = json['member_sejak'];
    jumlah_pinjaman_sukses = json['jumlah_pinjaman_sukses'];
  }
}

class DetilUMKMCubit extends Cubit<DetilUMKM> {
  String id = "-1";
  String url = "http://178.128.17.76:8000/detil_umkm/";

  //constructor
  DetilUMKMCubit(id) : super(DetilUMKM({})) {
    this.id = id;
    fetchData();
  }
  
  //map dari json ke atribut
  void setFromJson(Map<String, dynamic> json) {
    emit(DetilUMKM(json));
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