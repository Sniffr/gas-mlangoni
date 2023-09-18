import 'package:mlangoni/controller/campaign_controller.dart';
import 'package:mlangoni/util/dimensions.dart';
import 'package:mlangoni/view/base/custom_app_bar.dart';
import 'package:mlangoni/view/base/footer_view.dart';
import 'package:mlangoni/view/base/item_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mlangoni/view/base/menu_drawer.dart';

class ItemCampaignScreen extends StatefulWidget {
  @override
  State<ItemCampaignScreen> createState() => _ItemCampaignScreenState();
}

class _ItemCampaignScreenState extends State<ItemCampaignScreen> {

  @override
  void initState() {
    super.initState();

    Get.find<CampaignController>().getItemCampaignList(false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'campaigns'.tr),
      endDrawer: MenuDrawer(),
      body: Scrollbar(child: SingleChildScrollView(child: FooterView(child: SizedBox(
        width: Dimensions.WEB_MAX_WIDTH,
        child: GetBuilder<CampaignController>(builder: (campController) {
          return ItemsView(
            isStore: false, items: campController.itemCampaignList, stores: null,
            isCampaign: true, noDataText: 'no_campaign_found'.tr,
          );
        }),
      )))),
    );
  }
}
