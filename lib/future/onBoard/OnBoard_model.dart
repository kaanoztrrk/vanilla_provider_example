class OnBoardModel {
  final String title;
  final String description;
  final String imageName;

  OnBoardModel(
      {required this.title,
      required this.description,
      required this.imageName});

  String get imageWithPath => 'asset/Images/$imageName.png';
}

class OnBoardModels {
  static List<OnBoardModel> onBoardModeItems = [
    OnBoardModel(
      title: "Order Yout Food",
      description: "Now you can order food any time rigth from yout mobile",
      imageName: "ic_burger",
    ),
    OnBoardModel(
      title: "Order Yout Food",
      description: "Now you can order food any time rigth from yout mobile",
      imageName: "ic_pizza",
    ),
    OnBoardModel(
      title: "Order Yout Food",
      description: "Now you can order food any time rigth from yout mobile",
      imageName: "ic_sushi",
    ),
  ];
}
