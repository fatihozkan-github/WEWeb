import 'package:we_web/UI/design_material/DM_assets.dart';
import 'package:we_web/UI/design_material/DM_colors.dart';
import 'package:we_web/services/service_localization.dart';
import 'package:flutter/material.dart';

class ProductsScreens extends StatelessWidget {
  final titleStyle = TextStyle(fontWeight: FontWeight.bold, fontSize: 18);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leadingWidth: 96,
        toolbarHeight: 96,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        leading: Padding(padding: EdgeInsets.all(8.0), child: Image.asset(UIAssets.generalLogo)),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
              child: Text(
                LocalizationService.localizedTexts.tab1Title,
                style: titleStyle,
              ),
              onPressed: () => Navigator.pushNamed(context, '/Hosgeldiniz'),
            ),
            TextButton(
              child: Text(
                LocalizationService.localizedTexts.tab2Title,
                style: titleStyle,
              ),
              onPressed: () => Navigator.pushNamed(context, '/Urunlerimiz'),
            ),
            TextButton(
              child: Text(
                LocalizationService.localizedTexts.tab3Title,
                style: titleStyle,
              ),
              onPressed: () => Navigator.pushNamed(context, ''),
            ),
            TextButton(
              child: Text(
                LocalizationService.localizedTexts.tab4Title,
                style: titleStyle,
              ),
              onPressed: () => Navigator.pushNamed(context, ''),
            ),
            TextButton(
              child: Text(
                LocalizationService.localizedTexts.tab5Title,
                style: titleStyle,
              ),
              onPressed: () => Navigator.pushNamed(context, ''),
            ),
            ElevatedButton(
              child: Text(
                LocalizationService.localizedTexts.signUp,
                style: titleStyle,
              ),
              onPressed: () => Navigator.pushNamed(context, ''),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          // Container(
          //   decoration: BoxDecoration(
          //     color: Colors.grey.withOpacity(0.1),
          //   ),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //     children: [
          //       Column(
          //         children: [
          //           Text.rich(
          //             TextSpan(
          //               children: [
          //                 TextSpan(
          //                   text: 'WE app\n',
          //                   style: TextStyle(fontWeight: FontWeight.bold, color: UIColors.primaryColor, fontSize: 30),
          //                 ),
          //                 TextSpan(
          //                   text: 'Cebindeki Geri Dönüşüm Partnerin',
          //                   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
          //                 ),
          //               ],
          //             ),
          //             textAlign: TextAlign.center,
          //           ),
          //           SizedBox(height: 15),
          //           Image.asset(UIAssets.generalLogo)
          //         ],
          //       ),
          //       Column(
          //         children: [
          //           Text.rich(
          //             TextSpan(
          //               children: [
          //                 TextSpan(
          //                   text: 'We coini kazan',
          //                   style: TextStyle(fontWeight: FontWeight.bold, color: UIColors.primaryColor, fontSize: 30),
          //                 ),
          //                 TextSpan(
          //                   text: '...',
          //                   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
          //                 ),
          //               ],
          //             ),
          //           ),
          //         ],
          //       ),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}
