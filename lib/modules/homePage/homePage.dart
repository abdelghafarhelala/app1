import 'package:app1/appCubit/app_cubit.dart';
import 'package:app1/appCubit/app_states.dart';
import 'package:app1/app_locale/app_locale.dart';
import 'package:app1/components/components.dart';

import 'package:app1/modules/drawer/drawer.dart';
import 'package:app1/modules/login/login.dart';
import 'package:app1/modules/myDrawer/myDrawer.dart';
import 'package:app1/modules/register/registerCubit/registerCubit.dart';
import 'package:app1/shared/colors.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_switch/flutter_switch.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        final List<String> imgList = [
          'assets/images/pasta1.jpg',
          'assets/images/pasta2.jpg',
          'assets/images/pasta3.jpg'
        ];

        return Scaffold(
          drawer: Drawer(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const MyDrawer(),
                  const MyDrawer().myDrawerList(context),
                ],
              ),
            ),
          ),
          appBar: AppBar(
            title: Text('${getLang(context, 'home')}'),
            actions: [
              const Center(
                child: Text(
                  'Mode',
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              FlutterSwitch(
                inactiveColor: Colors.white,
                inactiveToggleColor: Colors.grey,
                activeColor: primaryColor,
                activeText: 'Dark',
                height: 25,
                width: 50,
                activeTextColor: Colors.white,
                value: AppCubit.get(context).isDark,
                onToggle: (value) {
                  AppCubit.get(context).changeAppTheme();
                },
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Text('${getLang(context, 'discoverPasta')}')
                RichText(
                  text: TextSpan(
                    text: 'Discover',
                    style: Theme.of(context).textTheme.bodyText1,
                    children: [
                      TextSpan(
                        text: ' Pasta',
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .copyWith(color: primaryColor),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Card(
                  elevation: 5,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: CarouselSlider(
                    items: imgList
                        .map(
                          (e) => Image(
                            image: AssetImage(e),
                            fit: BoxFit.cover,
                            width: double.infinity,
                          ),
                        )
                        .toList(),
                    options: CarouselOptions(
                      height: 250,
                      initialPage: 0,
                      viewportFraction: 1,
                      autoPlay: true,
                      autoPlayAnimationDuration: const Duration(seconds: 1),
                      autoPlayInterval: const Duration(seconds: 3),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      scrollDirection: Axis.horizontal,
                      reverse: false,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Text(
                      'Lunch near you',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    Spacer(),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'see more',
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                            color: primaryColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 17),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Container(
                  height: 250,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => buildProductItem(context),
                    itemCount: 6,
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Widget buildProductItem(context) => Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Image(
                image: AssetImage('assets/images/pasta2.jpg'),
                width: 160,
                height: 140,
                fit: BoxFit.cover,
              ),
              const SizedBox(
                height: 5,
              ),
              const Text(
                'Pasta with Negrisco',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                'carbs and fat',
                style: Theme.of(context).textTheme.caption,
              ),
              const Spacer(),
              Text(
                "10 dollers ",
                style: Theme.of(context)
                    .textTheme
                    .caption!
                    .copyWith(color: primaryColor),
              ),
            ],
          ),
        ),
      );
}
