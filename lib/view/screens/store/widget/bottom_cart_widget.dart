import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mlangoni/controller/cart_controller.dart';
import 'package:mlangoni/helper/price_converter.dart';
import 'package:mlangoni/helper/route_helper.dart';
import 'package:mlangoni/util/dimensions.dart';
import 'package:mlangoni/util/styles.dart';
import 'package:mlangoni/view/base/custom_button.dart';

class BottomCartWidget extends StatelessWidget {
  const BottomCartWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(builder: (cartController) {
        return Container(
          height: 70, width: Get.width,
          padding: EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_EXTRA_LARGE,/* vertical: Dimensions.PADDING_SIZE_SMALL*/),
          decoration: BoxDecoration(
              color: Theme.of(context).cardColor, boxShadow: [BoxShadow(color: Color(0xFF2A2A2A).withOpacity(0.1), blurRadius: 10, offset: Offset(0, -5))],
          ),
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [

            Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.center, children: [
              Text('item'.tr + ': ' + cartController.cartList.length.toString(), style: robotoMedium.copyWith(fontSize: Dimensions.fontSizeDefault)),
              SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL),

              Text(
                'total'.tr + ': ' + PriceConverter.convertPrice(cartController.calculationCart()),
                style: robotoMedium.copyWith(fontSize: Dimensions.fontSizeLarge, color: Theme.of(context).primaryColor),
              ),
            ]),

            CustomButton(buttonText: 'view_cart'.tr,width: 130,height: 45, onPressed: () => Get.toNamed(RouteHelper.getCartRoute()))
          ]),
        );
      });
  }
}
