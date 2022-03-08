import 'package:cubit_example/constants/colors.dart';
import 'package:cubit_example/cubit/app_cubit.dart';
import 'package:cubit_example/widgets/app_large_text.dart';
import 'package:cubit_example/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  var images = {
    "balloning.png": "Balloning",
    "hiking.png": "Hiking",
    "kayaking.png": "Kayaking",
    "snorkling.png": "Snorkling",
  };

  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        if (state is AppLoaded) {
          var info = state.places;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // menu
              Container(
                margin: const EdgeInsets.only(top: 70, left: 20),
                child: Row(
                  children: [
                    const Icon(
                      Icons.menu,
                      size: 30,
                      color: Colors.black54,
                    ),
                    const Expanded(child: SizedBox()),
                    Container(
                      margin: const EdgeInsets.only(right: 20),
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey.withOpacity(0.5)),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              Container(
                margin: const EdgeInsets.only(left: 20),
                child: const AppLargeText(text: 'Discover'),
              ),
              const SizedBox(height: 20),
              // tab bar
              Row(
                children: [
                  RotatedBox(
                    quarterTurns: 1,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: TabBar(
                        labelPadding:
                            const EdgeInsets.only(left: 20, right: 20),
                        indicatorSize: TabBarIndicatorSize.label,
                        indicator: const CircleTabIndicator(
                            color: AppColors.mainColor, radius: 4),
                        labelColor: Colors.black,
                        unselectedLabelColor: Colors.grey,
                        isScrollable: true,
                        controller: _tabController,
                        tabs: const [
                          Tab(
                            text: 'Places',
                          ),
                          Tab(
                            text: 'Inspiration',
                          ),
                          Tab(
                            text: 'Emotions',
                          ),
                        ],
                      ),
                    ),
                  ),
                  Flexible(
                    child: SizedBox(
                      height: 300,
                      width: double.maxFinite,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: TabBarView(
                          controller: _tabController,
                          children: [
                            ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: info.length,
                              itemBuilder: (_, index) {
                                return GestureDetector(
                                  onTap: () {
                                    BlocProvider.of<AppCubit>(context)
                                        .detailPage(info[index]);
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.only(
                                        right: 15, top: 10),
                                    width: 200,
                                    height: 300,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.white,
                                      image: DecorationImage(
                                        image: NetworkImage(
                                            "http://mark.bslmeiyu.com/uploads/" +
                                                info[index].img),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                            ListView.builder(
                              itemCount: 10,
                              itemBuilder: (_, index) {
                                return ListTile(
                                  leading: Text((index+1).toString()),
                                  title: const AppLargeText(text: "Kazybek",color: Colors.cyan,size: 20,),
                                  subtitle: const AppText(text: "Meiirbek",color: Colors.amberAccent,),
                                );
                              },
                            ),
                            const Text('Bye'),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Container(
                margin: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    AppLargeText(
                      text: "Explore more",
                      size: 22,
                    ),
                    AppText(
                      text: "See all",
                      color: AppColors.textColor1,
                    )
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Container(
                height: 120,
                width: double.maxFinite,
                margin: const EdgeInsets.only(left: 20),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 4,
                  itemBuilder: (_, index) {
                    return Container(
                      margin: const EdgeInsets.only(right: 30),
                      child: Column(
                        children: [
                          Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                              image: DecorationImage(
                                image: AssetImage('assets/images/' +
                                    images.keys.elementAt(index)),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          AppText(
                            text: images.values.elementAt(index),
                            color: AppColors.textColor2,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        } else {
          return Container();
        }
      },
    );
  }
}

class CircleTabIndicator extends Decoration {
  final Color color;
  final double radius;

  const CircleTabIndicator({required this.color, required this.radius});

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CirclePainter(color: color, radius: radius);
  }
}

class _CirclePainter extends BoxPainter {
  final Color color;
  final double radius;

  _CirclePainter({required this.color, required this.radius});

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Paint _paint = Paint();
    _paint.color = color;
    _paint.isAntiAlias = true;
    final circleOffset =
        Offset(configuration.size!.width / 2, configuration.size!.height - 40);

    canvas.drawCircle(offset + circleOffset, radius, _paint);
  }
}
