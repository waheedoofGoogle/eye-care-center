import 'package:eye_care_center/drawer.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(const EyeCareCenterApp());

class EyeCareCenterApp extends StatelessWidget {
  const EyeCareCenterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const EyeCareLandingPage(),
    );
  }
}

// نسخة موقع حديث (Landing Page) مع قابلية العمل على Flutter Web
class EyeCareLandingPage extends StatelessWidget {
  const EyeCareLandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // ====== القسم الأول (الهيرو) ======
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 80),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xff1B4965), Color(0xff1E6091)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "EYE CARE CENTER",
                    style: TextStyle(
                      fontSize: 34,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "مركز العناية بالعيون والليزر بأعلى التقنيات الحديثة",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 22, color: Colors.white),
                  ),
                  const SizedBox(height: 30),

                  ElevatedButton(
                    onPressed: openWhatsapp,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.blue[900],
                      padding: const EdgeInsets.symmetric(
                        horizontal: 40,
                        vertical: 18,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                    child: const Text(
                      "احجز موعدك الآن",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // ====== خدمات المركز ======
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "خدماتنا",
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  Wrap(
                    alignment: WrapAlignment.center,
                    spacing: 30,
                    runSpacing: 30,
                    children: [
                      _serviceCard(Icons.remove_red_eye, "فحص شامل للعين"),
                      _serviceCard(
                        Icons.local_laundry_service,
                        "عمليات تصحيح البصر بالليزر",
                      ),
                      _serviceCard(
                        Icons.visibility_outlined,
                        "متابعة أمراض الشبكية",
                      ),
                      _serviceCard(
                        Icons.medical_services,
                        "فحوصات ما قبل العمليات",
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // ====== قسم لماذا نحن ======
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 60),
              color: const Color(0xffF7FBFF),
              child: Column(
                children: [
                  const Text(
                    "لماذا مركز EYE CARE؟",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 30),
                  Wrap(
                    alignment: WrapAlignment.center,
                    spacing: 40,
                    runSpacing: 40,
                    children: [
                      _reasonItem("أحدث الأجهزة الطبية العالمية"),
                      _reasonItem("خبرة طويلة في مجال الليزر"),
                      _reasonItem("نتائج دقيقة ومضمونة"),
                      _reasonItem("خدمة عملاء احترافية وسريعة"),
                    ],
                  ),
                ],
              ),
            ),

            // ====== قسم التواصل ======
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 60),
              child: Column(
                children: [
                  const Text(
                    "اتصل بنا",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "نحن جاهزون للإجابة على استفساراتكم وحجز المواعيد",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: openWhatsapp,
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 40,
                        vertical: 18,
                      ),
                      backgroundColor: Color(0xff1B4965),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                    child: const Text(
                      "تواصل معنا",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ====== بطاقة خدمة ======
  Widget _serviceCard(IconData icon, String title) {
    return Container(
      width: 250,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 12,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 40, color: Colors.blue[800]),
          const SizedBox(height: 15),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }

  // ====== عنصر "لماذا نحن" ======
  Widget _reasonItem(String text) {
    return Container(
      width: 260,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
      ),
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

  // ====== BUILD ======
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    final title = isArabic
        ? 'مركز العناية بالعيون وعمليات الليزك'
        : 'EYE CARE CENTER';
    final subtitle = isArabic
        ? 'نقود الضوء إلى بصرك'
        : 'Leading Light to your Sight';

    final aboutDesc = isArabic
        ? 'مرحبًا بكم في مركز العناية بالعيون — وجهتكم الموثوقة للتشخيص المتقدم وعمليات الليزك الدقيقة.'
        : 'Welcome to the Eye Care Center — your trusted destination for advanced diagnostics and LASIK surgeries.';

    final aboutDetails = isArabic
        ? 'نقدم خدمات في الشبكية، الحول، عيون الأطفال، والتجميل وجراحة الأجفان.'
        : 'We offer retina care, strabismus treatment, pediatric eye care, and cosmetic eyelid surgery.';

    final features = isArabic
        ? ['أحدث أجهزة التشخيص', 'فحص شامل ودقيق', 'فريق مختص', 'عيادة تجميل']
        : [
            'Advanced diagnostic devices',
            'Accurate full-eye exams',
            'Specialized team',
            'Cosmetic clinic',
          ];

    final clinics = isArabic
        ? [
            'عيادة الشبكية',
            'عيادة الحول والأطفال',
            'عيادة التجميل وجراحة الأجفان',
          ]
        : [
            'Retina Clinic',
            'Strabismus & Pediatric Clinic',
            'Cosmetic & Eyelid Surgery',
          ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'EYE CARE CENTER',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        foregroundColor: Colors.blueAccent,
      ),

      drawer: AppDrawer(
        isArabic: isArabic,
        onToggleLang: () => setState(() => isArabic = !isArabic),
        phone: phone,
        whatsapp: whatsapp,
        website: website,
        mapUrl: mapUrl,
        email: email,
      ),

      body: Directionality(
        textDirection: isArabic ? TextDirection.rtl : TextDirection.ltr,
        child: SingleChildScrollView(
          child: Column(
            children: [
              // ===== HEADER =====
              Container(
                color: const Color(0xFF4B5DFF),
                padding: const EdgeInsets.symmetric(
                  vertical: 45,
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
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      subtitle,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),
              ),

              // ===== ABOUT =====
              sectionCard(
                title: isArabic ? "عن المركز" : "About Us",
                children: [
                  Text(
                    aboutDesc,
                    style: const TextStyle(fontSize: 16, height: 1.5),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    aboutDetails,
                    style: const TextStyle(fontSize: 15, height: 1.5),
                  ),
                ],
              ),

              // ===== CLINICS =====
              sectionCard(
                title: isArabic ? "العيادات" : "Our Clinics",
                children: clinics.map((c) => clinicCard(c)).toList(),
              ),

              // ===== FEATURES =====
              sectionCard(
                title: isArabic ? "مميزات المركز" : "Center Features",
                children: features
                    .map(
                      (f) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.check_circle,
                              color: Color(0xFF4B5DFF),
                            ),
                            const SizedBox(width: 8),
                            Expanded(child: Text(f)),
                          ],
                        ),
                      ),
                    )
                    .toList(),
              ),
              ArticleSection(isArabic: isArabic),

              // ===== CONTACT =====
              contactSection(isArabic),

              // ===== LANG TOGGLE =====
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => setState(() => isArabic = !isArabic),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF4B5DFF),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 28,
                    vertical: 12,
                  ),
                ),
                child: Text(
                  isArabic ? "English" : "العربية",
                  style: const TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}

// ===== GENERAL WIDGETS =====

Widget sectionCard({required String title, required List<Widget> children}) {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.all(20),
    child: Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xFF4B5DFF),
              ),
            ),
            const SizedBox(height: 12),
            ...children,
          ],
        ),
      ),
    ),
  );
}

