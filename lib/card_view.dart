import 'package:flutter/cupertino.dart';

class ReusableCard extends StatelessWidget {
  const ReusableCard({
    super.key,
    required this.colour,
    this.cardChild,
    required this.onPressed,
  });

  final Color colour;
  final Widget? cardChild;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: colour,
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: cardChild,
      ),
    );
  }
}
