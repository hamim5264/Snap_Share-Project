import 'package:flutter/material.dart';
import 'package:snap_share/presentation/ui/utility/assets_path.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({super.key, this.width, this.height});

  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AssetsPath.logo,
      width: width ?? 250,
      height: height ?? 250,
    );
  }
}
