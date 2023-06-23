import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../helper_widgets/gradient_app_bar.dart';
import '../profile/profile_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);

    return Column(
      children: [
        GradientAppBar(
          title: 'home'.tr(),
          height: size.height * 0.40,
          actions: IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const ProfileScreen(),
                  ),
                );
              },
              icon: Image.asset("assets/images/account.png")),
          content: Padding(
            padding: const EdgeInsets.only(
                left: 20.0, right: 20.0, top: 15.0, bottom: 8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Current balance",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "\$10,223,32",
                      style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    SizedBox(
                        height: 18,
                        width: 18,
                        child: Image.asset("assets/images/chart.png")),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Image.asset("assets/images/btc.png",
                                    fit: BoxFit.fitWidth),
                                const SizedBox(
                                  width: 10,
                                ),
                                const Text(
                                  "BTC",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            const Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "0,000",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text("BTC",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 12))
                                  ],
                                ),
                                Text("\$0.00000",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 10))
                              ],
                            ),
                          ],
                        ),
                        const Divider(
                          color: Colors.white,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Image.asset("assets/images/usdt.png",
                                    fit: BoxFit.fitWidth),
                                const SizedBox(
                                  width: 10,
                                ),
                                const Text(
                                  "USDT",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            const Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "0,000",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text("\$",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 12))
                                  ],
                                ),
                                Text("\$0.00000",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 10))
                              ],
                            ),
                          ],
                        ),
                        const Divider(
                          color: Colors.white,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Image.asset("assets/images/busd.png",
                                    fit: BoxFit.fitWidth),
                                const SizedBox(
                                  width: 10,
                                ),
                                const Text(
                                  "BUSD",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            const Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "0,000",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text("\$",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 12))
                                  ],
                                ),
                                Text("\$0.00000",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 10))
                              ],
                            ),
                          ],
                        ),
                        const Divider(
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(32, 16, 32, 0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: Row(
                        children: [
                          Text(
                            'accounts',
                            style: theme.textTheme.titleSmall,
                          ).tr(),
                          const SizedBox(width: 4),
                          const Icon(
                            Icons.add_box_outlined,
                            color: Color.fromRGBO(100, 234, 184, 1),
                            size: 20,
                          )
                        ],
                      ),
                    ),
                    IconButton(
                      icon: Image.asset("assets/images/settings.png"),
                      onPressed: () {},
                    )
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 6.0, right: 6.0),
                  child: Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    height: 50,
                                    width: 50,
                                    child: Image.asset("assets/images/btc.png",
                                        fit: BoxFit.fitWidth),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  const Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Recieved", style: TextStyle(fontSize: 10, color: Colors.grey),),
                                      Text("0,000 Etherium", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                                      Text("23/06/2023 15:54", style: TextStyle(fontSize: 10, color: Colors.grey),),
                                    ],
                                  )
                                ],
                              ),
                              const Text(
                                "+\$00,00",
                                style: TextStyle(
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
