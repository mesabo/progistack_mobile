import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:progistack_mobile/infrastructure/navigation/routes.dart';
import 'package:progistack_mobile/presentation/commune/controllers/commune.controller.dart';

import '../controllers/home.controller.dart';

class HomeScreen extends GetView<HomeController> {
   HomeScreen({Key? key}) : super(key: key);
    var communeController = Get.put(CommuneController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Progistack Test'),
          centerTitle: true,
          elevation: 0,
          // bottom: PreferredSize(
          //     child: CupertinoSearchTextField(),
          //     preferredSize: Size.fromHeight(50)),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: controller.communeList.length,
            itemBuilder: (context, index) {
              final commune = controller.communeList[index];
              return InkWell(
                onTap: () {
                  communeController.selectCommune(commune);
                
                },
                child: SizedBox(
                  height: 65,
                  child: Row(
                    children: [
                      CircleAvatar(child: Text('${index + 1}')),
                      const SizedBox(width: 10),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            commune.name!.toUpperCase(),
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 22),
                          ),
                          Text('${commune.address!.length} commerces'),
                        ],
                      ),
                      const Spacer(),
                      const Icon(CupertinoIcons.right_chevron),
                    ],
                  ),
                ),
              );
            },
          ),
        ));
  }
}
