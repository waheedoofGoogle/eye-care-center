import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AppDrawer extends StatelessWidget {
  final bool isArabic;
  final VoidCallback onToggleLang;
  final String phone;
  final String whatsapp;
  final String website;
  final String mapUrl;
  final String email;

  const AppDrawer({
    super.key,
    required this.isArabic,
    required this.onToggleLang,
    this.phone = '+966500000000',
    this.whatsapp = '+966500000000',
    this.website = 'https://example.com',
    this.mapUrl = 'https://maps.google.com',
    this.email = 'info@example.com',
  });

  Future<void> _open(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    final textDir = isArabic ? TextDirection.rtl : TextDirection.ltr;
    return Drawer(
      child: Directionality(
        textDirection: textDir,
        child: SafeArea(
          child: Column(
            children: [
              DrawerHeader(
                decoration: const BoxDecoration(
                  color: Color(0xFF4B5DFF),
                ),
                child: Row(
                  children: [
                    // Logo (replace with your AssetImage or NetworkImage)
                    Container(
                      width: 72,
                      height: 72,
                      decoration: BoxDecoration(
                        color: Colors.white24,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.network(
                          'assets/images/app_logo.jpg',
                          fit: BoxFit.cover,
                          errorBuilder: (_, __, ___) => const Icon(
                            Icons.visibility,
                            size: 40,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            isArabic ? 'مركز العناية بالعيون' : 'EYE CARE CENTER',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            isArabic ? 'نقود الضوء إلى بصرك' : 'Leading Light to your Sight',
                            style: const TextStyle(color: Colors.white70),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // Navigation items
              Expanded(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    ListTile(
                      leading: const Icon(Icons.home),
                      title: Text(isArabic ? 'الرئيسية' : 'Home'),
                      onTap: () => Navigator.of(context).pop(),
                    ),
                    ListTile(
                      leading: const Icon(Icons.medical_services),
                      title: Text(isArabic ? 'العيادات' : 'Clinics'),
                      onTap: () {
                        Navigator.of(context).pop();
                        // navigate to clinics page
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.people),
                      title: Text(isArabic ? 'فريقنا' : 'Our Team'),
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.info_outline),
                      title: Text(isArabic ? 'معلومات عن المركز' : 'About Us'),
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    const Divider(),

                    // Contact section title
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                      child: Text(
                        isArabic ? 'طرق التواصل' : 'Contact',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),

                    ListTile(
                      leading: const Icon(Icons.phone),
                      title: Text(isArabic ? 'اتصال مباشر' : 'Call'),
                      subtitle: Text(phone),
                      onTap: () => _open('tel:$phone'),
                    ),
                    ListTile(
                      leading: const Icon(Icons.chat),
                      title: Text(isArabic ? 'واتساب' : 'WhatsApp'),
                      subtitle: Text(whatsapp),
                      onTap: () => _open('https://wa.me/$whatsapp'),
                    ),
                    ListTile(
                      leading: const Icon(Icons.language),
                      title: Text(isArabic ? 'الموقع الإلكتروني' : 'Website'),
                      subtitle: Text(website),
                      onTap: () => _open(website),
                    ),
                    ListTile(
                      leading: const Icon(Icons.location_on),
                      title: Text(isArabic ? 'الموقع على الخريطة' : 'Location'),
                      subtitle: Text(isArabic ? 'عرض على الخريطة' : 'Open in maps'),
                      onTap: () => _open(mapUrl),
                    ),
                    ListTile(
                      leading: const Icon(Icons.email),
                      title: Text(isArabic ? 'البريد الإلكتروني' : 'Email'),
                      subtitle: Text(email),
                      onTap: () => _open('mailto:$email'),
                    ),

                    const SizedBox(height: 8),
                    const Divider(),

                    // Social / small actions
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        children: [
                          Expanded(
                            child: OutlinedButton.icon(
                              icon: const Icon(Icons.share),
                              label: Text(isArabic ? 'مشاركة' : 'Share'),
                              onPressed: () {
                                // implement share (share_plus package) or copy link
                                Navigator.of(context).pop();
                              },
                            ),
                          ),
                          const SizedBox(width: 8),
                          ElevatedButton.icon(
                            icon: const Icon(Icons.language),
                            label: Text(isArabic ? 'العربية' : 'EN'),
                            onPressed: () {
                              Navigator.of(context).pop();
                              onToggleLang();
                            },
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 18),
                  ],
                ),
              ),

              // Footer
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Row(
                  children: [
                    const Icon(Icons.copyright, size: 14, color: Colors.black54),
                    const SizedBox(width: 6),
                    Text(
                      isArabic ? 'حقوق النشر 2025' : '© 2025 Eye Care Center',
                      style: const TextStyle(color: Colors.black54, fontSize: 12),
                    ),
                    const Spacer(),
                    IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
