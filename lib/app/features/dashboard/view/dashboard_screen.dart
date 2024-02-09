import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vgts_design_task/app/core/z_core_mixin_export.dart';
import 'package:vgts_design_task/app/features/dashboard/Repository/dashBoard_repositoy.dart';
import 'package:vgts_design_task/app/features/dashboard/model/z_dashboard_model_export.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> with AppUtils {
  String selectedKey = "HOME";

  getDataFromServer() async {
    final stringData = await DashBoardRepository()
        .readDataFromServer(url: ApiEndPoints.geoCodeUrl);
    if (stringData.contains("Network Error")) {
      print("please connect your Network");
    } else {
      GeoCodeResponse geoCodeResponse = GeoCodeResponse.fromJson(jsonDecode(stringData));
      // print(geoCodeResponse.routes);
      // for(var bounds in geoCodeResponse.routes!){
      //   print("northEast:${bounds.bounds?.northeast?.lat},${bounds.bounds?.northeast?.lng}");
      //   print("southWest:${bounds.bounds?.southwest?.lat}${bounds.bounds?.southwest?.lng}");
      // }
      print(geoCodeResponse.toJson());
    }
  }

  @override
  void initState() {
    getDataFromServer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: 1.sh,
        width: 1.sw,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Container(
              height: 0.38.sh,
              width: 1.sw,
              color: Colors.blueAccent,
              child: Column(
                children: [
                  paddingWidget(
                    child: spaceBetweenRow(children: [
                      showValueText(
                          text: "\$22,265.64",
                          fontSize: 25.sp,
                          fontColor: Colors.white),
                      SizedBox(
                          width: 0.4.sw,
                          child: defaultColumnAxis(children: [
                            Container(
                              height: 35.sp,
                              width: 130.sp,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: Colors.indigo),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  showValueText(
                                      fontSize: 12.sp,
                                      fontColor: Colors.white,
                                      text: "0.97%"),
                                  const Icon(
                                    Icons.arrow_drop_up,
                                    color: Colors.green,
                                  )
                                ],
                              ),
                            )
                          ])),
                    ]),
                    left: 20.sp,
                    top: 70.sp,
                  ),
                  paddingWidget(
                    child: spaceBetweenRow(children: [
                      cashBalanceText(
                          title: "Account Value", color: Colors.white),
                      Text(
                        "Since last purchase",
                        style: size10Weight400(),
                      ),
                    ]),
                    left: 20.sp,
                    right: 32.sp,
                    top: 19.sp,
                  ),
                  showDivider(
                      top: 15.sp,
                      right: 32.sp,
                      left: 19.sp,
                      color: Colors.white),
                  paddingWidget(
                      child: spaceBetweenRow(children: [
                        defaultColumnAxis(children: [
                          cashBalanceText(
                              title: "Cash Balance", color: Colors.white),
                          heightFourBox,
                          Row(
                            children: [
                              showValueText(
                                  fontSize: 25.sp,
                                  fontColor: Colors.white,
                                  text: '\$384.87'),
                              Icon(
                                Icons.info_outline,
                                color: Colors.white,
                                size: 18.sp,
                              )
                            ],
                          ),
                        ]),
                        defaultColumnAxis(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              cashBalanceText(
                                  title: "Metal Holdings", color: Colors.white),
                              heightFourBox,
                              showValueText(
                                  fontSize: 25.sp,
                                  fontColor: Colors.white,
                                  text: '\$22,265.64')
                            ]),
                      ]),
                      left: 20.sp,
                      right: 32.sp,
                      top: 10)
                ],
              ),
            ),

            //show list of products (gold,silver,platinum)
            Positioned(
              top: 0.31.sh,
              child: SizedBox(
                height: 0.8.sh,
                width: 0.94.sw,
                child: Column(
                  children: [
                    for (var product in productDetails)
                      paddingWidget(
                          child: productDetailsCard(
                              child: Column(
                            children: [
                              paddingWidget(
                                  left: 15.sp,
                                  top: 8.sp,
                                  right: 15.sp,
                                  child: spaceBetweenRow(children: [
                                    Row(
                                      children: [
                                        Container(
                                          height: 60.sp,
                                          width: 60.sp,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: product.color
                                                  .withOpacity(0.2)),
                                          child: Center(
                                            child: Icon(
                                              product.icon,
                                              color: product.color,
                                            ),
                                          ),
                                        ),
                                        widthTenBox,
                                        SizedBox(
                                          height: 60.sp,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              showValueText(
                                                  fontSize: 18.sp,
                                                  fontColor: product.color,
                                                  text: product.productName),
                                              cashBalanceText(
                                                  title: product.productWeight,
                                                  color: Colors.grey),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 46.sp,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          showValueText(
                                              fontSize: 16.sp,
                                              fontColor: Colors.black,
                                              text: product.productValue),
                                          cashBalanceText(
                                              title: product.productPercentage,
                                              color: Colors.grey)
                                        ],
                                      ),
                                    )
                                  ])),
                              showDivider(
                                  left: 15.sp,
                                  top: 3.sp,
                                  right: 15.sp,
                                  color: Colors.grey.withOpacity(0.2)),
                              paddingWidget(
                                  left: 15.sp,
                                  top: 8.sp,
                                  right: 15.sp,
                                  child: spaceBetweenRow(children: [
                                    defaultColumnAxis(children: [
                                      cashBalanceText(
                                          title: "Metal Price",
                                          color: Colors.grey),
                                      heightFourBox,
                                      Text(
                                        product.metalPrice,
                                        style: size12Weight400(
                                            color: Colors.black),
                                      ),
                                    ]),
                                    defaultColumnAxis(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          cashBalanceText(
                                              title: "Change",
                                              color: Colors.grey),
                                          heightFourBox,
                                          Text(product.change,
                                              style: size12Weight400(
                                                  color: Colors.red)),
                                        ])
                                  ]))
                            ],
                          )),
                          bottom: 15.sp)
                  ],
                ),
              ),
            ),
            Positioned(
                bottom: 5.sp,
                left: 22.sp,
                child: showValueText(
                    fontSize: 16.sp,
                    fontColor: Colors.black,
                    text: "Do More With OneGold"))
          ],
        ),
      ),
      bottomNavigationBar: Container(
          height: 55.sp,
          width: double.infinity,
          decoration:
              BoxDecoration(color: Colors.white, boxShadow: [boxShadowTwo()]),
          child: paddingWidget(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                for (var button in bottomButtons)
                  button.key == "CENTER"
                      ? GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedKey = button.key;
                            });
                          },
                          child: Container(
                            height: 50,
                            width: 50,
                            decoration: const BoxDecoration(
                                color: Colors.blueAccent,
                                shape: BoxShape.circle),
                            child: Center(
                              child: Icon(
                                button.iconData,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        )
                      : GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: () {
                            setState(() {
                              selectedKey = button.key;
                            });
                            switch (selectedKey) {
                              case "HOME":
                                {}
                                break;
                              case "PORTFOLIO":
                                {}
                                break;
                              case "CENTER":
                                {}
                                break;
                              case "PRICES":
                                {}
                                break;
                              case "SETTING":
                                {}
                                break;
                              default:
                            }
                          },
                          child: Column(
                            children: [
                              Icon(
                                button.iconData,
                                color: selectedKey == button.key
                                    ? Colors.blueAccent
                                    : Colors.black.withOpacity(0.5),
                              ),
                              Text(button.name,
                                  style: size12Weight400(
                                      color: selectedKey == button.key
                                          ? Colors.blueAccent
                                          : Colors.black.withOpacity(0.5)))
                            ],
                          ),
                        )
              ],
            ),
            top: 11.sp,
          )),
    );
  }
}
