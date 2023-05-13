import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kuis3_provis/model/daftar_umkm_model.dart';

class PageDaftarUMKM extends StatelessWidget {
  const PageDaftarUMKM({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kuis 3',
      home: BlocProvider(
        create: (context) => DaftarUMKMCubit(),
        child: const HalamanDaftarUMKM(),
      ),
    );
  }
}

class HalamanDaftarUMKM extends StatefulWidget {
  const HalamanDaftarUMKM({Key? key}) : super(key: key);

  @override
  HalamanDaftarUMKMState createState() => HalamanDaftarUMKMState();
}

class HalamanDaftarUMKMState extends State<HalamanDaftarUMKM> {
  @override
  Widget build(BuildContext context) {

    final daftarUMKMCubit = BlocProvider.of<DaftarUMKMCubit>(context);

    return MaterialApp(
      title: 'Quiz Flutter 2',
      home: Scaffold(
        appBar: AppBar(
          leading: FlutterLogo(),
          backgroundColor: Colors.blueGrey,
          title: Text('Quiz Flutter 3'),
        ),
        body: Column(
          children: [
            Padding(
                padding: EdgeInsets.all(10),
                child: 
                Text('2102585, Apri Anggara Yudha; 2102159, Virza Raihan Kurniawan; Saya berjanji tidak akan berbuat curang dan atau membantu orang lain berbuat curang'),
                
            ),

            Padding(
                padding: EdgeInsets.only(top: 20, bottom: 20),
                child: 
                ElevatedButton(
                  onPressed: () {
                    daftarUMKMCubit.fetchData();
                  },
                  child: const Text('Reload Daftar UMKM'),
                  style: ElevatedButton.styleFrom(
                    padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                )),                  
              ),
            ),
            
            // listView ============================================
            Expanded(
              child: BlocBuilder<DaftarUMKMCubit, DaftarUMKM>(
                buildWhen: (previousState, state) {
                  return true;
                },
                builder: (context, UMKM) {
                  final daftarUMKMCubit = BlocProvider.of<DaftarUMKMCubit>(context);
                  if (UMKM.listUMKM.isNotEmpty) {
                    return ListView.builder(
                      itemCount: UMKM.listUMKM.length,
                      itemBuilder: (context, index) {

                        return Container(
                          padding: const EdgeInsets.only(top: 6, bottom: 6, left: 10),
                          child: Row(
                            children: [
                              Container(
                                  padding: EdgeInsets.only(right: 10),
                                  child: Column(
                                    children: [
                                      Image.network(
                                      'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg',
                                          height: 50,  
                                        ),
                                    ]
                                  ), 
                                ),

                              Expanded(             
                                child: 
                                Container(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Text('CV Gorengan Sejahtera'),

                                      const Text('makanan/minuman',
                                        style: TextStyle(
                                          fontSize: 12, 
                                          color: Colors.grey, 
                                        ),
                                      ),
                                    ]
                                  ), 
                                ),
                              ),
                              
                              Container(
                                padding: EdgeInsets.only(right: 15, left: 15),
                                child: 
                                IconButton(
                                  iconSize: 20,
                                  icon: const Icon(Icons.more_vert),
                                  color: Colors.grey,
                                  onPressed: () {
                                    // ...
                                  },
                                ),
                              ), 

                              
                            ],
                          ),
                        );
                      },
                    );
                  } else {
                    return Text('Data tidak ada.');
                  }
                }
              )

            ),
          ]
        ),
      ),
    );
  }
}



