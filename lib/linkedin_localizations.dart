import 'dart:async';

import 'package:flutter/foundation.dart' show SynchronousFuture;
import 'package:flutter/material.dart';

class LinkedInLocalizations {
  LinkedInLocalizations(this.locale);

  final Locale locale;

  static LinkedInLocalizations of(BuildContext context) {
    return Localizations.of<LinkedInLocalizations>(context, LinkedInLocalizations);
  }

  static Map<String, Map<String, String>> _localizedValues = {
    'en': {
      'title': 'LinkedIn Flutter Demo',
      'home': 'home',
      'homeTitle': 'Search for members, positions, companies and other contents',
      'profession': 'profession',
      'connection': 'connection',
      'message': 'message',
      'my': 'my'
    },
    'zh': {
      'title': 'LinkedIn Flutter 演示',
      'home': '首页',
      'homeTitle': '搜索会员、职位、公司及其他内容',
      'profession': '职业',
      'connection': '人脉',
      'message': '消息',
      'my': '我'
    },
  };

  String get title => _localizedValues[locale.languageCode]['title'];

  String get home => _localizedValues[locale.languageCode]['home'];

  String get profession => _localizedValues[locale.languageCode]['profession'];

  String get connection => _localizedValues[locale.languageCode]['connection'];

  String get message => _localizedValues[locale.languageCode]['message'];

  String get my => _localizedValues[locale.languageCode]['my'];

  String get homeTitle => _localizedValues[locale.languageCode]['homeTitle'];
}

class LinkedInLocalizationsDelegate extends LocalizationsDelegate<LinkedInLocalizations> {
  LinkedInLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en', 'zh'].contains(locale.languageCode);
  }

  @override
  Future<LinkedInLocalizations> load(Locale locale) {
    return SynchronousFuture<LinkedInLocalizations>(LinkedInLocalizations(locale));
  }

  @override
  bool shouldReload(LocalizationsDelegate<LinkedInLocalizations> old) {
    return false;
  }

}