Widget clinicCard(String text) {
  return Card(
    elevation: 3,
    margin: const EdgeInsets.symmetric(vertical: 6),
    child: Padding(
      padding: const EdgeInsets.all(12),
      child: Text(text, style: const TextStyle(fontSize: 16)),
    ),
  );
}

class ArticleSection extends StatelessWidget {
  final bool isArabic;

  const ArticleSection({super.key, required this.isArabic});

  @override
  Widget build(BuildContext context) {
    final title = isArabic ? "مقالة قصيرة" : "Short Article";
    final subtitle = isArabic
        ? "عن فكرة التطبيق واستخداماته"
        : "About the App and Its Uses";

    final contentAr = """
تطبيق "مركز العناية بالعيون" هو نموذج عملي لتقديم المعلومات الطبية بطريقة احترافية وسهلة الاستخدام. 
يساعد هذا النوع من التطبيقات المرضى على الوصول إلى أهم الخدمات دون تعقيد مثل: التعرف على العيادات، 
مميزات المركز، وطرق التواصل المباشر مثل الاتصال والواتساب والموقع الجغرافي.

كما يتيح التطبيق عرض الهوية البصرية للمركز بشكل جميل ويعزز الثقة بين المريض والطبيب، 
خاصة مع دعم اللغتين العربية والإنجليزية لتلبية جمهور أوسع.
""";

    final contentEn = """
The “Eye Care Center” app is a professional and user-friendly tool for presenting medical services 
clearly and efficiently. It helps patients access essential information such as clinics, features, 
and direct contact options including phone, WhatsApp, website, and map location.

It also enhances the center’s branding with clean visuals and bilingual support (Arabic & English), 
making it suitable for wider audiences.
""";

    return sectionCard(
      title: title,
      children: [
        Text(
          subtitle,
          style: const TextStyle(
            fontSize: 18,
            color: Colors.black54,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          isArabic ? contentAr : contentEn,
          style: const TextStyle(fontSize: 15, height: 1.6),
        ),
      ],
    );
  }
}

// ====== CONSTANTS ======
final phone = "+963992369841";
final whatsapp = "+963992369841";
final website = "https://example.com";
final mapUrl = "https://www.google.com/maps?q=36.2209,37.1337";
final email = "waheed.hanblaas@gmail.com";

// ====== UTILS ======
Future<void> openUrl(String url) async {
  final uri = Uri.parse(url);
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }
}

// ====== SHORTCUTS ======
void callNumber() => openUrl("tel:$phone");

void openWhatsapp() => openUrl("https://wa.me/$whatsapp");

void openWebsite() => openUrl(website);

void openLocation() => openUrl(mapUrl);
// ===== REUSABLE WIDGETS =====

Widget contactSection(bool isArabic) {
  return Container(
    color: Colors.grey.shade100,
    padding: const EdgeInsets.symmetric(vertical: 40),
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
