import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; // لإطلاق المكالمات الهاتفية
import 'package:flutter_localizations/flutter_localizations.dart'; // للغة العربية

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'الشريف للتوريدات', // الاسم الجديد للتطبيق
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'Inter', // خط أساسي جذاب
        textTheme: const TextTheme(
          displayLarge: TextStyle(fontFamily: 'Cairo', fontWeight: FontWeight.w900),
          displayMedium: TextStyle(fontFamily: 'Cairo', fontWeight: FontWeight.w700),
          headlineLarge: TextStyle(fontFamily: 'Cairo', fontWeight: FontWeight.w700),
          headlineMedium: TextStyle(fontFamily: 'Cairo', fontWeight: FontWeight.w700),
          bodyLarge: TextStyle(fontFamily: 'Inter', fontWeight: FontWeight.w400),
          bodyMedium: TextStyle(fontFamily: 'Inter', fontWeight: FontWeight.w400),
        ),
      ),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('ar', ''),
        Locale('en', ''),
      ],
      locale: const Locale('ar', ''), // تحديد اللغة العربية كلغة افتراضية
      home: const ImageGalleryPage(),
    );
  }
}

class ImageGalleryPage extends StatefulWidget {
  const ImageGalleryPage({super.key});

  @override
  State<ImageGalleryPage> createState() => _ImageGalleryPageState();
}

