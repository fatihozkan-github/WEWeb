import 'package:delayed_display/delayed_display.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:we_web/UI/components/decoy_button.dart';
import 'package:we_web/services/service_localization.dart';
import 'package:we_web/UI/design_material/DM_assets.dart';
import 'package:we_web/UI/design_material/DM_colors.dart';
import 'package:flutter/material.dart';
import 'dart:html' as html;

class WelcomeScreen extends StatelessWidget {
  final tabTitleStyle = TextStyle(fontWeight: FontWeight.bold, fontSize: 18);
  final productTitleStyle = TextStyle(fontWeight: FontWeight.bold, color: UIColors.primaryColor, fontSize: 30);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: _getAppBar(context),
      body: ListView(
        children: [
          SizedBox(height: 10),
          Container(
            height: size.height / 1.2,
            child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [_getTexts(), _getImage()]),
          ),
          SizedBox(height: 30),
          _getProducts(context),
          SizedBox(height: 60),
          _getVision(size),
          SizedBox(height: 60),
          // _getCircles(size),
          SizedBox(height: 60),
          _getFooter(),
        ],
      ),
    );
  }

  _getAppBar(context) => AppBar(
        elevation: 0,
        leadingWidth: 120,
        toolbarHeight: 120,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        leading: Hero(tag: 'we_logo', child: Padding(padding: EdgeInsets.all(8.0), child: Image.asset(UIAssets.generalLogo))),
        title: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                child: Text(LocalizationService.localizedTexts.tab1Title, style: tabTitleStyle),
                onPressed: () => Navigator.pushNamed(context, '/Hosgeldiniz'),
              ),
              TextButton(
                child: Text(LocalizationService.localizedTexts.tab2Title, style: tabTitleStyle),
                onPressed: () => Navigator.pushNamed(context, '/Urunlerimiz'),
              ),
              TextButton(
                child: Text(LocalizationService.localizedTexts.tab3Title, style: tabTitleStyle),
                onPressed: () => Navigator.pushNamed(context, '/Vizyonumuz'),
              ),
              TextButton(
                child: Text(LocalizationService.localizedTexts.tab4Title, style: tabTitleStyle),
                onPressed: () => Navigator.pushNamed(context, ''),
              ),
              TextButton(
                child: Text(LocalizationService.localizedTexts.tab5Title, style: tabTitleStyle),
                onPressed: () => Navigator.pushNamed(context, ''),
              ),
              ElevatedButton(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    LocalizationService.localizedTexts.signUp,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, fontFamily: "MontserratAlternates"),
                  ),
                ),
                onPressed: () => Navigator.pushNamed(context, ''),
              ),
            ],
          ),
        ),
      );

  _getTexts() => Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DelayedDisplay(
              delay: Duration(seconds: 1),
              slidingBeginOffset: Offset(-0.35, 0.0),
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Empower Plastic Recycling\n with ',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30, fontFamily: "MontserratAlternates"),
                    ),
                    TextSpan(
                      text: 'Heroic Companies!',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: UIColors.primaryColor,
                          fontSize: 30,
                          fontFamily: "MontserratAlternates"),
                    ),
                  ],
                ),
                textAlign: TextAlign.end,
              ),
            ),
            SizedBox(height: 10),
            DelayedDisplay(
              delay: Duration(seconds: 2),
              slidingBeginOffset: Offset(-0.35, 0.0),
              child: ElevatedButton(
                onPressed: () {
                  String url = "https://docs.google.com/forms/d/1MpbNTwa6zhq3U11_mnweOX8XGWXusRUN-uMdkR3h0C4/edit?ts=61a7b02b";
                  html.window.open(url, 'tab');
                },
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Demo İsteyin',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, fontFamily: "MontserratAlternates"),
                  ),
                ),
              ),
            ),
          ],
        ),
      );

  _getImage() => Expanded(
        child: DelayedDisplay(
          delay: Duration(seconds: 1),
          child: Image.asset(UIAssets.cycleImage, width: 120),
        ),
      );

  _getProducts(context) => DelayedDisplay(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 1.2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 3,
                    child: FlipCard(
                      fill: Fill.fillBack,
                      front: Container(
                        padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
                        decoration: BoxDecoration(color: Colors.grey.withOpacity(0.1), borderRadius: BorderRadius.circular(15.0)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'HeroStation',
                              style: TextStyle(fontWeight: FontWeight.bold, color: UIColors.primaryColor, fontSize: 30),
                            ),
                            Image.asset(UIAssets.heroStationImage, width: MediaQuery.of(context).size.width / 3),
                            DecoyButton(title: 'Daha Fazla Bilgi'),
                          ],
                        ),
                      ),
                      back: Container(
                        width: MediaQuery.of(context).size.width / 3,
                        padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
                        decoration: BoxDecoration(color: Colors.grey.withOpacity(0.1), borderRadius: BorderRadius.circular(15.0)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'HeroStation',
                              style: TextStyle(fontWeight: FontWeight.bold, color: UIColors.primaryColor, fontSize: 30),
                            ),
                            Text(
                              'Iot tabanlı, akıllı, geri dönüşüm kutularımız HeroStation\'lara kullanıcılarımız plastik atıklarını atarak dönüştürdükleri plastik gramı oranında WE Coin kazanıyorlar.',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 28),
                            ),
                            DecoyButton(title: 'Geri Dön'),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 3,
                    decoration: BoxDecoration(color: Colors.grey.withOpacity(0.1), borderRadius: BorderRadius.circular(15.0)),
                    child: FlipCard(
                      front: Container(
                        padding: EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              'WE app',
                              style: TextStyle(fontWeight: FontWeight.bold, color: UIColors.primaryColor, fontSize: 30),
                            ),
                            Container(child: Image.asset(UIAssets.appImage)),
                            Container(
                              padding: EdgeInsets.all(12.0),
                              child: Text('Daha Fazla Bilgi', style: TextStyle(color: Colors.white)),
                              decoration: BoxDecoration(color: UIColors.primaryColor, borderRadius: BorderRadius.circular(15.0)),
                            ),
                          ],
                        ),
                      ),
                      back: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              Text(
                                'WE app',
                                style: TextStyle(fontWeight: FontWeight.bold, color: UIColors.primaryColor, fontSize: 30),
                              ),
                              SizedBox(height: 5),
                              Text(
                                'Cebindeki Geri Dönüşüm Partnerin',
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                              ),
                            ],
                          ),
                          Text(
                            'Dönüştürdüğün plastik atık gramı,\n'
                            'İzlediğin eğitim seti içeriği,\n'
                            'Çevreci davranışların ile',
                            style: TextStyle(fontSize: 20),
                          ),
                          Text('WE Coin\'i kazan\n'),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              MouseRegion(
                                cursor: SystemMouseCursors.click,
                                child: GestureDetector(
                                  child: Image.asset(UIAssets.googlePlayBadge, height: 60),
                                  onTap: () => html.window
                                      .open("https://play.google.com/store/apps/details?id=com.herostation&hl=tr&gl=TR", 'tab'),
                                ),
                              ),
                              MouseRegion(
                                cursor: SystemMouseCursors.click,
                                child: GestureDetector(
                                  child: Image.asset(UIAssets.appStoreBadge, height: 60),
                                  onTap: () => html.window.open("https://apps.apple.com/tr/app/we-app/id1581254822", 'tab'),
                                ),
                              ),
                            ],
                          ),
                          DecoyButton(title: 'Geri Dön'),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );

  _getVision(Size size) => DelayedDisplay(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: size.width / 3,
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(color: Colors.grey.withOpacity(0.1), borderRadius: BorderRadius.circular(15.0)),
              child: Column(
                children: [
                  Text('VİZYONUMUZ', style: TextStyle(color: UIColors.primaryColor, fontSize: 24, fontWeight: FontWeight.bold)),
                  SizedBox(height: 10),
                  Text(
                    'Biz geri dönüşüm farkındalığını artırıp öncü şirket ve kurumlar ile Dünya’daki plastik ayak izini azaltmayı ve çalışanlarını bilgilendirirken güçlendirmeyi hedefleyen bir partneriz. Başta plastik atık olmak üzere tüm atıkların tıpkı çamaşır ve bulaşıklarımız gibi döngüde etkili bir şekilde yer almasını ve tüm paydaşlarımızın fayda sağlayarak kazançlı değer üretmesini hedefliyoruz.',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ],
        ),
      );

  _getCircles(Size size) => Container(
        height: size.height / 1.2,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(child: Image.asset(UIAssets.circleImage)),
            Expanded(child: Image.asset(UIAssets.tickImage)),
          ],
        ),
      );

  _getFooter() => Container(
        padding: EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: UIColors.primaryColor,
          borderRadius: BorderRadius.vertical(top: Radius.circular(15.0)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(LocalizationService.localizedTexts.tab1Title, style: TextStyle(color: Colors.white, fontSize: 18)),
                Text(LocalizationService.localizedTexts.tab2Title, style: TextStyle(color: Colors.white, fontSize: 18)),
                Text(LocalizationService.localizedTexts.tab3Title, style: TextStyle(color: Colors.white, fontSize: 18)),
                Text(LocalizationService.localizedTexts.tab4Title, style: TextStyle(color: Colors.white, fontSize: 18)),
              ],
            ),
            Column(
              children: [
                Text('İletişim', style: TextStyle(color: Colors.white)),
                Text('tab1', style: TextStyle(color: Colors.white)),
                Text('Tab2', style: TextStyle(color: Colors.white)),
                Text('Tab3', style: TextStyle(color: Colors.white)),
                Text('Tab4', style: TextStyle(color: Colors.white)),
              ],
            ),
          ],
        ),
      );
}
