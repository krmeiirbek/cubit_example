import 'package:cubit_example/constants/colors.dart';
import 'package:cubit_example/cubit/app_cubit.dart';
import 'package:cubit_example/widgets/app_buttons.dart';
import 'package:cubit_example/widgets/app_large_text.dart';
import 'package:cubit_example/widgets/app_text.dart';
import 'package:cubit_example/widgets/responsive_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AppCubit, AppState>(
        builder: (context, state) {
          if (state is AppDetail) {
            return SizedBox(
              width: double.maxFinite,
              height: double.maxFinite,
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    right: 0,
                    child: Container(
                      width: double.maxFinite,
                      height: 350,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                              "http://mark.bslmeiyu.com/uploads/" +
                                  state.place.img),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 70,
                    left: 20,
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            BlocProvider.of<AppCubit>(context).goHome();
                          },
                          icon: const Icon(Icons.menu),
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 320,
                    child: Container(
                      padding:
                          const EdgeInsets.only(left: 20, right: 20, top: 30),
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.7,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AppLargeText(
                                text: state.place.name,
                                color: Colors.black.withOpacity(0.8),
                              ),
                              AppLargeText(
                                text: "\$ ${state.place.price}",
                                color: AppColors.mainColor,
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              const Icon(
                                Icons.location_on,
                                color: AppColors.mainColor,
                              ),
                              const SizedBox(width: 5),
                              AppText(
                                text: state.place.location,
                                color: AppColors.textColor1,
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Row(
                            children: [
                              Wrap(
                                children: List.generate(
                                  5,
                                  (index) {
                                    return Icon(
                                      Icons.star,
                                      color: index < state.place.stars
                                          ? AppColors.starColor
                                          : AppColors.textColor2,
                                    );
                                  },
                                ),
                              ),
                              const SizedBox(width: 10),
                              AppText(
                                text: "(${state.place.stars}.0)",
                                color: AppColors.textColor2,
                              ),
                            ],
                          ),
                          const SizedBox(height: 25),
                          AppLargeText(
                            text: "People",
                            color: Colors.black.withOpacity(0.8),
                            size: 20,
                          ),
                          const SizedBox(height: 5),
                          const AppText(
                            text: "Number of people in your group",
                            color: AppColors.mainTextColor,
                          ),
                          const SizedBox(height: 10),
                          Wrap(
                            children: List.generate(
                              5,
                              (index) {
                                return InkWell(
                                  onTap: () {
                                    setState(() {
                                      if (selectedIndex == index) {
                                        selectedIndex = -1;
                                      } else {
                                        selectedIndex = index;
                                      }
                                    });
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.only(right: 10),
                                    child: AppButtons(
                                      color: selectedIndex == index
                                          ? Colors.white
                                          : Colors.black,
                                      size: 50,
                                      backgroundColor: selectedIndex == index
                                          ? Colors.black
                                          : AppColors.buttonBackground,
                                      borderColor: selectedIndex == index
                                          ? Colors.black
                                          : AppColors.buttonBackground,
                                      text: (index + 1).toString(),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          const SizedBox(height: 20),
                          AppLargeText(
                            text: "Description",
                            color: Colors.black.withOpacity(0.8),
                          ),
                          const SizedBox(height: 10),
                          AppText(
                            text: state.place.description,
                            color: AppColors.mainTextColor,
                          )
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 20,
                    left: 20,
                    right: 20,
                    child: Row(
                      children: [
                        AppButtons(
                          color: AppColors.textColor1,
                          backgroundColor: Colors.white,
                          borderColor: AppColors.textColor1,
                          size: 60,
                          isIcon: true,
                          icon: Icons.favorite_border,
                        ),
                        const SizedBox(width: 20),
                        const ResponsiveButton(
                          isResponsive: true,
                          text: "Back Trip Now",
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
