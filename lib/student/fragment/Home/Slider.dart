import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SliderImage extends StatefulWidget {
  const SliderImage({super.key});

  @override
  State<SliderImage> createState() => _SliderState();
}

class _SliderState extends State<SliderImage> {
  //Slideshow
  PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;
  Timer? _timer;

  final List<String> _sliderImages = [
    'assets/events/sukien1.jpg',
    'assets/events/sukien2.jpg',
    'assets/events/sukien3.jpg',
    'assets/events/sukien4.jpg',
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //Bắt đầu slideshow sau 3 giây và chuyển trang sau 3 giây
    _timer = Timer.periodic(Duration(seconds: 3), (timer) {
      if (_currentPage < _sliderImages.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _pageController.animateToPage(_currentPage,
          duration: Duration(microseconds: 500), curve: Curves.easeInOut);
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Image> _slider = _sliderImages
        .map((image) => Image.asset(
              image,
              width: double.infinity,
              fit: BoxFit.cover,
            ))
        .toList();
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * (1 / 4),
          child: PageView(
            scrollDirection: Axis.horizontal,
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            children: _slider,
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.01,
        ),
        Container(
          child: AnimatedSmoothIndicator(
            activeIndex: _currentPage,
            count: _slider.length,
            effect: const WormEffect(
              dotHeight: 10,
              dotWidth: 10,
              spacing: 5,
              dotColor: Color.fromRGBO(217, 217, 217, 1),
              activeDotColor: Color.fromRGBO(102, 102, 102, 1),
              paintStyle: PaintingStyle.fill,
            ),
          ),
        )
      ],
    );
  }
}
