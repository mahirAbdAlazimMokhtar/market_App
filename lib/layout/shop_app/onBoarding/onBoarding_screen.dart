import 'package:flutter/material.dart';
import 'package:shop_app/layout/shop_app/login_screen/login_screen.dart';
import 'package:shop_app/shared/component/component.dart';
import 'package:shop_app/shared/style/color.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

//this class for handler the onBoarding screens
class BoardingModel {
  String? image;
  String? title;
  String? body;

  BoardingModel({required this.image, required this.title, required this.body});
}

class OnBoardingScreen extends StatefulWidget {
  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  List<BoardingModel> board = [
    BoardingModel(
        image: 'assets/images/onboarding1.png',
        title: 'on Boarding 1',
        body: 'On Boarding Body 1'),
    BoardingModel(
        image: 'assets/images/onboarding2.png',
        title: 'on Boarding 2',
        body: 'On Boarding Body 2'),
    BoardingModel(
        image: 'assets/images/onboarding3.png',
        title: 'on Boarding 3',
        body: 'On Boarding Body 3'),
  ];

  var boardController = PageController();
  //this for check if you arrived to last page in image
  bool isLast = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(onPressed: (){
            navigateAndFinish(context, ShopLoginScreen());
          }, child:const Text('Skip'),),
        ],
      ),
        body: Padding(
      padding: const EdgeInsets.all(30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: PageView.builder(
              onPageChanged: (int index){
                if (index == board.length - 1) {
                  setState(() {
                    isLast=true;
                  });
                }else{
                  setState(() {
                    isLast = false;
                  });
                }
              },
              controller: boardController,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) =>
                  _buildOnBoardingItem(board[index]),
              itemCount: board.length,
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Row(
            children: [
              SmoothPageIndicator(
                controller: boardController,
                count: board.length,
                effect: const ExpandingDotsEffect(
                  dotColor: Colors.grey,
                  dotHeight:10.0 ,
                  dotWidth: 10.0,
                  spacing:5.0,
                  expansionFactor: 4.0,
                  activeDotColor: defaultColor,
                ),
              ),
              const Spacer(),
              FloatingActionButton(
                onPressed: () {
                  if (isLast) {
                    navigateAndFinish(context, ShopLoginScreen());
                  }  else {
                    boardController.nextPage(
                      duration: const Duration(
                        milliseconds: 500,
                      ),
                      curve: Curves.easeInBack,
                    );
                  }
                },
                child: const Icon(Icons.arrow_forward_ios),
              ),
            ],
          ),
        ],
      ),
    ));
  }

//this widget for build item for on boarding
  Widget _buildOnBoardingItem(BoardingModel model) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: Image.asset('${model.image}')),
          const SizedBox(
            height: 30.0,
          ),
          Text(
            '${model.title}',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 14.0,
          ),
          Text(
            '${model.body}',
            style: const TextStyle(fontSize: 15.0),
          ),
          const SizedBox(
            height: 14.0,
          ),
        ],
      );
}
