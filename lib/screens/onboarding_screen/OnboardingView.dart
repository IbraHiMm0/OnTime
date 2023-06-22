import 'package:flutter/material.dart';
import 'package:ontimeapp/presentation/resources/constants.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../presentation/resources/assets_manager.dart';
import '../../presentation/resources/color_manager.dart';
import '../../presentation/resources/routes_manager.dart';
import '../../presentation/resources/string_manager.dart';
import '../../presentation/resources/styles_manager.dart';
import '../../presentation/resources/values_manager.dart';
import '../components/customButtonView.dart';

class BoardingModel {
  final String image;
  final String title;
  final String body;

  BoardingModel({
    required this.title,
    required this.image,
    required this.body,
  });
}

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  bool isLast = false;
  String text = AppStrings.next;

  void changeText() {
    setState(() {
      text = AppStrings.start;
    });
  }

  void submit() {
    Navigator.pushReplacementNamed(context, Routes.registerRoute);
  }

  var boardController = PageController();

  List<BoardingModel> boarding = [
    BoardingModel(
      title: AppStrings.onBoardingTitle1,
      image: ImageAssets.onBoarding1,
      body: AppStrings.onBoardingSubTitle1,
    ),
    BoardingModel(
      title: AppStrings.onBoardingTitle2,
      image: ImageAssets.onBoarding2,
      body: AppStrings.onBoardingSubTitle2,
    ),
    BoardingModel(
      title: AppStrings.onBoardingTitle3,
      image: ImageAssets.onBoarding3,
      body: AppStrings.onBoardingSubTitle3,
    ),
  ]; // 3 onboarding with title and image

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: ColorManager.whiteF5,
          elevation: AppSize.s0,
          actions: [
            TextButton(
              onPressed: submit,
              child: Text(AppStrings.skip,
                  style: getLightStyle(
                      color: ColorManager.grey, fontSize: AppSize.s15)),
            ),
          ],
        ),
        body: Container(
          color: ColorManager.whiteF5,
          child: Padding(
            padding: const EdgeInsets.all(AppSize.s30),
            child: Column(
              children: [
                Expanded(
                  child: PageView.builder(
                    onPageChanged: (int index) {
                      if (index == boarding.length - 1) {
                        setState(() {
                          isLast = true;
                          changeText();
                        });
                      } else {
                        setState(() {
                          isLast = false;
                          text = AppStrings.next;
                        });
                      }
                    },
                    //when go last in change
                    physics: const BouncingScrollPhysics(),
                    controller: boardController,
                    itemBuilder: (context, index) =>
                        buildBoardingItem(boarding[index]),
                    itemCount: boarding.length,
                  ),
                ),
                const SizedBox(
                  height: AppSize.s50,
                ),
                // customButton(
                //   text:AppStrings.next,
                //   color: ColorManager.primary,
                //   onTap: (){
                //     if (isLast) {
                //       submit();
                //       changeText();
                //     }
                //     else {
                //       boardController.nextPage(
                //         duration: const Duration(
                //           milliseconds: AppConstants.onboardingTime,
                //         ),
                //         curve: Curves.fastOutSlowIn,
                //       );
                //     }
                //   },
                // ),
                GestureDetector(
                  onTap: () {
                    if (isLast) {
                      submit();
                      changeText();
                    } else {
                      boardController.nextPage(
                        duration: const Duration(
                          milliseconds: AppConstants.onboardingTime,
                        ),
                        curve: Curves.fastOutSlowIn,
                      );
                    }
                  },
                  child: Container(
                    width: double.infinity,
                    height: AppSize.s56,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(AppSize.s8),
                      color: ColorManager.primary,
                    ),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        text.toUpperCase(),
                        style: getRegularStyle(
                            color: ColorManager.whiteF6, fontSize: AppSize.s13),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: AppSize.s40,
                ),
              ],
            ),
          ),
        ));
  }

  Widget buildBoardingItem(BoardingModel model) => Column(
        children: [
          Expanded(
            child: Image(
              image: AssetImage(model.image),
            ),
          ),
          const SizedBox(
            height: AppSize.s30,
          ),
          SmoothPageIndicator(
            controller: boardController,
            count: boarding.length,
            effect: WormEffect(
              spacing: AppSize.s10,
              dotHeight: AppSize.s6,
              dotWidth: AppSize.s6,
              dotColor: ColorManager.lightGrey,
              activeDotColor: ColorManager.primary,
            ),
          ),
          const SizedBox(
            height: AppSize.s40,
          ),
          Text(
            model.title,
            style: getBoldStyle(color: ColorManager.black),
          ),
          const SizedBox(
            height: AppSize.s20,
          ),
          Text(
            model.body,
            style: getRegularStyle(
                color: ColorManager.grey, fontSize: AppSize.s18),
            textAlign: TextAlign.center,
          ),
        ],
        // onPressed: () {
        //   if (isLast) {
        //     submit();
        //     changeText();
        //   } else {
        //     boardController.nextPage(
        //       duration: const Duration(
        //         milliseconds: AppConstants.onboardingTime,
        //       ),
        //       curve: Curves.fastOutSlowIn,
        //     );
        //   }
        // },
        // child: Row(
        //   children: [
        //     Text(
        //       text,
        //       style: getBoldStyle(
        //           color: ColorManager.black,
        //           fontSize: AppSize.s18),
        //     ),
        //     const SizedBox(
        //       width: AppSize.s8,
        //     ),
        //     Icon(
        //       color: ColorManager.black,
        //       Icons.arrow_forward_ios,
        //     )
        //   ],
        // ),
      ); // widget item
}
