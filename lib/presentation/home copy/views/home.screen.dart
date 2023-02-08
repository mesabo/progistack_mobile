import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../home/controllers/home.controller.dart';


class HomeScreen extends GetView<HomeController> {
  const HomeScreen({Key? key}) : super(key: key);
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
            itemCount: 10,
            itemBuilder: (context, index) {
              // final city = homeController.cities[index];
              return InkWell(
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
                            "Commerce $index",
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 22),
                          ),
                          Text('$index agences'),
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
