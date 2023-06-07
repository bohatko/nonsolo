import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['ru', 'en'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? ruText = '',
    String? enText = '',
  }) =>
      [ruText, enText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // Home
  {
    'hd5w8f45': {
      'ru': 'Калуга',
      'en': '',
    },
    'vy93pg2g': {
      'ru': 'Время работы: 08:00-21:00',
      'en': '',
    },
    'o9yeklzd': {
      'ru': 'Еда',
      'en': '',
    },
  },
  // Sales
  {
    'bcf7ca1w': {
      'ru': 'Акции',
      'en': '',
    },
    'b9uqhi2l': {
      'ru': 'Завершенные ',
      'en': '',
    },
    'eldc7kvz': {
      'ru': 'Акции',
      'en': '',
    },
  },
  // YoureOrders
  {
    'c80eef7g': {
      'ru': 'Активные',
      'en': '',
    },
    'yejlqkyc': {
      'ru': 'Отменить',
      'en': '',
    },
    'rwai7w1r': {
      'ru': 'Подробнее..',
      'en': '',
    },
    '8pdpgkvg': {
      'ru': 'Завершенные',
      'en': '',
    },
    'uun0xeml': {
      'ru': 'Завершен',
      'en': '',
    },
    'pu33qn8m': {
      'ru': 'Подробнее..',
      'en': '',
    },
    '74hq6tvf': {
      'ru': 'Отмененные',
      'en': '',
    },
    'fd5unv1n': {
      'ru': 'Отменен',
      'en': '',
    },
    'hqevo5ft': {
      'ru': 'Ваши заказы',
      'en': '',
    },
  },
  // Profile
  {
    '2rx19dy0': {
      'ru': 'Добро пожаловать в ваш кабинет',
      'en': '',
    },
    'aav75r0c': {
      'ru': 'Информация',
      'en': '',
    },
    '5i89kvll': {
      'ru': 'Редактировать профиль',
      'en': '',
    },
    'ztrj6r50': {
      'ru': 'Заказы',
      'en': '',
    },
    'b72blu7j': {
      'ru': 'Ваши адреса доставки',
      'en': '',
    },
    '904bvzkb': {
      'ru': 'Ваши карты',
      'en': '',
    },
    'urg899db': {
      'ru': 'Ещё',
      'en': '',
    },
    'yhawd6yf': {
      'ru': 'Поддержка',
      'en': '',
    },
    'cq8o30ub': {
      'ru': 'Условия использования',
      'en': '',
    },
    'w4htjeg9': {
      'ru': 'Профиль',
      'en': '',
    },
  },
  // EditProfile
  {
    'xfqb2amg': {
      'ru': 'Сменить фото',
      'en': '',
    },
    'iuek73y4': {
      'ru': 'Ваше имя',
      'en': '',
    },
    'xbjol61v': {
      'ru': 'Номер телефона',
      'en': '',
    },
    'kuyconsj': {
      'ru': '+',
      'en': '',
    },
    'mpqulr2x': {
      'ru': 'Сохранить изменения',
      'en': '',
    },
    'vyggoasr': {
      'ru': 'Редактировать профиль',
      'en': '',
    },
    'giy1d321': {
      'ru': 'Home',
      'en': '',
    },
  },
  // CheckOut
  {
    't2ithmnm': {
      'ru': 'Очистить',
      'en': '',
    },
    '3ltv6tyc': {
      'ru': 'Итого по заказу',
      'en': '',
    },
    'dsf48lg7': {
      'ru': 'Промежуточный итог',
      'en': '',
    },
    '2ycc1j7p': {
      'ru': 'Доставка',
      'en': '',
    },
    'vfxejdfs': {
      'ru': 'Итого',
      'en': '',
    },
    'eh15gve6': {
      'ru': 'Адрес доставки',
      'en': '',
    },
    'h2sbsrfu': {
      'ru': 'Способ оплаты',
      'en': '',
    },
    'htjf8xpt': {
      'ru': 'Оформить заказ',
      'en': '',
    },
    '5k2tiadm': {
      'ru': 'Оформление заказа',
      'en': '',
    },
    'ycwja0hh': {
      'ru': 'Корзина',
      'en': '',
    },
  },
  // SalesComplited
  {
    'jw9egqab': {
      'ru': 'Акция завершена',
      'en': '',
    },
    '0mx5ahnm': {
      'ru': 'Завершенные акции',
      'en': '',
    },
    'layrj0rv': {
      'ru': 'Home',
      'en': '',
    },
  },
  // More
  {
    'cw0p2zts': {
      'ru': 'Еще',
      'en': '',
    },
    '951ush7h': {
      'ru': 'Наши рестораны',
      'en': '',
    },
    'bubwmsgq': {
      'ru': 'Обратная связь',
      'en': '',
    },
    'qwcfezn2': {
      'ru': 'Бонусы',
      'en': '',
    },
    'a8ylg9vi': {
      'ru': 'Платежи',
      'en': '',
    },
    'jhr6bc21': {
      'ru': 'Позвонить нам',
      'en': '',
    },
    'hdso3tpo': {
      'ru': 'Написать в WhatsApp',
      'en': '',
    },
    'pbvba9v3': {
      'ru': 'Ищите нас в соцсетях',
      'en': '',
    },
    '599eeofi': {
      'ru': 'Политика конфиденциальности',
      'en': '',
    },
    'jdqrk9ix': {
      'ru': 'Правила использования',
      'en': '',
    },
    'mz6xtrm8': {
      'ru': 'Для клиентов',
      'en': '',
    },
    '2r9phtfq': {
      'ru': 'Правила продаж',
      'en': '',
    },
    'y8m3c70y': {
      'ru': 'Реквизиты',
      'en': '',
    },
    'mtviqd2w': {
      'ru': '© 2023,  NON SOLO\nВерсия 1.0.1',
      'en': '',
    },
    'ls593uhf': {
      'ru': 'Еще',
      'en': '',
    },
  },
  // Start1
  {
    'kl51gotj': {
      'ru': 'Заказывай еду',
      'en': '',
    },
    'sdcgo1zf': {
      'ru': 'Заказывайте еду в нашем ресторане из фирменного приложения',
      'en': '',
    },
    'wnj7zmyt': {
      'ru': 'Далее',
      'en': '',
    },
    'v9csb1z2': {
      'ru': 'Home',
      'en': '',
    },
  },
  // SalesMore
  {
    '4iw28uen': {
      'ru': 'За покупками',
      'en': '',
    },
    'bmsx2fp5': {
      'ru': 'Подробнее об акции',
      'en': '',
    },
    'vdzusatb': {
      'ru': 'Home',
      'en': '',
    },
  },
  // Start2
  {
    'avesetfq': {
      'ru': 'Плати удобно',
      'en': '',
    },
    'd8lamxhb': {
      'ru': 'Оплачивайте любым удобным для вас способом',
      'en': '',
    },
    'c0b1wltw': {
      'ru': 'Дальше',
      'en': '',
    },
    'rs11rk8a': {
      'ru': 'Home',
      'en': '',
    },
  },
  // Start3
  {
    'gjshnl7q': {
      'ru': 'Быстрая доставка',
      'en': '',
    },
    'jn7a9872': {
      'ru': 'Вы можете забрать заказ в ресторане или мы доставим по адресу',
      'en': '',
    },
    'ajj5pd5n': {
      'ru': 'Начнём!',
      'en': '',
    },
    'u25nackj': {
      'ru': 'Home',
      'en': '',
    },
  },
  // CategoryMore
  {
    'ujsu4ioz': {
      'ru': 'Все',
      'en': '',
    },
    'iwflgcvn': {
      'ru': 'Рекомендованные',
      'en': '',
    },
    'ebojup1y': {
      'ru': 'Диета',
      'en': '',
    },
    '1l1yvfwl': {
      'ru': 'Без консервантов',
      'en': '',
    },
    'iasslxmg': {
      'ru': 'Здоровое питание',
      'en': '',
    },
    'yez5ml2p': {
      'ru': 'Без сахара',
      'en': '',
    },
    'n4xcwabj': {
      'ru': 'Все',
      'en': '',
    },
    '02zceh9s': {
      'ru': 'All',
      'en': '',
    },
    'z09jzpsk': {
      'ru': 'Категория ',
      'en': '',
    },
    'dtzmyi9x': {
      'ru': 'Home',
      'en': '',
    },
  },
  // ProduktMore
  {
    'j7g8abjc': {
      'ru': 'Option 1',
      'en': '',
    },
    'o632vg8f': {
      'ru': 'Добавить в  корзину',
      'en': '',
    },
    'wifcvu28': {
      'ru': 'Удалить из корзины',
      'en': '',
    },
    '9dnxydez': {
      'ru': 'Подробнее о товаре',
      'en': '',
    },
    'umuz4u3j': {
      'ru': 'Home',
      'en': '',
    },
  },
  // DeliveryMethod
  {
    'a26kma3w': {
      'ru': 'Выберите способ доставки',
      'en': '',
    },
    '2gdq77wd': {
      'ru': 'Выберите ресторан из\n который Вы хотите забрать заказ',
      'en': '',
    },
    '4xfk3t6v': {
      'ru': 'Калуга, ул. Советская 19',
      'en': '',
    },
    '7ug38tn8': {
      'ru': 'Калуга, ул. Интернациональная 50',
      'en': '',
    },
    'rnsre7l0': {
      'ru': 'Выберите адрес ресторана',
      'en': '',
    },
    'fnc65ew1': {
      'ru': 'Dubai',
      'en': '',
    },
    '3nkguz23': {
      'ru': 'Или закажите доставку курьером',
      'en': '',
    },
    'g6yqcx9t': {
      'ru': 'Введите адрес доставки',
      'en': '',
    },
    'mxy0dbgb': {
      'ru': 'Подтвердить',
      'en': '',
    },
    '2agppyfx': {
      'ru': 'Способ доставки',
      'en': '',
    },
    'me8cf8dm': {
      'ru': 'Home',
      'en': '',
    },
  },
  // PaymentMethod
  {
    's67f1sv2': {
      'ru': 'Select a Payment Method',
      'en': '',
    },
    'ybza6x5x': {
      'ru': 'Наличными',
      'en': '',
    },
    'ydv41z2a': {
      'ru': 'Банковская карта',
      'en': '',
    },
    'l910zod9': {
      'ru': 'Подтвердить',
      'en': '',
    },
    'hb11tna2': {
      'ru': 'Способы оплаты',
      'en': '',
    },
    'eetqsaf5': {
      'ru': 'Home',
      'en': '',
    },
  },
  // CancelOrder
  {
    '7xh2ezmm': {
      'ru': 'Выбирите причину',
      'en': '',
    },
    '0vmxyv09': {
      'ru': 'Слишком долго ждать ',
      'en': '',
    },
    '97sl5d6o': {
      'ru': 'Потерял контакт водителя',
      'en': '',
    },
    '2onvs3il': {
      'ru': 'Неверный адрес доставки',
      'en': '',
    },
    'tiennywz': {
      'ru': 'Неверный заказ',
      'en': '',
    },
    'c5t52k4q': {
      'ru': 'Просто хочу оменить',
      'en': '',
    },
    '9ucnjcur': {
      'ru': 'Хочу заказть в другом ресторане',
      'en': '',
    },
    'aop8wflo': {
      'ru': 'Другая причина',
      'en': '',
    },
    'ezdoa7cx': {
      'ru': 'Напишите причину здесь',
      'en': '',
    },
    'q2eo0m9q': {
      'ru': 'Отменить заказ',
      'en': '',
    },
    'u1al8txy': {
      'ru': 'Отмена заказа',
      'en': '',
    },
    'n1d3pgqp': {
      'ru': 'Home',
      'en': '',
    },
  },
  // OrderComplited
  {
    'kgyt42sz': {
      'ru': 'Ваш заказ принят!',
      'en': '',
    },
    'm9dly4er': {
      'ru': 'Ожидайте,  наш менеджер \nсвяжется с вами в ближайшее время!',
      'en': '',
    },
    'w76vn6bh': {
      'ru': 'Мои заказы',
      'en': '',
    },
    'moqffbhv': {
      'ru': 'На главную',
      'en': '',
    },
    'u2uxmd8w': {
      'ru': 'Home',
      'en': '',
    },
  },
  // Login
  {
    'ff1ol1wl': {
      'ru': 'Добро пожаловать',
      'en': '',
    },
    'x98eqf5p': {
      'ru': 'Email адрес',
      'en': '',
    },
    '90rmk1ge': {
      'ru': 'Введите  email здесь',
      'en': '',
    },
    'tiq5csar': {
      'ru': 'Пароль',
      'en': '',
    },
    'ss3fq49d': {
      'ru': 'Введите свой пароль ',
      'en': '',
    },
    'yynkeycx': {
      'ru': 'Забили пароль?',
      'en': '',
    },
    'er84it6a': {
      'ru': 'Войти',
      'en': '',
    },
    'myu71nu7': {
      'ru': 'Создать аккаунт',
      'en': '',
    },
    '4lvn7y3r': {
      'ru': 'Home',
      'en': '',
    },
  },
  // SignUp
  {
    '89zhjgly': {
      'ru': 'Итак, приступим',
      'en': '',
    },
    'wco9yehj': {
      'ru': 'Имя',
      'en': '',
    },
    '48npeasi': {
      'ru': 'Введите Ваше имя',
      'en': '',
    },
    'uw3ulwmi': {
      'ru': 'Номер телефона',
      'en': '',
    },
    'x8bpxrkq': {
      'ru': 'Введите ваш номер телефона',
      'en': '',
    },
    '6cq45t89': {
      'ru': 'Email',
      'en': '',
    },
    '3tdwway0': {
      'ru': 'Введите Ваш email',
      'en': '',
    },
    'nblyzwke': {
      'ru': 'Пароль',
      'en': '',
    },
    '09cvl3bs': {
      'ru': 'Введите пароль',
      'en': '',
    },
    '0w0er546': {
      'ru': 'Создать аккаунт',
      'en': '',
    },
    'h2lc4x3j': {
      'ru': 'ВОЙТИ',
      'en': '',
    },
    'tov6bse0': {
      'ru': 'Home',
      'en': '',
    },
  },
  // fogot_pass
  {
    '6kmpywwn': {
      'ru':
          'Мы отправим вам электронное письмо со ссылкой для сброса пароля. Пожалуйста, введите адрес электронной почты, связанный с вашей учетной записью, ниже.',
      'en': '',
    },
    'b4rhfav5': {
      'ru': 'Ваш  email адрес',
      'en': '',
    },
    'izcbwigx': {
      'ru': 'Введите Ваш email',
      'en': '',
    },
    '0fgc1qyy': {
      'ru': 'Отправить ссылку',
      'en': '',
    },
    '742xzhsx': {
      'ru': 'Востановление пароля',
      'en': '',
    },
    'l0rl6b4y': {
      'ru': 'Home',
      'en': '',
    },
  },
  // Chek
  {
    'ftqni5xd': {
      'ru': 'Подробности заказа',
      'en': '',
    },
    'hnijxorw': {
      'ru': 'Способ оплаты',
      'en': '',
    },
    '4a07brjg': {
      'ru': 'Адрес доставки',
      'en': '',
    },
    'opkijyru': {
      'ru': 'Стоимость доставки',
      'en': '',
    },
    '08oowiyg': {
      'ru': 'Итого по чеку',
      'en': '',
    },
    'fk9noelf': {
      'ru': 'Назад',
      'en': '',
    },
    '4y2whfvz': {
      'ru': 'Чек',
      'en': '',
    },
    'clqgt3tm': {
      'ru': 'Home',
      'en': '',
    },
  },
  // Ourrestaurants
  {
    'o0hhtwhl': {
      'ru': 'Список ресторанов',
      'en': '',
    },
    'fxizucox': {
      'ru': 'Наши рестораны',
      'en': '',
    },
    's2cj03g5': {
      'ru': 'Home',
      'en': '',
    },
  },
  // feedback
  {
    'fl7elsav': {
      'ru':
          'Вы можете отправить нам сообщение через эту форму, и мы свяжемся с вами как можно скорее.',
      'en': '',
    },
    'p2aepu5z': {
      'ru': 'Тема сообщения',
      'en': '',
    },
    'pjiwgs2r': {
      'ru': 'Введите тему',
      'en': '',
    },
    'qimobxj5': {
      'ru': 'Опишите Вашу проблему максимально детально',
      'en': '',
    },
    'hku2e29m': {
      'ru': 'Начните писать здесь..',
      'en': '',
    },
    '5n42j749': {
      'ru': 'Отправить',
      'en': '',
    },
    '1az5rzvh': {
      'ru': 'Обратная связь',
      'en': '',
    },
    'tj0sv23r': {
      'ru': 'Home',
      'en': '',
    },
  },
  // Bonuses
  {
    'mqynjn3f': {
      'ru': 'Здесь будет информация',
      'en': '',
    },
    's1qjjzya': {
      'ru': 'Бонусы',
      'en': '',
    },
    'otuxzmwh': {
      'ru': 'Home',
      'en': '',
    },
  },
  // Payment
  {
    '5h7ov7ud': {
      'ru': 'Правила обработки платежей',
      'en': '',
    },
    'erk6ahxl': {
      'ru': 'Платежи',
      'en': '',
    },
    'gnuw86wg': {
      'ru': 'Home',
      'en': '',
    },
  },
  // PrivatePolice
  {
    'c8b9vuiy': {
      'ru': 'Текст',
      'en': '',
    },
    'biq4brem': {
      'ru': 'Политика конфидициальности',
      'en': '',
    },
    'vl9x2a5e': {
      'ru': 'Home',
      'en': '',
    },
  },
  // TermOfUse
  {
    'ty4n9wuh': {
      'ru': 'Текст',
      'en': '',
    },
    'xqecpsg3': {
      'ru': 'Условия пользования',
      'en': '',
    },
    'cvbry9e9': {
      'ru': 'Home',
      'en': '',
    },
  },
  // forclients
  {
    '65ur1q05': {
      'ru': 'Текст',
      'en': '',
    },
    'sew7mp2j': {
      'ru': 'Ддля клиентов',
      'en': '',
    },
    '6dczzkng': {
      'ru': 'Home',
      'en': '',
    },
  },
  // Sellingrules
  {
    '2ae5i04d': {
      'ru': 'Текст',
      'en': '',
    },
    'nj1dghdk': {
      'ru': 'Правила продажи',
      'en': '',
    },
    '8mzw5hiq': {
      'ru': 'Home',
      'en': '',
    },
  },
  // requisites
  {
    'pczaguye': {
      'ru': 'Текст',
      'en': '',
    },
    'hekkdkdz': {
      'ru': 'Наши реквизиты',
      'en': '',
    },
    '0lc8wswu': {
      'ru': 'Home',
      'en': '',
    },
  },
  // ProduktMoreCopy
  {
    'jua4popc': {
      'ru': 'Option 1',
      'en': '',
    },
    'mb439n83': {
      'ru': 'Применить',
      'en': '',
    },
    'dmqcb90t': {
      'ru': 'Редактировать товар',
      'en': '',
    },
    'cq5u7m3i': {
      'ru': 'Home',
      'en': '',
    },
  },
  // Cart_is_empty
  {
    '0484jl70': {
      'ru': 'В  вашей корзине\n нет еще товаров',
      'en': '',
    },
    '2kjxk1tf': {
      'ru': 'Посмотрите меню и выберите товары, которые Вы хотите заказать ',
      'en': '',
    },
    'rrisdccp': {
      'ru': 'Посмотреть меню',
      'en': '',
    },
  },
  // cart_produkt_CheckOut
  {
    'dm25uc0h': {
      'ru': ' \$ ',
      'en': '',
    },
  },
  // haveNoOrder
  {
    'hp99azto': {
      'ru': 'У вас есще нет \nзаказов',
      'en': '',
    },
    '8us0je8w': {
      'ru': 'Вернитесь в меню, выберите товар и сделайте заказ',
      'en': '',
    },
    'am00peyk': {
      'ru': 'Посмотреть меню',
      'en': '',
    },
  },
  // Category_is_empty
  {
    'xmj2uhl6': {
      'ru': 'Категория  пуста',
      'en': '',
    },
    'mn8boquq': {
      'ru': 'Посмотреть меню',
      'en': '',
    },
  },
  // DeleteCategori
  {
    '328oelow': {
      'ru': 'Внимание!',
      'en': '',
    },
    'mu9cq3pf': {
      'ru': 'Это действие необратимо! Вы уверены!',
      'en': '',
    },
    '4tboz9t7': {
      'ru': 'Отмена',
      'en': '',
    },
    'wyie1wg4': {
      'ru': 'Да, удалить!',
      'en': '',
    },
  },
  // CreateUser
  {
    'ysc8gj1l': {
      'ru': 'Новый клиент',
      'en': '',
    },
    'w6uwm9mo': {
      'ru': 'Заполниье все поля, чтобы создать новую  категорию',
      'en': '',
    },
    'hbgohlzp': {
      'ru': 'Add Photo',
      'en': '',
    },
    '50wyhob3': {
      'ru': 'Upload an image here...',
      'en': '',
    },
    '92ffdxui': {
      'ru': 'Имя ',
      'en': '',
    },
    '79u0ulv3': {
      'ru': 'Email',
      'en': '',
    },
    'n1pvp7mv': {
      'ru': 'Номер телефона',
      'en': '',
    },
    'ugso1nkn': {
      'ru': 'Статус',
      'en': '',
    },
    'rlynnsru': {
      'ru': 'Активный ',
      'en': '',
    },
    '2wgbw1ql': {
      'ru': 'Заблокирован',
      'en': '',
    },
    'yxyv3lev': {
      'ru': 'Please select...',
      'en': '',
    },
    '50m3jgni': {
      'ru': 'Search for an item...',
      'en': '',
    },
    '1mtox9ni': {
      'ru': 'Отмена',
      'en': '',
    },
    '71egx5yn': {
      'ru': 'Создать ',
      'en': '',
    },
    'yzz8kvzi': {
      'ru': 'Field is required',
      'en': '',
    },
    'g9ssc59h': {
      'ru': 'Please enter a real name',
      'en': '',
    },
    'x1q9u0zt': {
      'ru': 'Please choose an option from the dropdown',
      'en': '',
    },
    'oi1idydz': {
      'ru': 'Please enter a short desription',
      'en': '',
    },
    'bbcgvnp0': {
      'ru': 'Please choose an option from the dropdown',
      'en': '',
    },
    '8hfm3h8w': {
      'ru': 'We have to have a URL for the project.',
      'en': '',
    },
    '84h70qob': {
      'ru': 'Please enter a valid URL...',
      'en': '',
    },
    '3jdkd7we': {
      'ru': 'Please choose an option from the dropdown',
      'en': '',
    },
    'ug4ajpfd': {
      'ru': 'Field is required',
      'en': '',
    },
    'g3q0sjsz': {
      'ru': 'Please choose an option from the dropdown',
      'en': '',
    },
  },
  // CreateCategory
  {
    'n58gkzew': {
      'ru': 'Новая  категория',
      'en': '',
    },
    'asbst330': {
      'ru': 'Заполниье все поля, чтобы создать новую  категорию',
      'en': '',
    },
    'vf5v4m22': {
      'ru': 'Add Photo',
      'en': '',
    },
    '44tdfx3l': {
      'ru': 'Upload an image here...',
      'en': '',
    },
    'sdpc94h4': {
      'ru': 'Название категории',
      'en': '',
    },
    '828t530r': {
      'ru': 'Порядок в меню(от 1 )',
      'en': '',
    },
    'oyke0co8': {
      'ru': 'Активная (показывать в приложении)',
      'en': '',
    },
    'i5nhw88c': {
      'ru': 'Создать категорию',
      'en': '',
    },
    'sb7hpo9x': {
      'ru': 'Field is required',
      'en': '',
    },
    'ct23ggzw': {
      'ru': 'Please enter a real name',
      'en': '',
    },
    'syb2u3py': {
      'ru': 'Please choose an option from the dropdown',
      'en': '',
    },
    'y75zrqx8': {
      'ru': 'Please enter a short desription',
      'en': '',
    },
    'xoyknej5': {
      'ru': 'Please choose an option from the dropdown',
      'en': '',
    },
    'nqpp00tr': {
      'ru': 'We have to have a URL for the project.',
      'en': '',
    },
    'z0tn5mme': {
      'ru': 'Please enter a valid URL...',
      'en': '',
    },
    '6gfnfnxv': {
      'ru': 'Please choose an option from the dropdown',
      'en': '',
    },
    'dtf33xmd': {
      'ru': 'Field is required',
      'en': '',
    },
    'wkhftn1w': {
      'ru': 'Please choose an option from the dropdown',
      'en': '',
    },
  },
  // Deleteuser
  {
    'r5wnekcw': {
      'ru': 'Внимание!',
      'en': '',
    },
    'uklq2iax': {
      'ru': 'Это действие необратимо! Вы уверены!',
      'en': '',
    },
    '6fih18ck': {
      'ru': 'Отмена',
      'en': '',
    },
    'eq0e57hq': {
      'ru': 'Да, удалить!',
      'en': '',
    },
  },
  // UpdateOrder
  {
    'oy8azf7i': {
      'ru': 'Обновить заказ',
      'en': '',
    },
    'dg9250ly': {
      'ru': 'Дата заказа:',
      'en': '',
    },
    '6uctn1uz': {
      'ru': 'Номер заказа:',
      'en': '',
    },
    'e6wquunb': {
      'ru': 'Имя клиента:',
      'en': '',
    },
    'vt0yhg4q': {
      'ru': 'Номер клиента:',
      'en': '',
    },
    'k2ffre71': {
      'ru': 'Адрес доставки:',
      'en': '',
    },
    'lcd5c1p2': {
      'ru': 'Статус заказ:',
      'en': '',
    },
    'ttbahm3c': {
      'ru': 'Новый ',
      'en': '',
    },
    'vrvh8wqq': {
      'ru': 'Принят в работу',
      'en': '',
    },
    'oiu2u5yh': {
      'ru': 'Доставляется',
      'en': '',
    },
    'iq0h3hfc': {
      'ru': 'Завершен',
      'en': '',
    },
    'v20n699f': {
      'ru': 'Отменен',
      'en': '',
    },
    'ck8087iv': {
      'ru': 'Please select...',
      'en': '',
    },
    '5bg6haqb': {
      'ru': 'Search for an item...',
      'en': '',
    },
    'cdwgm83f': {
      'ru': 'Способ оплаты:',
      'en': '',
    },
    'ma5erjxw': {
      'ru': 'Отмена',
      'en': '',
    },
    'sje4f4q6': {
      'ru': 'Обновить',
      'en': '',
    },
    'wor4xs4l': {
      'ru': 'Field is required',
      'en': '',
    },
    'j8h8d5zv': {
      'ru': 'Please enter a real name',
      'en': '',
    },
    'h2on3s10': {
      'ru': 'Please choose an option from the dropdown',
      'en': '',
    },
    's3c01tus': {
      'ru': 'Please enter a short desription',
      'en': '',
    },
    '2fs4gqpq': {
      'ru': 'Please choose an option from the dropdown',
      'en': '',
    },
    'y00bltlm': {
      'ru': 'We have to have a URL for the project.',
      'en': '',
    },
    'ux8ssv62': {
      'ru': 'Please enter a valid URL...',
      'en': '',
    },
    'q32d5pgi': {
      'ru': 'Please choose an option from the dropdown',
      'en': '',
    },
    'ajgiw5np': {
      'ru': 'Field is required',
      'en': '',
    },
    'mizpteq4': {
      'ru': 'Please choose an option from the dropdown',
      'en': '',
    },
  },
  // CreateProduct
  {
    'kf5co9x1': {
      'ru': 'Новое блюдо',
      'en': '',
    },
    'tyq2ftdw': {
      'ru': 'Заполниье все поля, чтобы создать новое блюдо',
      'en': '',
    },
    'q0fr8u8u': {
      'ru': 'Название блюда',
      'en': '',
    },
    'urishs70': {
      'ru': 'Описание блюда',
      'en': '',
    },
    '1jdc7dm0': {
      'ru': 'Add Photo',
      'en': '',
    },
    'fqeh1glg': {
      'ru': 'Upload an image here...',
      'en': '',
    },
    '1c6v7rl2': {
      'ru': 'Цена ',
      'en': '',
    },
    '9hprrd18': {
      'ru': 'На скидке',
      'en': '',
    },
    '64yq60ty': {
      'ru': 'Цена со скидкой ',
      'en': '',
    },
    'tauv98u1': {
      'ru': 'Сеты',
      'en': '',
    },
    'ao91tvwk': {
      'ru': 'Супы',
      'en': '',
    },
    'cndvpsq0': {
      'ru': 'Добавки',
      'en': '',
    },
    'fl0uoojb': {
      'ru': 'Паста',
      'en': '',
    },
    '4l1haa2q': {
      'ru': 'Десерты',
      'en': '',
    },
    'xwts9mwn': {
      'ru': 'Пицца',
      'en': '',
    },
    'w8iy83e4': {
      'ru': 'Вокки / Жаренный рис',
      'en': '',
    },
    'v60zaxtu': {
      'ru': 'Снэки',
      'en': '',
    },
    'rdygywah': {
      'ru': 'Суши и ролы',
      'en': '',
    },
    'gq4ljlcy': {
      'ru': 'Бизнес ланч',
      'en': '',
    },
    'ky08b76y': {
      'ru': 'Напитки',
      'en': '',
    },
    '314kncf3': {
      'ru': 'Салаты',
      'en': '',
    },
    '4qcfzy2b': {
      'ru': 'Выберите категорию',
      'en': '',
    },
    'j5osyxzq': {
      'ru': 'Search for an item...',
      'en': '',
    },
    'nwtuwfdy': {
      'ru': 'Категория',
      'en': '',
    },
    'x5minkad': {
      'ru': 'Создать категорию',
      'en': '',
    },
    'gxbw2yvc': {
      'ru': 'Field is required',
      'en': '',
    },
    'n5x1e8nq': {
      'ru': 'Please enter a real name',
      'en': '',
    },
    '98t629ee': {
      'ru': 'Please choose an option from the dropdown',
      'en': '',
    },
    '49bl23m7': {
      'ru': 'Please enter a short desription',
      'en': '',
    },
    'd0tjp26p': {
      'ru': 'Please choose an option from the dropdown',
      'en': '',
    },
    'owvptis2': {
      'ru': 'We have to have a URL for the project.',
      'en': '',
    },
    's5daq8ms': {
      'ru': 'Please enter a valid URL...',
      'en': '',
    },
    'n48cef80': {
      'ru': 'Please choose an option from the dropdown',
      'en': '',
    },
    'wxxv5205': {
      'ru': 'Field is required',
      'en': '',
    },
    'e2bmyvhg': {
      'ru': 'Please choose an option from the dropdown',
      'en': '',
    },
  },
  // Miscellaneous
  {
    '0n8cz6v0': {
      'ru': '',
      'en': '',
    },
    'rh6a1b9j': {
      'ru': '',
      'en': '',
    },
    'nrllhr1p': {
      'ru': '',
      'en': '',
    },
    'znug6x12': {
      'ru': '',
      'en': '',
    },
    'a79kyi2g': {
      'ru': '',
      'en': '',
    },
    'lcnby3rm': {
      'ru': '',
      'en': '',
    },
    '8ro70o36': {
      'ru': '',
      'en': '',
    },
    'mzhz8ylu': {
      'ru': '',
      'en': '',
    },
    '3lxvm3hk': {
      'ru': '',
      'en': '',
    },
    'x3z0ia8d': {
      'ru': '',
      'en': '',
    },
    'i3kecgp0': {
      'ru': '',
      'en': '',
    },
    'bb6pzin3': {
      'ru': '',
      'en': '',
    },
    'ghng4lef': {
      'ru': '',
      'en': '',
    },
    'k8ewee0y': {
      'ru': '',
      'en': '',
    },
    'yiluzwe6': {
      'ru': '',
      'en': '',
    },
    'at2uxjqt': {
      'ru': '',
      'en': '',
    },
    '6dfg4c5k': {
      'ru': '',
      'en': '',
    },
    'imcoo6g8': {
      'ru': '',
      'en': '',
    },
    'zg3rmlof': {
      'ru': '',
      'en': '',
    },
    'ukjx2ik7': {
      'ru': '',
      'en': '',
    },
    'dhfpxfhb': {
      'ru': '',
      'en': '',
    },
    'rocdcygn': {
      'ru': '',
      'en': '',
    },
    '2c7yabze': {
      'ru': '',
      'en': '',
    },
  },
].reduce((a, b) => a..addAll(b));
