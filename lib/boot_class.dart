
import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';
import 'package:taxfree/presentation/widget/appbar.dart';
import 'package:taxfree/presentation/widget/textfield.dart';
import 'dart:math' as math;
import 'module/utils /methods/app_colors.dart';
import 'module/utils /sizeing.dart';

class AppBootStrap extends StatefulWidget {
  const AppBootStrap({super.key});

  @override
  State<AppBootStrap> createState() => _AppBootStrapState();
}

class _AppBootStrapState extends State<AppBootStrap> {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: maastrichtBlue,
        body: Column(
          children: [
            const MyAppBar(
              color: Colors.blue,
              icon: Icon(EneftyIcons.category_2_outline,size: 28,),
              title: null,
              endingIcon: Icon(EneftyIcons.setting_2_outline,size: 28,),
            ),
            const SizedBox(
              height: 60,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Transform.rotate(
                  angle: -math.pi / 2.2,
                  child: Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: const Icon(EneftyIcons.vuesax_outline,size: 60,color: maastrichtBlue,),
                  )
                ),
                SizedBox(
                  width: 8,
                ),
                Transform.rotate(
                    angle: math.pi / 2.2,
                    child: Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(24),

                      ),
                      child:  Transform.rotate(
                        angle: -math.pi /2,
                        child: const Icon(EneftyIcons.woman_outline,size: 60,color: maastrichtBlue,)),
                    )
                ),


              ],
            ),
            verticalSpace24,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: MoolNewInputField(controller: TextEditingController(),),
            ),


          ],
        )
      ),
    );
  }
}