class _ImageGalleryPageState extends State<ImageGalleryPage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _fadeAnimation;

  final List<Map<String, String>> images = [
    // أولاً: الطوب الأسمنتي (مصمت ومفرغ)
    {
      'path': 'assets/images/WhatsApp Image 2025-07-17 at 18.07.46_983df184.jpg',
      'alt': 'طوب أسمنتي مصمت مكدس',
      'title': 'الطوب الأسمنتي المصمت: أساس كل بناء',
      'description': 'يُعد الطوب الأسمنتي المصمت خيارك الأمثل للمتانة الفائقة والمقاومة العالية. بفضل تصميمه القوي، يوفر هذا النوع من الطوب أساسًا صلبًا ومستقرًا لأي هيكل، مما يضمن طول العمر الافتراضي للمبنى وقدرته على تحمل أقصى الظروف.\n\nالمقاسات المتوفرة:\n• طوب مصمت 20: 6x10x20 سم\n• طوب مصمت 25: 6x12x25 سم',
    },
    {
      'path': 'assets/images/950751_orig (1).jpg',
      'alt': 'بلوك أسمنتي مفرد',
      'title': 'بلوك أسمنتي صلب: قوة لا تضاهى',
      'description': 'يمثل البلوك الخرساني قمة الابتكار في عالم البناء الحديث، بقوته وصلابته الفائقة التي لا تضاهى. إنه الخيار الأمثل للمشاريع الطموحة التي تتطلب كفاءة لا مثيل لها وسرعة فائقة في الإنجاز، مع ضمان المتانة التي تدوم لعقود.',
    },
    {
      'path': 'assets/images/IMG_4406-scaled.jpg',
      'alt': 'بلوك خرساني طويل ومرتفع',
      'title': 'شاهد على المتانة: تصميم يعانق السماء',
      'description': 'بشموخه وعموديته، يظهر هذا البلوك الخرساني ليؤكد على متانته الفائقة وقدرته الأسطورية على تحمل أقصى الظروف والتحديات. إنه ليس مجرد حجر، بل هو حجر الزاوية في بناء أساسات قوية تدوم طويلاً، وتلامس عنان السماء بثقة.',
    },
    {
      'path': 'assets/images/WhatsApp Image 2025-07-17 at 18.07.45_ad16c109.jpg',
      'alt': 'بلوك أسمنتي مفرغ',
      'title': 'البلوك الأسمنتي المفرغ: خفة وكفاءة',
      'description': 'يتميز البلوك الأسمنتي المفرغ بوزنه الخفيف وقدرته العالية على العزل الحراري والصوتي. إنه الحل المثالي للبناء السريع والاقتصادي دون التنازل عن الجودة والمتانة.\n\nالمقاسات المتوفرة:\n• بلوك مفرغ 25 سم: 25x20x40 سم\n• بلوك مفرغ 12 سم: 12x20x40 سم',
    },
    {
      'path': 'assets/images/WhatsApp Image 2025-07-17 at 18.07.45_881fcb54.jpg',
      'alt': 'كميات كبيرة من البلوك الأسمنتي المفرغ',
      'title': 'وفرة وجودة: بلوك مفرغ لمشاريعك',
      'description': 'تظهر هذه الأكوام الكبيرة من البلوك الأسمنتي المفرغ استعدادنا التام لتوريد الكميات التي تحتاجها لمشاريعك الكبيرة. جودة تصنيع عالية تضمن لك بناءً فعالاً وقوياً.',
    },
    {
      'path': 'assets/images/WhatsApp Image 2025-07-17 at 18.07.46_5d94b31f.jpg',
      'alt': 'مخزون من الطوب الأسمنتي المعبأ',
      'title': 'جودة معبأة: بلوك أسمنتي جاهز',
      'description': 'نقدم لك الطوب الأسمنتي بجودة عالية، معبأ بعناية لضمان وصوله إليك في أفضل حال. جاهز للاستخدام الفوري في مشاريعك المختلفة، مما يوفر لك الوقت والجهد.',
    },
    {
      'path': 'assets/images/WhatsApp Image 2025-07-17 at 18.07.46_9ba2df26.jpg',
      'alt': 'مخزون منظم من الطوب الأسمنتي',
      'title': 'تنظيم وكفاءة: مخزون أسمنتي متوفر',
      'description': 'مخزوننا من الطوب الأسمنتي منظم بدقة لضمان سرعة التوريد وتلبية احتياجاتك بكفاءة عالية. الجودة والتوفر هما أساس عملنا.',
    },
    {
      'path': 'assets/images/Fly_Ash_Bricks-e1663762167513.jpg',
      'alt': 'أكوام من الطوب الرمادي الحديث',
      'title': 'الطوب الرمادي: أناقة عصرية وبساطة ساحرة',
      'description': 'بألوانه الهادئة وتصميمه العملي الذي يلامس الكمال، يقدم الطوب الرمادي لمسة عصرية فريدة للمباني. إنه يجمع ببراعة بين الجمال البسيط والقوة الهيكلية، ليناسب كل الأذواق الرفيعة ويضفي لمسة من الأناقة الخالدة على كل مشروع.',
    },
    // ثانياً: البردورات
    {
      'path': 'assets/images/WhatsApp Image 2025-07-17 at 18.07.46_16e78394.jpg',
      'alt': 'أنواع مختلفة من البردورات',
      'title': 'البردورات: لمسة جمالية وعملية لمشاريعك',
      'description': 'تُعد البردورات هي اللمسة النهائية التي تضفي الجمال والتنظيم على الطرقات والحدائق والمساحات العامة. بتصاميمها المتنوعة وقوتها التحملية، تضمن لك تحديدًا أنيقًا وعمليًا للمساحات الخارجية.\n\nالأنواع والمقاسات المتوفرة:\n• بردورة وسط 1/2 متر: 15/12x30x50 سم\n• بردورة وسط 1 متر: 15/12x30x100 سم\n• بردورة طرق (عجالي): 30/25x30x50 سم\n• بردورة جنائن 10 سم: 10x30x50 سم\n• بردورة جنائن 8 سم: 8x24x50 سم\n• بردورة وسط عرنوس 1/2 متر: 15/12x30x50 سم',
    },
    {
      'path': 'assets/images/WhatsApp Image 2025-07-17 at 18.07.45_0dabc515.jpg',
      'alt': 'بردورات ذات تصميم خاص',
      'title': 'بردورات بتصاميم مميزة: لمسات فنية',
      'description': 'بردورات ذات تصميم خاص تضفي طابعاً فريداً على أي مساحة خارجية. مثالية لتحديد الممرات والحدائق بأسلوب يجمع بين الفعالية والجاذبية البصرية الفريدة.',
    },
    // ثالثاً: الطوب الطفلي (الأحمر)
    {
      'path': 'assets/images/20211104095950315.jpg', // هذه الصورة لم يتم توفيرها، لكن المسار موجود سابقًا
      'alt': 'طوب أحمر تقليدي بفتحات',
      'title': 'الطوب الطفلي (الأحمر): روح الأصالة المصرية',
      'description': 'من قلب الأرض الطينية المصرية، يتشكل الطوب الطفلي ليحمل بين طياته قصصاً من الدفء والمتانة. إنه ليس مجرد مادة بناء، بل هو رمز للأصالة والتراث، يروي حكايات الأجداد وفنهم العريق في تشييد الصروح التي تصمد أمام الزمن. كل قطعة منه هي بصمة فنية تضيء دروب المستقبل.\n\nالمقاسات المتوفرة:\n• طوب طفلي مقاس 24\n• طوب طفلي مقاس 25',
    },
    {
      'path': 'assets/images/images (2).jpeg', // هذه الصورة لم يتم توفيرها، لكن المسار موجود سابقًا
      'alt': 'كميات كبيرة من الطوب الأحمر بفتحات',
      'title': 'كميات جاهزة: لمشاريعك الكبرى من الطوب الطفلي',
      'description': 'تراصت هذه الأكوام الشاهقة من الطوب الطفلي بفتحاتها المميزة، لتكون جاهزة لتلبية احتياجات مشاريعك الضخمة. إنها تجسيد للوفرة والجودة، تضمن لك انطلاقة قوية وثابتة في كل خطوة بناء.',
    },
    {
      'path': 'assets/images/الطوب-الاحمر-1024x1024.webp', // هذه الصورة لم يتم توفيرها، لكن المسار موجود سابقًا
      'alt': 'جدار من الطوب الأحمر المتراص',
      'title': 'جدران تحكي تاريخًا وشغفًا من الطوب الطفلي',
      'description': 'تراصت هذه الطوبات بعناية فائقة وشغف لا يضاهى لتشكل جداراً شامخاً، يجسد القوة والثبات. إنه ليس مجرد حاجز، بل هو لوحة فنية تحكي عن إتقان الصنعة وجمال التفاصيل، وكل زاوية فيه تروي حكاية من الإبداع المعماري الذي يلامس الروح.',
    },
    {
      'path': 'assets/images/ptFaN1736421266.webp', // هذه الصورة لم يتم توفيرها، لكن المسار موجود سابقًا
      'alt': 'أكوام من الطوب الأحمر جاهزة للبناء',
      'title': 'كنوز تنتظر أن تتحول إلى أحلام: الطوب الطفلي',
      'description': 'هنا، تتراكم أكوام الطوب الطفلي، كل قطعة تحمل في طياتها وعداً بمستقبل مشرق. إنها ليست مجرد مواد خام، بل هي بذور لأحلام تنتظر الأيدي الماهرة لتحويلها إلى منازل دافئة، صروح شامخة، ومدن نابضة بالحياة.',
    },
    {
      'path': 'assets/images/images.jpeg', // هذه الصورة لم يتم توفيرها، لكن المسار موجود سابقًا
      'alt': 'مخزون ضخم من الطوب الأحمر',
      'title': 'مخزون لا ينضب: جودة مضمونة من الطوب الطفلي',
      'description': 'شاهد على وفرة وجودة منتجاتنا، هذا المخزون الهائل من الطوب الطفلي يعكس استعدادنا التام لتلبية كافة متطلبات البناء. كل طوبة هنا هي وعد بالمتانة والاعتمادية لمشروعك القادم.',
    },
    // رابعاً: بلاط الموزايكو
    {
      'path': 'assets/images/WhatsApp Image 2025-07-17 at 18.07.45_8a326111.jpg',
      'alt': 'بلاط مزايكو بألوان ونقوش مختلفة',
      'title': 'بلاط الموزايكو: فن يزين أرضياتك',
      'description': 'بلاط الموزايكو يضفي لمسة من الفخامة والأناقة على أي مساحة. بتشكيلاته اللونية المتنوعة ونقوشه الجذابة، يعد الخيار الأمثل لمن يبحث عن الجمال والمتانة في آن واحد لأرضياته.\n\nالمقاسات المتوفرة:\n• 25x25 سم\n• 30x30 سم',
    },
    {
      'path': 'assets/images/WhatsApp Image 2025-07-17 at 18.07.45_a2549ae5.jpg',
      'alt': 'بلاط مزايكو بألوان ونقوش مختلفة',
      'title': 'تشكيلات بلاط الموزايكو: تنوع يلبي ذوقك',
      'description': 'مجموعة واسعة من تصاميم وألوان بلاط الموزايكو لتناسب جميع الأذواق والديكورات. اختر ما يعبر عن أسلوبك وأضف لمسة فنية فريدة لأرضياتك.',
    },
  ];

  // دالة لإطلاق المكالمة الهاتفية
  Future<void> _launchPhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    if (await canLaunchUrl(launchUri)) {
      await launchUrl(launchUri);
    } else {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('لا يمكن إجراء المكالمة في الوقت الحالي.')),
        );
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200), // مدة حركة العنوان أطول قليلاً
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, -0.8), // يبدأ من الأعلى أكثر
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutExpo, // منحنى حركة أكثر ديناميكية
    ));

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeIn,
      ),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    int crossAxisCount;
    if (screenWidth > 1200) {
      crossAxisCount = 3;
    } else if (screenWidth > 768) {
      crossAxisCount = 2;
    } else {
      crossAxisCount = 1;
    }

    return Scaffold(
      backgroundColor: const Color(0xFFF0F4F8), // لون خلفية فاتح ومهدئ
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 64.0, bottom: 48.0, left: 24.0, right: 24.0),
              child: SlideTransition(
                position: _slideAnimation,
                child: FadeTransition(
                  opacity: _fadeAnimation,
                  child: Column(
                    children: [
                      // Using FittedBox for the main title to prevent overflow on resize
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          'الشريف للتوريدات', // الاسم الجديد للشركة
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.displayLarge?.copyWith(
                                fontSize: screenWidth > 768 ? 80 : 55, // حجم خط أكبر وأكثر بروزاً واستجابة
                                color: const Color(0xFF2C3E50), // لون أزرق داكن (أكثر احترافية)
                                shadows: const [
                                  Shadow(
                                    blurRadius: 15.0,
                                    color: Colors.black26, // ظل أقوى
                                    offset: Offset(0, 8),
                                  ),
                                ],
                              ),
                          textDirection: TextDirection.rtl,
                        ),
                      ),
                      const SizedBox(height: 16),
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          'حكايات من الطوب والحجر',
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                                fontSize: screenWidth > 768 ? 45 : 30, // حجم خط مستجيب
                                color: const Color(0xFF555555), // لون رمادي أغمق قليلاً
                              ),
                          textDirection: TextDirection.rtl,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                childAspectRatio: 0.8, // نسبة العرض إلى الارتفاع للبطاقات
                crossAxisSpacing: 24.0,
                mainAxisSpacing: 24.0,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 24.0),
              itemCount: images.length,
              itemBuilder: (context, index) {
                return ImageCard(
                  image: images[index],
                  animationDelay: Duration(milliseconds: 150 * (index + 1)), // تأخير أقل للحركة لظهور متتالي
                );
              },
            ),
            // قسم التواصل
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 48.0, horizontal: 24.0),
              child: Column(
                children: [
                  Text(
                    'للتواصل والاستفسارات:',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          fontSize: screenWidth > 768 ? 32 : 24,
                          color: const Color(0xFF2C3E50),
                          fontWeight: FontWeight.bold,
                        ),
                    textDirection: TextDirection.rtl,
                  ),
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: () => _launchPhoneCall('01005365486'), // لجعل الرقم قابل للضغط
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                      decoration: BoxDecoration(
                        color: const Color(0xFF4F46E5), // لون بنفسجي جذاب
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 10,
                            offset: Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(Icons.phone, color: Colors.white, size: 28),
                          const SizedBox(width: 15),
                          Text(
                            '01005365486',
                            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                                  fontSize: screenWidth > 768 ? 30 : 22, // حجم خط مستجيب لرقم الهاتف
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                            textDirection: TextDirection.ltr, // رقم الهاتف يفضل أن يكون LTR
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 48.0), // مسافة في الأسفل
          ],
        ),
      ),
    );
  }
}

