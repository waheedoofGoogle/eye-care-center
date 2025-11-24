import 'package:eye_care_center/drawer.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const EyeCareCenterApp());
}

class EyeCareCenterApp extends StatelessWidget {
  const EyeCareCenterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: const Locale('en'),
      supportedLocales: const [Locale('en'), Locale('ar')],
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isArabic = true;

  // Contact tools
  final String phone = "+963992369841";
  final String whatsapp = "+963992369841";
  final String website = "https://example.com";
  final String mapUrl =
      "https://www.google.com/maps?q=36%C2%B013%2715.6,37%C2%B008%2701.3";
  final String email = "www.waheed.hanblaas@gmail.com";

  // Launch helpers
  Future<void> openUrl(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
    }
  }

  Future<void> callNumber() async {
    openUrl("tel:$phone");
  }

  Future<void> openWhatsapp() async {
    openUrl("https://wa.me/$whatsapp");
  }

  Future<void> openWebsite() async {
    openUrl(website);
  }

  Future<void> openLocation() async {
    openUrl(mapUrl);
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    // Text content
    final title = isArabic
        ? 'مركز العناية بالعيون وعمليات الليزك'
        : 'EYE CARE CENTER';
    final subtitle = isArabic
        ? 'نقود الضوء إلى بصرك'
        : 'Leading Light to your Sight';

    final desc = isArabic
        ? 'مرحبًا بكم في مركز العناية بالعيون — وجهتكم الموثوقة للتشخيص المتقدم وعمليات الليزك الدقيقة. نقدم خدمات متكاملة بأحدث الأجهزة الطبية.'
        : 'Welcome to Eye Care Center — your trusted destination for advanced diagnostics and precise eye surgeries, using the latest medical technologies.';

    final details = isArabic
        ? 'نحن نقدم خدمات متخصصة في علاج أمراض الشبكية، الحول، عيون الأطفال، بالإضافة إلى عمليات التجميل الدقيقة لجفون العين.'
        : 'We provide advanced services in retina diseases, strabismus, pediatric eye care, and cosmetic eyelid surgeries.';

    final features = isArabic
        ? [
            '• أحدث أجهزة تصوير الشبكية OCT',
            '• فحص شامل بدقة عالية',
            '• فريق طبي متخصص',
            '• عيادة خاصة لعمليات التجميل حول العين',
          ]
        : [
            '• Latest Retina Imaging (OCT)',
            '• High-precision full eye examination',
            '• Highly specialized medical team',
            '• Dedicated cosmetic eyelid surgery clinic',
          ];

    final clinic1 = isArabic ? '• عيادة الشبكية' : '• Retina Clinic';
    final clinic2 = isArabic
        ? '• عيادة الحول والأطفال'
        : '• Strabismus & Pediatric Clinic';
    final clinic3 = isArabic
        ? '• عيادة التجميل وجراحة الأجفان'
        : '• Cosmetic & Eyelid Surgery Clinic';

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'EYE CARE CENTER',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        foregroundColor: Colors.blueAccent,
      ),
      drawer: AppDrawer(
        isArabic: isArabic,
        onToggleLang: () => setState(() => isArabic = !isArabic),
        phone: phone,
        whatsapp: whatsapp,
        // wa.me requires country code without +
        website: website,
        mapUrl: mapUrl,
        email: email,
      ),
      backgroundColor: Colors.white,
      body: Directionality(
        textDirection: isArabic ? TextDirection.rtl : TextDirection.ltr,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // ===== HERO / HEADER =====
              Container(
                color: const Color(0xFF4B5DFF), // Blue header
                padding: const EdgeInsets.symmetric(
                  vertical: 50,
                  horizontal: 20,
                ),
                child: Column(
                  children: [
                    Image.asset(
                      'assets/images/app_logo.jpg',
                      width: width * 0.4,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      subtitle,
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.white70,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),

              // ===== ABOUT =====
              sectionCard(
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      isArabic ? "عن المركز" : "About Us",
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF4B5DFF),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      desc,
                      style: const TextStyle(fontSize: 16, height: 1.5),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      details,
                      style: const TextStyle(fontSize: 15, height: 1.5),
                    ),
                  ],
                ),
              ),

              // ===== CLINICS =====
              sectionCard(
                color: Colors.grey.shade50,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      isArabic ? "العيادات" : "Our Clinics",
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF4B5DFF),
                      ),
                    ),
                    const SizedBox(height: 12),
                    clinicCard(clinic1),
                    clinicCard(clinic2),
                    clinicCard(clinic3),
                  ],
                ),
              ),

              // ===== FEATURES =====
              sectionCard(
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      isArabic ? "مميزات المركز" : "Center Features",
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF4B5DFF),
                      ),
                    ),
                    const SizedBox(height: 12),
                    ...features.map(
                      (f) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.check_circle,
                              color: Color(0xFF4B5DFF),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                f,
                                style: const TextStyle(fontSize: 15),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // ===== CONTACT =====
              Container(
                color: Colors.grey.shade100,
                padding: const EdgeInsets.symmetric(
                  vertical: 40,
                  horizontal: 20,
                ),
                child: Column(
                  children: [
                    Text(
                      isArabic ? "طرق التواصل" : "Contact Us",
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF4B5DFF),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Wrap(
                      spacing: 15,
                      runSpacing: 15,
                      alignment: WrapAlignment.center,
                      children: [
                        contactButton(
                          text: isArabic ? "اتصال" : "Call",
                          icon: Icons.phone,
                          onTap: callNumber,
                        ),
                        contactButton(
                          text: isArabic ? "واتساب" : "WhatsApp",
                          icon: Icons.chat,
                          onTap: openWhatsapp,
                        ),
                        contactButton(
                          text: isArabic ? "الموقع الإلكتروني" : "Website",
                          icon: Icons.language,
                          onTap: openWebsite,
                        ),
                        contactButton(
                          text: isArabic ? "الموقع على الخريطة" : "Location",
                          icon: Icons.location_on,
                          onTap: openLocation,
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // ===== LANGUAGE TOGGLE =====
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Center(
                  child: ElevatedButton(
                    onPressed: () => setState(() => isArabic = !isArabic),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF4B5DFF),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 12,
                      ),
                    ),
                    child: Text(
                      isArabic ? 'English' : 'العربية',
                      style: const TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget containerBox({required Widget child}) {
    return Container(
      width: 500,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 15,
            spreadRadius: 2,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: child,
    );
  }

  Widget contactButton({
    required String text,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return ElevatedButton.icon(
      onPressed: onTap,
      icon: Icon(icon, color: Colors.white),
      label: Text(text, style: const TextStyle(color: Colors.white)),
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF4B5DFF),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      ),
    );
  }
}

Widget sectionCard({required Widget child, Color color = Colors.white}) {
  return Container(
    width: double.infinity,
    color: color,
    padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
    child: Card(
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(padding: const EdgeInsets.all(20), child: child),
    ),
  );
}

Widget clinicCard(String text) {
  return Card(
    color: Colors.blue.shade50,
    elevation: 3,
    margin: const EdgeInsets.symmetric(vertical: 6),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    child: Padding(
      padding: const EdgeInsets.all(12),
      child: Text(text, style: const TextStyle(fontSize: 16)),
    ),
  );
}
