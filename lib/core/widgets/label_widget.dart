import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LabelWidget extends StatelessWidget {
  final String url;
  const LabelWidget({Key? key,required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var a = url.lastIndexOf('svg');
    if (a == -1) {
      return CircleAvatar(
        radius: 25,
        backgroundImage: NetworkImage(
          url,
        ),
      );
    } else {
      return Container(
        height: 50,
        width: 50,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
        ),
        child: SvgPicture.network(
          url,
          fit: BoxFit.cover,
        ),
      );
    }
  }
}
