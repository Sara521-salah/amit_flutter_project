import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class onBoardingModel {
  final String image;

  final String title;

  final String body;

  onBoardingModel({
    required this.image,
    required this.title,
    required this.body,
  });
}

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {

  var boardingController = PageController();

  bool islast = false;
  List<onBoardingModel> boarding = [
    onBoardingModel(
        image: 'assets/images/Shopping-pana.png',
        title: 'Online Store ',
        body:
            'welcome to your online store'),
    onBoardingModel(
        image: 'assets/images/Discount-amico.png',
        title: 'Pay Online',
        body:
            'never worry about charge ,pay the exact amount while pricing the order '),
    onBoardingModel(
        image: 'assets/images/Window Shopping-pana.png',
        title: 'Skip Queues',
        body:
            'avoid standing in queues we all notify you when your order is ready'),
  ];

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    return Scaffold(
        backgroundColor: Colors.white,

        body: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: boardingController,
                itemBuilder: (context, index) =>
                    buildOnbodingItem(boarding[index]),
                physics: const BouncingScrollPhysics(),
                onPageChanged: (int index) {
                  if (index == boarding.length - 1) {
                    setState(() {
                      islast = true;
                    });
                  } else {
                    setState(() {
                      islast = false;
                    });
                  }
                },
                itemCount: boarding.length,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                children: [
                  SmoothPageIndicator(
                    controller: boardingController,
                    count: boarding.length,
                    effect: const WormEffect(
                      activeDotColor: Color.fromRGBO(65, 174, 169, 1),
                      dotHeight: 16,
                      dotWidth: 16,
                      type: WormType.thin,
                      strokeWidth: 5,
                    ),
                  ),
                  const Spacer(),
                  FloatingActionButton(
                    backgroundColor: const Color.fromRGBO(65, 174, 169, 1),
                    onPressed: () {
                      if (islast) {
                        Navigator.pushReplacementNamed(context, 'Login');
                      } else {
                        boardingController.nextPage(
                            duration: const Duration(milliseconds: 350),
                            curve: Curves.fastLinearToSlowEaseIn);
                      }
                    },
                    child: const Icon(Icons.arrow_forward_ios_rounded),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ));
  }
}

Widget buildOnbodingItem(onBoardingModel model) => Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20,),
          Image.asset(
            model.image,
            height: 300,
            width: 300,
          ),
          Text(
            '${model.title} ',
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: Text(
              '${model.body} ',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
            ),
          ),
        ],
      ),
    );
