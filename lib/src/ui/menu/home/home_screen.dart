import 'package:flutter/material.dart';
import 'package:pharmacy_app/src/bloc/banner_bloc.dart';
import 'package:pharmacy_app/src/bloc/drugs_bloc.dart';
import 'package:pharmacy_app/src/bloc/pages_bloc.dart';
import 'package:pharmacy_app/src/model/banner.dart';
import 'package:pharmacy_app/src/model/durgs_model.dart';
import 'package:pharmacy_app/src/model/pages_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    bannerBloc.getAllBanner();
    drugsBloc.getAllDurgs();
    pageBloc.getAllPages();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           StreamBuilder<BannerModel>(
             stream: bannerBloc.getBannerStream,
             builder: (context, snapshot) {
            if(snapshot.hasData){
              var data = snapshot.data!.results;
              return SizedBox(
                height: 200,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: data.length,
                    itemBuilder: (ctx,index){
                      return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 16),
                        width: MediaQuery.of(context).size.width,
                        height: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(data[index].image,fit: BoxFit.cover,)),
                      );
                    }),
              );
            }
            return const CircularProgressIndicator();
             }
           ),
           const SizedBox(height: 32,),
           const Padding(
             padding:  EdgeInsets.only(left: 16.0),
             child:  Text("Лучшие предложения",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
           ),
            const SizedBox(height: 16,),
            SizedBox(
             height: 240,
             child: StreamBuilder<DrugsModel>(
               stream: drugsBloc.getDrugStream,
               builder: (context, snapshot) {
                 if(snapshot.hasData){
                   var data = snapshot.data!.results;
                   return ListView.builder(
                     itemCount: data.length,
                       scrollDirection: Axis.horizontal,
                       itemBuilder: (context,index){
                         return  Container(
                           margin: const EdgeInsets.symmetric(horizontal: 8),
                           decoration: BoxDecoration(
                             borderRadius: BorderRadius.circular(10),
                           ),
                           width: 140,
                           height: 240,
                           child: Column(
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: [
                               Container(
                                 width: 140,
                                 height: 140,
                                 decoration: BoxDecoration(
                                     borderRadius: BorderRadius.circular(10),
                                 ),
                                 child: ClipRRect(
                                     borderRadius: BorderRadius.circular(10),
                                     child: Image.network(data[index].image,fit: BoxFit.cover,)),
                               ),
                               Text(data[index].name),
                               const Spacer(),
                               Container(
                                 alignment: Alignment.center,
                                 width: MediaQuery.of(context).size.width,
                                 height: 30,
                                 decoration: BoxDecoration(
                                     borderRadius: BorderRadius.circular(8),
                                     color: Colors.indigo
                                 ),
                                 child: Text("SAVE",style: TextStyle(color: Colors.white),),
                               )
                             ],
                           ),
                         );
                       });
                 }
                 return const Center(child: CircularProgressIndicator());
               }
             ),
           ),
            const SizedBox(height: 32,),
            const Padding(
              padding:  EdgeInsets.only(left: 16.0),
              child:  Text("Полезные статьи",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
            ),
            const SizedBox(height: 16,),
            StreamBuilder<PagesModel>(
              stream: pageBloc.getPageStream,
              builder: (context, snapshot) {
                if(snapshot.hasData){
                  var data = snapshot.data!.results;
                  return SizedBox(
                    height: 108,
                    child: ListView.builder(
                      itemCount: data.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (ctx,index){
                          return Container(
                            margin: const EdgeInsets.symmetric(horizontal: 8),
                            width: 288,
                            height: 150,
                            decoration: BoxDecoration(
                              color: Colors.indigo,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(data[index].image,fit: BoxFit.cover,)),
                          );
                        }),
                  );
                }
                return const Center(child: CircularProgressIndicator());
              }
            )
          ],
        ),
      ),
    );
  }
}
