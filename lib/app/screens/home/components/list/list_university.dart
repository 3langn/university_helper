import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:university_helper/app/screens/home/controllers/home_controller.dart';

import '../card/custom_card.dart';

class ListUniversity extends GetView<HomeScreenController> {
  const ListUniversity({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeScreenController>(builder: (_) {
      return Obx(
        () {
          return _.listUniversity.isEmpty
              ? Center(child: CircularProgressIndicator())
              : Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    ListView.builder(
                      controller: _.scrollController,
                      primary: false,
                      padding: EdgeInsets.fromLTRB(10, 50, 10, 40),
                      itemCount: _.listUniversity.length,
                      itemBuilder: (context, index) {
                        return CustomCard(
                          dataUniversity: _.listUniversity[index],
                          isSearchByMajors: _.isSearchByMajors.value,
                        );
                      },
                    ),
                    if (_.isLoading.value)
                      CircularProgressIndicator(strokeWidth: 1)
                  ],
                );
        },
      );
    });
  }
}