import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:sscc_blog/providers/page_provider.dart';

import 'package:sscc_blog/ui/shared/custom_app_menu.dart';

// import 'package:sscc_blog/ui/views/about_view.dart';
// import 'package:sscc_blog/ui/views/contact_view.dart';
import 'package:sscc_blog/ui/views/home_view.dart';
import 'package:sscc_blog/ui/views/pricing_view.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: buildBoxDecoration(),
        child: Stack(
          children: [
            _HomeBody(),
            Positioned(right: 20, top: 20, child: CustomAppMenu()),
          ],
        ),
      ),
    );
  }

  BoxDecoration buildBoxDecoration() => BoxDecoration(
      gradient: LinearGradient(
          colors: [Colors.pink, Colors.purpleAccent],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0.5, 0.5]));
}

class _HomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final pageProvider = Provider.of<PageProvider>(context, listen: false);

    return PageView(
      controller: pageProvider.scrollController,
      scrollDirection: Axis.vertical,
      children: [
        HomeView(),
        // AboutView(),
        PricingView(),
        // ContactView(),
      ],
    );
  }
}
