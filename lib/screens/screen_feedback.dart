import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mailto/mailto.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:we_web/UI/components/rounded_text_field.dart';
import 'package:flutter/material.dart';
import 'dart:html' as html;

import 'package:we_web/UI/design_material/DM_colors.dart';
import 'package:we_web/services/service_localization.dart';

class FeedbackScreen extends StatefulWidget {
  @override
  State<FeedbackScreen> createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final TextStyle footerStyle = TextStyle(color: Colors.white, fontSize: 16);

  String? _name;
  String? _mail;
  String? _message;

  launchMailto(name, message) async {
    final mailtoLink = Mailto(
      to: ['info@weofficial.tech'],
      subject: name,
      body: message,
    );
    await launch('$mailtoLink');
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('İletişim', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                SizedBox(height: 20),
                Form(
                  key: _formKey,
                  child: Container(
                    padding: size.width <= 768
                        ? EdgeInsets.symmetric(horizontal: 12.0)
                        : EdgeInsets.symmetric(horizontal: size.width / 4),
                    child: Column(
                      children: [
                        RoundedTextField(
                          hintText: 'İsim',
                          onChanged: (_typed) => setState(() => _name = _typed),
                          validator: (_typed) {
                            return _typed!.isEmpty ? 'Boş bırakılamaz' : null;
                          },
                        ),
                        RoundedTextField(
                          hintText: 'Mail',
                          icon: Icons.mail_rounded,
                          onChanged: (_typed) => setState(() => _mail = _typed),
                          validator: (_typed) {
                            return _typed!.isEmpty ? 'Boş bırakılamaz' : null;
                          },
                        ),
                        RoundedTextField(
                          hintText: 'Mesajınız',
                          icon: Icons.message_rounded,
                          maxLines: 5,
                          keyboardType: TextInputType.multiline,
                          onChanged: (_typed) => setState(() => _message = _typed),
                          validator: (_typed) {
                            return _typed!.isEmpty ? 'Boş bırakılamaz' : null;
                          },
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton.icon(
                              label: Padding(padding: EdgeInsets.all(8.0), child: Text('Gönder')),
                              icon: Icon(Icons.send_rounded),
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  await launchMailto(_name, _message);
                                }
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Text('Bize Ulaşın', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () => html.window.open("https://discord.com/invite/hJ2n2ufVQM", 'tab'),
                      child: Icon(FontAwesomeIcons.discord, color: Colors.blue),
                    ),
                    SizedBox(width: 15),
                    GestureDetector(
                      onTap: () => html.window.open("https://www.instagram.com/werecycle.official/?utm_medium=copy_link", 'tab'),
                      child: Icon(FontAwesomeIcons.instagram, color: Colors.pink),
                    ),
                  ],
                ),
              ],
            ),
          ),
          _getFooter(MediaQuery.of(context).size),
        ],
      ),
    );
  }

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
                              onPressed: () async => await Navigator.pushNamed(context, '/Hosgeldiniz'),
                            ),
                            SizedBox(width: 3),
                            TextButton(
                              child: Text(LocalizationService.localizedTexts.tab2Title, style: footerStyle),
                              onPressed: () async => await Navigator.pushNamed(context, '/Hosgeldiniz'),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            TextButton(
                              child: Text(LocalizationService.localizedTexts.tab3Title, style: footerStyle),
                              onPressed: () async => await Navigator.pushNamed(context, '/Hosgeldiniz'),
                            ),
                            TextButton(
                              child: Text(LocalizationService.localizedTexts.tab4Title, style: footerStyle),
                              onPressed: () async => await Navigator.pushNamed(context, '/Hosgeldiniz'),
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
                              onPressed: () async => await Navigator.pushNamed(context, '/Hosgeldiniz'),
                            ),
                            SizedBox(width: 3),
                            TextButton(
                              child: Text(LocalizationService.localizedTexts.tab2Title, style: footerStyle),
                              onPressed: () async => await Navigator.pushNamed(context, '/Hosgeldiniz'),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            TextButton(
                              child: Text(LocalizationService.localizedTexts.tab3Title, style: footerStyle),
                              onPressed: () async => await Navigator.pushNamed(context, '/Hosgeldiniz'),
                            ),
                            TextButton(
                              child: Text(LocalizationService.localizedTexts.tab4Title, style: footerStyle),
                              onPressed: () async => await Navigator.pushNamed(context, '/Hosgeldiniz'),
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