class ImageCard extends StatefulWidget {
  final Map<String, String> image;
  final Duration animationDelay;

  const ImageCard({
    super.key,
    required this.image,
    required this.animationDelay,
  });

  @override
  State<ImageCard> createState() => _ImageCardState();
}

class _ImageCardState extends State<ImageCard> with SingleTickerProviderStateMixin {
  late AnimationController _cardController;
  late Animation<double> _cardFadeAnimation;
  late Animation<Offset> _cardSlideAnimation;

  double _cardScale = 1.0;
  double _imageScale = 1.0;
  double _shadowElevation = 8.0;
  Color _titleColor = Colors.grey.shade800; // لون العنوان الافتراضي
  Color _descriptionColor = Colors.grey.shade700; // لون الوصف الافتراضي
  double _letterSpacing = 0.0;
  double _blurRadius = 0.0; // لخاصية الظل المتوهج

  @override
  void initState() {
    super.initState();
    _cardController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800), // مدة ظهور البطاقة
    );

    _cardFadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _cardController,
        curve: const Interval(0.0, 1.0, curve: Curves.easeOut), // تأثير ظهور تدريجي
      ),
    );

    _cardSlideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.1), // تبدأ البطاقة من أسفل قليلاً
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _cardController,
        curve: const Interval(0.0, 1.0, curve: Curves.easeOutCubic), // تأثير انزلاق لطيف
      ),
    );

    Future.delayed(widget.animationDelay, () {
      if (mounted) {
        _cardController.forward(); // تشغيل حركة الظهور بعد التأخير
      }
    });
  }

  @override
  void dispose() {
    _cardController.dispose();
    super.dispose();
  }

  void _onHover(bool isHovering) {
    setState(() {
      if (isHovering) {
        _cardScale = 1.03; // تكبير البطاقة قليلاً
        _imageScale = 1.1; // تكبير الصورة داخل البطاقة
        _shadowElevation = 25.0; // زيادة الظل
        _titleColor = const Color(0xFF4F46E5); // تغيير لون العنوان عند التحويم
        _descriptionColor = Colors.black87; // تغيير لون الوصف
        _letterSpacing = 0.5; // زيادة تباعد الأحرف
        _blurRadius = 15.0; // تطبيق تأثير التوهج للظل
      } else {
        _cardScale = 1.0; // إعادة الحجم الأصلي للبطاقة
        _imageScale = 1.0; // إعادة الحجم الأصلي للصورة
        _shadowElevation = 8.0; // إعادة الظل الأصلي
        _titleColor = Colors.grey.shade800; // إعادة لون العنوان الأصلي
        _descriptionColor = Colors.grey.shade700; // إعادة لون الوصف الأصلي
        _letterSpacing = 0.0; // إعادة تباعد الأحرف الأصلي
        _blurRadius = 0.0; // إزالة تأثير التوهج للظل
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _cardFadeAnimation,
      child: SlideTransition(
        position: _cardSlideAnimation,
        child: MouseRegion(
          onEnter: (_) => _onHover(true),
          onExit: (_) => _onHover(false),
          child: AnimatedScale(
            scale: _cardScale,
            duration: const Duration(milliseconds: 400), // مدة حركة التكبير/التصغير للبطاقة
            curve: Curves.easeInOutCubic,
            child: Card(
              elevation: _shadowElevation,
              shadowColor: Colors.black.withOpacity(0.4), // لون الظل الأساسي
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24.0), // حواف دائرية للبطاقة
              ),
              clipBehavior: Clip.antiAlias, // لضمان قص الصورة بشكل صحيح داخل الحواف الدائرية
              child: Container(
                // لعمل تأثير الظل المتوهج
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24.0),
                  boxShadow: [
                    if (_blurRadius > 0)
                      BoxShadow(
                        color: _titleColor.withOpacity(0.3), // لون ظل مطابق للعنوان المتوهج
                        blurRadius: _blurRadius,
                        spreadRadius: 2.0,
                        offset: const Offset(0, 0),
                      ),
                  ],
                ),
                child: Column(
                  children: [
                    Expanded(
                      flex: 3, // مساحة أكبر للصورة
                      child: AnimatedScale(
                        scale: _imageScale, // تكبير الصورة داخل البطاقة عند التحويم
                        duration: const Duration(milliseconds: 400),
                        curve: Curves.easeInOutCubic,
                        child: Image.asset(
                          widget.image['path']!,
                          fit: BoxFit.cover, // تغطية المساحة بالصورة
                          width: double.infinity,
                          alignment: Alignment.center, // ضمان أن الصورة تتمركز
                          errorBuilder: (context, error, stackTrace) {
                            // رسالة خطأ جذابة في حالة عدم تحميل الصورة
                            return Container(
                              color: Colors.grey[300],
                              child: Center(
                                child: Icon(Icons.broken_image, size: 60, color: Colors.grey[600]),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2, // مساحة للنص
                      child: Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FittedBox( // Wrap title with FittedBox for responsiveness
                              fit: BoxFit.scaleDown,
                              child: AnimatedDefaultTextStyle(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeOut,
                                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                      color: _titleColor, // لون العنوان يتغير عند التحويم
                                    ),
                                child: Text(
                                  widget.image['title']!,
                                  textAlign: TextAlign.center,
                                  textDirection: TextDirection.rtl,
                                ),
                              ),
                            ),
                            const SizedBox(height: 12),
                            Expanded( // Use Expanded to give description flexible space
                              child: AnimatedDefaultTextStyle(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeOut,
                                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                                      fontSize: 16,
                                      color: _descriptionColor, // لون الوصف يتغير عند التحويم
                                      letterSpacing: _letterSpacing, // تباعد الأحرف يتغير عند التحويم
                                    ),
                                child: Text(
                                  widget.image['description']!,
                                  textAlign: TextAlign.center,
                                  textDirection: TextDirection.rtl,
                                  overflow: TextOverflow.fade, // استخدام TextOverflow.fade لمظهر أجمل
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}