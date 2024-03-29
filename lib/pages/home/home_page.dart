import 'package:bloc_flutter/common/values/colors.dart';
import 'package:bloc_flutter/pages/home/bloc/home_page_blocs.dart';
import 'package:bloc_flutter/pages/home/bloc/home_page_states.dart';
import 'package:bloc_flutter/pages/home/widgets/home_page_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: buildAppBar(),
        body: BlocBuilder<HomePageBlocs, HomePageStates>(
            builder: (context, state) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 25.w),
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: homePageText("Hello",
                      color: AppColors.primaryThirdElementText),
                ),
                SliverToBoxAdapter(child: homePageText("Fadilah Umar", top: 5)),
                SliverPadding(
                  padding: EdgeInsets.only(top: 20.h),
                ),
                SliverToBoxAdapter(child: searchView()),
                SliverToBoxAdapter(child: slidersView(context, state)),
                SliverToBoxAdapter(child: menuView()),
                SliverPadding(
                    padding:
                        EdgeInsets.symmetric(vertical: 18.h, horizontal: 0.w),
                    sliver: SliverGrid(
                      delegate: SliverChildBuilderDelegate(childCount: 4,
                          (BuildContext context, int index) {
                        return GestureDetector(
                            onTap: () {}, child: courseGrid());
                      }),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 15,
                              crossAxisSpacing: 15,
                              childAspectRatio: 1.6),
                    ))
              ],
            ),
          );
        }));
  }
}
