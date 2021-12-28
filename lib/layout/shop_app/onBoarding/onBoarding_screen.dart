import 'package:flutter/material.dart';

//this class for handler the onBoarding screens
class BoardingModel {
  String? image;
  String? title;
  String? body;

  BoardingModel({required this.image, required this.title, required this.body});
}

class OnBoardingScreen extends StatelessWidget {
  List<BoardingModel> board = [
    BoardingModel(
        image: 'assets/images/onboarding1.jpg',
        title: 'on Boarding 1',
        body: 'On Boarding Body 1'),
    BoardingModel(
        image: 'assets/images/onboarding2.jpg',
        title: 'on Boarding 2',
        body: 'On Boarding Body 2'),
    BoardingModel(
        image: 'assets/images/onboarding3.jpg',
        title: 'on Boarding 3',
        body: 'On Boarding Body 3'),
  ];
  var boardController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: PageView.builder(
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
              const Text('Indicator'),
              const Spacer(),
              FloatingActionButton(
                onPressed: () {
                  boardController.nextPage(
                    duration:const Duration(
                      milliseconds: 500,
                    ),
                    curve: Curves.easeInBack,
                  );
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
