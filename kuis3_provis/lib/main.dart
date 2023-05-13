import 'package:flutter/material.dart';
import 'package:kuis3_provis/daftar_umkm.dart';
import 'package:kuis3_provis/detil_umkm.dart';

void main() => runApp(MaterialApp(
  initialRoute: '/',
  routes: {
    '/': (context) => PageDaftarUMKM(),
    // '/detil_umkm': (context) => PageDetilUMKM(),
  },
));