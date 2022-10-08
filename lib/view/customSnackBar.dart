
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomSnackBarContent extends StatelessWidget {
  const CustomSnackBarContent({
    super.key, required this.message, required this.backgroundColor,
  });
  final String message;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 90,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            children: [
              const SizedBox(
                width: 48,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:  [
                   const Text(
                      "Oh snap!",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 10,),
                    Text(
                      message,
                      style:const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 0,
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(20),
            ),
            child: SvgPicture.asset(
              'assets/icons/bubbles.svg',
              height: 48,
              width: 40,
            ),
          ),
        ),
        Positioned(
          top: -14,
          left: 0,
          child: Stack(
            alignment: Alignment.center,
            children: [
              SvgPicture.asset(
              'assets/icons/fail.svg',
              height: 40,
            ),
            Positioned(
              top: 10,
              child: SvgPicture.asset(
                'assets/icons/close.svg',
                height: 16,
              ),
            ),
            ],
          ),
        )
      ],
    );
  }
}
