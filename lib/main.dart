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
  bool isArabic = false;

  // Contact tools
  final String phone = "+966500000000";
  final String whatsapp = "+966500000000";
  final String website = "https://example.com";
  final String mapUrl = "https://maps.app.goo.gl/Sid1uPqHnU4Feq2F7";

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
    final title = isArabic ? 'مركز العناية بالعيون' : 'EYE CARE CENTER';
    final subtitle = isArabic
        ? 'نقود الضوء إلى بصرك'
        : 'Leading Light to your Sight';

    final desc = isArabic
        ? 'مرحبًا بكم في مركز العناية بالعيون — وجهتكم الموثوقة للتشخيص المتقدم وجراحات العيون الدقيقة. نقدم خدمات متكاملة بأحدث الأجهزة الطبية.'
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
      drawer: AppDrawer(
        isArabic: isArabic,
        onToggleLang: () => setState(() => isArabic = !isArabic),
        phone: "+966500000000",
        whatsapp: "966500000000", // wa.me requires country code without +
        website: "https://your-site.com",
        mapUrl: "https://maps.google.com/?q=Your+Clinic+Address",
        email: "info@your-site.com",
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Directionality(
          textDirection: isArabic ? TextDirection.rtl : TextDirection.ltr,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/app_logo.jpg', width: width),
                const SizedBox(height: 30),

                // Title
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF4B5DFF),
                  ),
                ),

                const SizedBox(height: 10),

                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 18,
                    color: Color(0xFF7A8BFF),
                  ),
                ),

                const SizedBox(height: 40),

                // Description box
                containerBox(
                  child: Column(
                    children: [
                      Text(
                        desc,
                        style: const TextStyle(fontSize: 16, height: 1.5),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        details,
                        style: const TextStyle(fontSize: 15, height: 1.5),
                      ),
                      const SizedBox(height: 20),
                      Text(clinic1),
                      Text(clinic2),
                      Text(clinic3),
                      const SizedBox(height: 20),

                      // Features list
                      Text(
                        isArabic ? "مميزات المركز:" : "Center Features:",
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),

                      ...features
                          .map(
                            (f) =>
                                Text(f, style: const TextStyle(fontSize: 15)),
                          )
                          .toList(),
                    ],
                  ),
                ),

                const SizedBox(height: 30),

                // CONTACT BUTTONS
                Text(
                  isArabic ? "طرق التواصل" : "Contact Us",
                  style: const TextStyle(
                    fontSize: 22,
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

                const SizedBox(height: 40),

                ElevatedButton(
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

                const SizedBox(height: 30),
              ],
            ),
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
