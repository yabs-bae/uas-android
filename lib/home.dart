import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tugasbayu/constant/images.dart';
import 'package:tugasbayu/models/ListReceiptModels.dart';
class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  late ListReceiptModels _items;
  // Fetch content from the json file
  Future<void> readJson() async {
    final String response = await rootBundle.loadString(Images.JSON);
    ListReceiptModels responses = listReceiptModelsFromJson(response);
    setState(() {
      _items = responses;
    });
  }
  @override
  void initState() {
    super.initState();
    readJson();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Tugas Bayu"),),
      body: Container(
        child: SingleChildScrollView(
            child: Column(
          children: [
            SizedBox(height: 5,),
            Text("UAS Bayu 00000120301230"),
            SizedBox(height: 5,),
            Image.asset(Images.IMAGE_PREVIEW,width: 60,),
            SizedBox(height: 5,),
            Text("Menampilkan text"),
            SizedBox(height: 5,),
            Container(
              margin: EdgeInsets.all(10),
              height: 250,
              child: Card(
                child: SingleChildScrollView(
                    child:Column(
                      children: [
                       Container(
                         padding: EdgeInsets.all(20),
                         child:  FutureBuilder<String>(
                           future: rootBundle.loadString(Images.JSON),
                           builder: (c,s){
                             if(s.hasData && s.connectionState == ConnectionState.done){
                               return Text(s.data ?? "");
                             }else{
                               return Text("menunggu data");
                             }
                           },
                         ),
                       )
                      ],
                    )),
              ),
            ),
            Text("Menampilkan List Data Json"),
            !_items.recipes!.isEmpty
                ? ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount:_items.recipes?.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.all(10),
                  child: ListTile(
                    leading: Text(_items.recipes?[index].id ?? ""),
                    title: Text(_items.recipes?[index].judul ?? ""),
                    subtitle: Text(_items.recipes?[index].duration ?? ""),
                    trailing: Image.asset(_items.recipes?[index].picmakanan ?? ""),
                  ),
                );
              },
            )
                : Container()
          ],
        )),
      ),
    );
  }
}
