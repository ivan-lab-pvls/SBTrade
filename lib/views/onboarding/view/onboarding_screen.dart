import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/onboarding_cubit/onboarding_cubit.dart';
import '../../../consts/app_colors.dart';
import '../../../consts/app_text_styles/onboarding_text_style.dart';
import '../../../util/app_routes.dart';
import '../../app/widgets/chosen_action_button_widget.dart';
import '../widgets/introduction_png_widget.dart';

class OnboardingScreen extends StatefulWidget {
  final bool? isFirstTime;

  const OnboardingScreen({
    Key? key,
    this.isFirstTime,
  }) : super(key: key);

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final CarouselController _carouselController = CarouselController();
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.blackColor,
        shadowColor: Colors.transparent,
      ),
      body: Container(
        color: AppColors.blackColor,
        child: Column(
          children: [
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(size.height * 0.02),
                  child: Container(
                    height: size.height * 0.2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _current == 0 ? 'Welcome to app!' : 'Create events.',
                          style: OnboardingTextStyle.introduction,
                          textAlign: TextAlign.start,
                          softWrap: true,
                          overflow: TextOverflow.visible,
                        ),
                        SizedBox(
                          height: size.height * 0.0025,
                        ),
                        Text(
                          _current == 0
                              ? 'Discover the secrets of safe stock trading! No expenses, only your investment instincts.'
                              : 'Create events with which you can practice selling and buying stocks.',
                          style: OnboardingTextStyle.description,
                          textAlign: TextAlign.start,
                          maxLines: 4,
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.height * 0.02),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: List.generate(2, (index) {
                      return AnimatedContainer(
                        duration: Duration(milliseconds: 200),
                        curve: Curves.easeInOut,
                        width: _current == index
                            ? size.width * 0.075
                            : size.width * 0.35,
                        height: size.width * 0.02,
                        margin: const EdgeInsets.symmetric(
                            vertical: 0.5, horizontal: 5),
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius:
                              BorderRadius.circular(size.width * 0.01),
                          color: _current == index
                              ? AppColors.blueColor
                              : AppColors.lightGreyColor,
                        ),
                      );
                    }),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: size.height * 0.015,
            ),
            Column(
              children: [
                CarouselSlider(
                  items: const [
                    IntroductionPNGWidget(
                      imagePath: 'assets/images/onboarding1.png',
                    ),
                    IntroductionPNGWidget(
                      imagePath: 'assets/images/onboarding2.png',
                    ),
                  ],
                  carouselController: _carouselController,
                  options: CarouselOptions(
                    height: size.height * 0.44,
                    autoPlay: false,
                    //  enlargeCenterPage: true,
                    viewportFraction: 1,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _current = index;
                      });
                    },
                  ),
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                ChosenActionButton(
                  onTap: () async {
                    context.read<OnboardingCubit>().setFirstTime();
                    Navigator.pushReplacementNamed(context, AppRoutes.home);
                  },
                  text: 'Continue',
                ),
                SizedBox(
                  height: size.height * 0.015,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
