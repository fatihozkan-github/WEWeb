import 'package:flutter/cupertino.dart';
import 'package:flutter/painting.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:we_web/UI/components/timeline.dart';
import 'package:we_web/services/service_localization.dart';
import 'package:we_web/UI/design_material/DM_assets.dart';
import 'package:we_web/UI/design_material/DM_colors.dart';
import 'package:we_web/UI/components/decoy_button.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'dart:html' as html;

class WelcomeScreen extends StatelessWidget {
  final TextStyle footerStyle = TextStyle(color: Colors.white, fontSize: 16);
  final tabTitleStyle = TextStyle(fontWeight: FontWeight.bold, fontSize: 18);
  final productTitleStyle = TextStyle(fontWeight: FontWeight.bold, color: UIColors.primaryColor, fontSize: 30);

  final GlobalKey _firstPart = GlobalKey();
  final GlobalKey _productsKey = GlobalKey();
  final GlobalKey _visionKey = GlobalKey();
  final GlobalKey _sustainabilityKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: UIColors.secondaryColor,
      appBar: _getAppBar(context, size),
      body: SingleChildScrollView(
        child: size.width <= 1000 ? _getSmallBody(size, context) : _getBigBody(size, context),
      ),
    );
  }

  _getSmallBody(size, context) => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(key: _firstPart, height: 10),
          SizedBox(width: size.width),
          _getTexts(size),
          _getImage(size),
          SizedBox(height: 30),
          _getProducts(context, size),
          _getCircles(size),
          _getVision(size),
          _getFooter(size),
        ],
      );

  _getBigBody(size, context) => Column(
        children: [
          SizedBox(key: _firstPart, height: 10),
          Container(
            width: size.width / 1.1,
            child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [_getTexts(size), _getImage(size)]),
          ),
          SizedBox(height: 30),
          _getTimeLine(size),
          SizedBox(height: 30),
          _getProducts(context, size),
          SizedBox(height: 60),
          Padding(padding: EdgeInsets.symmetric(horizontal: 70.0), child: _getVision(size)),
          SizedBox(height: 60),
          _getCircles(size),
          SizedBox(height: 60),
          _getFooter(size),
        ],
      );

  _getTimeLine(size) => Container(height: 160, child: ProcessTimelinePage());

  _getAppBar(context, size) => AppBar(
        elevation: 0,
        toolbarHeight: 120,
        automaticallyImplyLeading: false,
        backgroundColor: UIColors.secondaryColor,
        title: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () async => await Scrollable.ensureVisible(_firstPart.currentContext!, duration: Duration(seconds: 1)),
                child: Hero(
                  tag: 'we_logo',
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Image.asset(UIAssets.generalLogo, width: 80),
                  ),
                ),
              ),
              Row(
                children: [
                  TextButton(
                    child: Text(LocalizationService.localizedTexts.tab1Title, style: tabTitleStyle),
                    onPressed: () async =>
                        await Scrollable.ensureVisible(_firstPart.currentContext!, duration: Duration(seconds: 1)),
                  ),
                  TextButton(
                    child: Text(LocalizationService.localizedTexts.tab2Title, style: tabTitleStyle),
                    onPressed: () async =>
                        await Scrollable.ensureVisible(_productsKey.currentContext!, duration: Duration(seconds: 1)),
                  ),
                  TextButton(
                    child: Text(LocalizationService.localizedTexts.tab3Title, style: tabTitleStyle),
                    onPressed: () async =>
                        await Scrollable.ensureVisible(_visionKey.currentContext!, duration: Duration(seconds: 1)),
                  ),
                  TextButton(
                    child: Text(LocalizationService.localizedTexts.tab4Title, style: tabTitleStyle),
                    onPressed: () async =>
                        await Scrollable.ensureVisible(_sustainabilityKey.currentContext!, duration: Duration(seconds: 1)),
                  ),
                  TextButton(
                    child: Text(LocalizationService.localizedTexts.tab5Title, style: tabTitleStyle),
                    onPressed: () => Navigator.pushNamed(context, '/Iletisim'),
                  ),
                  SizedBox(width: 3.5),
                  MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 6.0),
                        child: Icon(FontAwesomeIcons.linkedin, color: Colors.blueGrey, size: 40),
                      ),
                      onTap: () => html.window.open("https://www.linkedin.com/company/weyourrecyclepartner", 'tab'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );

  _getTexts(size) => size.width <= 1000
      ? Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 15),
            DelayedDisplay(
              delay: Duration(seconds: 1),
              slidingBeginOffset: Offset(-0.35, 0.0),
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Empower Plastic Recycling\nwith ',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
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
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 12),
            DelayedDisplay(
              delay: Duration(seconds: 2),
              slidingBeginOffset: Offset(-0.35, 0.0),
              child: Text(
                'Plastik geri dönüşümüne katılımı artırmak ve \npaydaşlarımızın desteğiyle dünyadaki plastik\nayak izini azaltmak için mobil uygulama\nentegreli donanım çözümü geliştiriyoruz.',
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 17),
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
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
              ),
            ),
          ],
        )
      : Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 15),
              DelayedDisplay(
                delay: Duration(seconds: 1),
                slidingBeginOffset: Offset(-0.35, 0.0),
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'Empower Plastic Recycling\nwith ',
                        style: TextStyle(
                          fontSize: 28,
                          fontFamily: 'MontserratAlternates-Bold',
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      TextSpan(
                        text: 'Heroic Companies!',
                        style: TextStyle(
                          color: UIColors.primaryColor,
                          fontSize: 28,
                          fontFamily: 'MontserratAlternates-Bold',
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 12),
              DelayedDisplay(
                delay: Duration(seconds: 2),
                slidingBeginOffset: Offset(-0.35, 0.0),
                child: Text(
                  'Plastik geri dönüşümüne katılımı artırmak ve \npaydaşlarımızın desteğiyle dünyadaki plastik\nayak izini azaltmak için mobil uygulama\nentegreli donanım çözümü geliştiriyoruz.',
                  style: TextStyle(fontSize: 18),
                  // textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 17),
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
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );

  _getImage(size) => size.width <= 1000
      ? DelayedDisplay(
          delay: Duration(seconds: 1),
          child: Image.asset(UIAssets.cycleImage, width: 240),
        )
      : Expanded(
          child: Tooltip(
            message:
                '• Atık ayrıştırma\n • Atık dijitalleştirme\n • Çevreci pazarlama\n • Uluslararası raporlama\n • Sürdürülebilirlik',
            textStyle: TextStyle(fontSize: 18, color: Colors.white),
            padding: EdgeInsets.all(8.0),
            triggerMode: TooltipTriggerMode.manual,
            child: DelayedDisplay(
              delay: Duration(seconds: 1),
              child: Image.asset(UIAssets.cycleImage, width: 120),
            ),
          ),
        );

  _getProducts(context, size) => size.width <= 1000
      ? Column(
          key: _productsKey,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 800,
                  width: size.width,
                  child: FlipCard(
                    fill: Fill.fillBack,
                    front: Container(
                      padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 24.0),
                      decoration: BoxDecoration(color: Colors.grey.withOpacity(0.1), borderRadius: BorderRadius.circular(15.0)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'HeroStation',
                            style: TextStyle(fontWeight: FontWeight.bold, color: UIColors.primaryColor, fontSize: 28),
                          ),
                          Image.asset(UIAssets.heroStationImage),
                          DecoyButton(title: 'Daha Fazla Bilgi'),
                        ],
                      ),
                    ),
                    back: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'HeroStation',
                          style: TextStyle(fontWeight: FontWeight.bold, color: UIColors.primaryColor, fontSize: 28),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 30.0),
                          child: Text(
                            'Iot tabanlı ve akıllı geri dönüşüm kutularımız HeroStation\'lara kullanıcılarımız plastik atıklarını atarak dönüştürdükleri plastik gramı oranında WE Coin kazanır.',
                            textAlign: TextAlign.left,
                            style: TextStyle(fontSize: 24),
                          ),
                        ),
                        DecoyButton(title: ''),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 800,
                  width: size.width,
                  child: FlipCard(
                    fill: Fill.fillBack,
                    front: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'WE app',
                          style: TextStyle(fontWeight: FontWeight.bold, color: UIColors.primaryColor, fontSize: 28),
                        ),
                        Container(child: Image.asset(UIAssets.appImage)),
                        DecoyButton(title: 'Daha Fazla Bilgi'),
                      ],
                    ),
                    back: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'WE app',
                          style: TextStyle(fontWeight: FontWeight.bold, color: UIColors.primaryColor, fontSize: 28),
                        ),
                        Text(
                          'Cebindeki Geri Dönüşüm Partnerin',
                          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 30.0),
                          child: Text(
                            'Dönüştürdüğün plastik atık gramı, '
                            'izlediğin eğitim seti içeriği, '
                            'çevreci davranışların ile '
                            'WE Coin kazan.',
                            style: TextStyle(fontSize: 30),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        SizedBox(height: 10),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            MouseRegion(
                              cursor: SystemMouseCursors.click,
                              child: GestureDetector(
                                child: Image.asset(UIAssets.googlePlayBadge, height: 70),
                                onTap: () => html.window
                                    .open("https://play.google.com/store/apps/details?id=com.herostation&hl=tr&gl=TR", 'tab'),
                              ),
                            ),
                            MouseRegion(
                              cursor: SystemMouseCursors.click,
                              child: GestureDetector(
                                child: Image.asset(UIAssets.appStoreBadge, height: 70),
                                onTap: () => html.window.open("https://apps.apple.com/tr/app/we-app/id1581254822", 'tab'),
                              ),
                            ),
                          ],
                        ),
                        DecoyButton(title: ''),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        )
      : Column(
          key: _productsKey,
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 1.05,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 3,
                    child: FlipCard(
                      fill: Fill.fillBack,
                      front: Container(
                        padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 24.0),
                        decoration: BoxDecoration(color: Colors.grey.withOpacity(0.1), borderRadius: BorderRadius.circular(15.0)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'HeroStation',
                              style: TextStyle(fontWeight: FontWeight.bold, color: UIColors.primaryColor, fontSize: 30),
                            ),
                            Image.asset(UIAssets.heroStationImage),
                            DecoyButton(title: 'Daha Fazla Bilgi'),
                          ],
                        ),
                      ),
                      back: Container(
                        width: MediaQuery.of(context).size.width / 3,
                        padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 24.0),
                        decoration: BoxDecoration(color: Colors.grey.withOpacity(0.1), borderRadius: BorderRadius.circular(15.0)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'HeroStation',
                              style: TextStyle(fontWeight: FontWeight.bold, color: UIColors.primaryColor, fontSize: 30),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 30.0),
                              child: Text(
                                'Iot tabanlı ve akıllı geri dönüşüm kutularımız HeroStation\'lara kullanıcılarımız plastik atıklarını atarak dönüştürdükleri plastik gramı oranında WE Coin kazanır.',
                                textAlign: TextAlign.left,
                                style: TextStyle(fontSize: 30),
                              ),
                            ),
                            DecoyButton(title: ''),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 3,
                    child: FlipCard(
                      front: Container(
                        width: MediaQuery.of(context).size.width / 3,
                        padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 24.0),
                        decoration: BoxDecoration(color: Colors.grey.withOpacity(0.1), borderRadius: BorderRadius.circular(15.0)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'WE app',
                              style: TextStyle(fontWeight: FontWeight.bold, color: UIColors.primaryColor, fontSize: 30),
                            ),
                            Container(child: Image.asset(UIAssets.appImage)),
                            DecoyButton(title: 'Daha Fazla Bilgi'),
                          ],
                        ),
                      ),
                      back: Container(
                        width: MediaQuery.of(context).size.width / 3,
                        padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 24.0),
                        decoration: BoxDecoration(color: Colors.grey.withOpacity(0.1), borderRadius: BorderRadius.circular(15.0)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'WE app',
                              style: TextStyle(fontWeight: FontWeight.bold, color: UIColors.primaryColor, fontSize: 30),
                            ),
                            Text(
                              'Cebindeki Geri Dönüşüm Partnerin',
                              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 30.0),
                              child: Text(
                                'Dönüştürdüğün plastik atık gramı, '
                                'izlediğin eğitim seti içeriği, '
                                'çevreci davranışların ile '
                                'WE Coin kazan.',
                                style: TextStyle(fontSize: 30),
                                textAlign: TextAlign.left,
                              ),
                            ),
                            SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                MouseRegion(
                                  cursor: SystemMouseCursors.click,
                                  child: GestureDetector(
                                    child: Image.asset(UIAssets.googlePlayBadge, height: 70),
                                    onTap: () => html.window
                                        .open("https://play.google.com/store/apps/details?id=com.herostation&hl=tr&gl=TR", 'tab'),
                                  ),
                                ),
                                MouseRegion(
                                  cursor: SystemMouseCursors.click,
                                  child: GestureDetector(
                                    child: Image.asset(UIAssets.appStoreBadge, height: 70),
                                    onTap: () => html.window.open("https://apps.apple.com/tr/app/we-app/id1581254822", 'tab'),
                                  ),
                                ),
                              ],
                            ),
                            DecoyButton(title: ''),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );

  _getCircles(Size size) => size.width <= 1000
      ? Column(
          key: _sustainabilityKey,
          children: [
            Image.asset(UIAssets.circleImage),
            SizedBox(width: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'VİZYONUMUZ',
                  style: TextStyle(color: UIColors.primaryColor, fontSize: 30, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.end,
                ),
                SizedBox(height: 10),
                Text(
                  'Biz geri dönüşüm farkındalığını artırıp öncü şirket ve kurumlar ile Dünya’daki plastik ayak izini azaltmayı ve çalışanlarını bilgilendirirken güçlendirmeyi hedefleyen bir partneriz. Başta plastik atık olmak üzere tüm atıkların tıpkı çamaşır ve bulaşıklarımız gibi döngüde etkili bir şekilde yer almasını ve tüm paydaşlarımızın fayda sağlayarak kazançlı değer üretmesini hedefliyoruz.',
                  textAlign: TextAlign.end,
                  style: TextStyle(fontSize: 28),
                ),
              ],
            ),
            SizedBox(width: 15),
          ],
        )
      : Row(
          key: _sustainabilityKey,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: size.width / 1.28,
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(color: Colors.grey.withOpacity(0.1), borderRadius: BorderRadius.circular(15.0)),
              child: Row(
                children: [
                  Expanded(child: Image.asset(UIAssets.circleImage)),
                  SizedBox(width: 15),
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          'Birleşmiş Milletler\'in hedeflediği 8 konuya dokunuyoruz',
                          style: TextStyle(fontSize: 30),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 15),
                        Image.asset(UIAssets.tickImage),
                      ],
                    ),
                  ),
                  SizedBox(width: 15),
                ],
              ),
            ),
          ],
        );

  _getVision(Size size) => Container(
        key: _visionKey,
        width: size.width / 1.28,
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(color: Colors.grey.withOpacity(0.1), borderRadius: BorderRadius.circular(15.0)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'VİZYONUMUZ',
              style: TextStyle(color: UIColors.primaryColor, fontSize: 30, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Biz geri dönüşüm farkındalığını artırıp öncü şirket ve kurumlar ile Dünya’daki plastik ayak izini azaltmayı ve çalışanlarını bilgilendirirken güçlendirmeyi hedefleyen bir partneriz. Başta plastik atık olmak üzere tüm atıkların tıpkı çamaşır ve bulaşıklarımız gibi döngüde etkili bir şekilde yer almasını ve tüm paydaşlarımızın fayda sağlayarak kazançlı değer üretmesini hedefliyoruz.',
              style: TextStyle(fontSize: 24),
            ),
          ],
        ),
      );

  _getFooter(size) => Container(
        padding: EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: UIColors.primaryColor,
          borderRadius: BorderRadius.vertical(top: Radius.circular(15.0)),
        ),
        width: size.width,
        child: Container(
          width: size.width / 1.28,
          child: size.width <= 1000
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('WE', style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold)),
                        SizedBox(height: 5),
                        Text(
                          'Adres: Reşatpaça Mah. İTÜ Maslak Kampüsü\nİTÜ Arı 3 Teknokent No:4 İç Kapı No:1101 İstanbul\n34467/ Sarıyer',
                          style: footerStyle,
                        ),
                        SizedBox(height: 5),
                        Text('Mail: info@weofficial.tech', style: footerStyle),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text('Menü  ', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                        Row(
                          children: [
                            TextButton(
                              child: Text(LocalizationService.localizedTexts.tab1Title, style: footerStyle),
                              onPressed: () async =>
                                  await Scrollable.ensureVisible(_firstPart.currentContext!, duration: Duration(seconds: 1)),
                            ),
                            SizedBox(width: 3),
                            TextButton(
                              child: Text(LocalizationService.localizedTexts.tab2Title, style: footerStyle),
                              onPressed: () async =>
                                  await Scrollable.ensureVisible(_productsKey.currentContext!, duration: Duration(seconds: 1)),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            TextButton(
                              child: Text(LocalizationService.localizedTexts.tab3Title, style: footerStyle),
                              onPressed: () async =>
                                  await Scrollable.ensureVisible(_visionKey.currentContext!, duration: Duration(seconds: 1)),
                            ),
                            TextButton(
                              child: Text(LocalizationService.localizedTexts.tab4Title, style: footerStyle),
                              onPressed: () async => await Scrollable.ensureVisible(_sustainabilityKey.currentContext!,
                                  duration: Duration(seconds: 1)),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('WE', style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold)),
                        SizedBox(height: 5),
                        Text(
                          'Adres: Reşatpaça Mah. İTÜ Maslak Kampüsü\nİTÜ Arı 3 Teknokent No:4 İç Kapı No:1101 İstanbul\n34467/ Sarıyer',
                          style: footerStyle,
                        ),
                        SizedBox(height: 5),
                        Text('Mail: info@weofficial.tech', style: footerStyle),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text('Menü  ', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                        Row(
                          children: [
                            TextButton(
                              child: Text(LocalizationService.localizedTexts.tab1Title, style: footerStyle),
                              onPressed: () async =>
                                  await Scrollable.ensureVisible(_firstPart.currentContext!, duration: Duration(seconds: 1)),
                            ),
                            SizedBox(width: 3),
                            TextButton(
                              child: Text(LocalizationService.localizedTexts.tab2Title, style: footerStyle),
                              onPressed: () async =>
                                  await Scrollable.ensureVisible(_productsKey.currentContext!, duration: Duration(seconds: 1)),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            TextButton(
                              child: Text(LocalizationService.localizedTexts.tab3Title, style: footerStyle),
                              onPressed: () async =>
                                  await Scrollable.ensureVisible(_visionKey.currentContext!, duration: Duration(seconds: 1)),
                            ),
                            TextButton(
                              child: Text(LocalizationService.localizedTexts.tab4Title, style: footerStyle),
                              onPressed: () async => await Scrollable.ensureVisible(_sustainabilityKey.currentContext!,
                                  duration: Duration(seconds: 1)),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
        ),
      );
}
