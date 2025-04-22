import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:craftybay/app/app_colors.dart';
import 'package:craftybay/core/widgets/centered_circular_progressbar.dart';
import 'package:craftybay/features/common/controllers/home_slider_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class HomeCarouselSlider extends StatefulWidget {
  const HomeCarouselSlider({
    super.key,
  });

  @override
  State<HomeCarouselSlider> createState() => _HomeCarouselSliderState();
}

class _HomeCarouselSliderState extends State<HomeCarouselSlider> {
  int _selectedSlider = 0;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeSliderController>(builder: (sliderController) {
      return Visibility(
        visible: sliderController.inProgress == false,
        replacement:
            const SizedBox(height: 200, child: CenteredCircularProgressbar()),
        child: Visibility(
          visible: sliderController.sliders.isNotEmpty,
          child: Column(
            children: [
              CarouselSlider(
                options: CarouselOptions(
                  autoPlay: true,
                    height: 200.0,
                    viewportFraction: 0.9,
                    onPageChanged: (index, reason) {
                      _selectedSlider = index;
                      setState(() {});
                    }),
                items: sliderController.sliders.map((slider) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                          width: MediaQuery.of(context).size.width,
                          margin: const EdgeInsets.symmetric(horizontal: 2.0),
                          decoration: BoxDecoration(
                              color: AppColors.themeColor,
                              borderRadius: BorderRadius.circular(8),
                              image: DecorationImage(
                                  image: NetworkImage(slider.photoUrl),
                                  fit: BoxFit.cover)),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text(
                              slider.description,
                              style: const TextStyle(
                                  fontSize: 16.0, color: Colors.grey),
                            ),
                          ));
                    },
                  );
                }).toList(),
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (int i = 0; i < sliderController.sliders.length; i++)
                    Container(
                      height: 20,
                      width: 20,
                      margin: const EdgeInsets.only(left: 4),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey),
                        color: _selectedSlider == i
                            ? AppColors.themeColor
                            : Colors.white,
                      ),
                    )
                ],
              )
            ],
          ),
        ),
      );
    });
  }
}
