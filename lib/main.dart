import 'package:flutter/material.dart';

void main() {
  runApp(const MistriSebaApp());
}

class MistriSebaApp extends StatelessWidget {
  const MistriSebaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'মিস্ত্রি সেবা',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: const Color(0xFF082B59),
        fontFamily: 'sans',
      ),
      home: const SplashScreen(),
    );
  }
}

// ================= SPLASH SCREEN =================

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => const RoleSelectionScreen(),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF082B59),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 110,
              height: 110,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(28),
              ),
              child: const Icon(
                Icons.handyman,
                size: 65,
                color: Color(0xFF082B59),
              ),
            ),
            const SizedBox(height: 25),
            const Text(
              'মিস্ত্রি সেবা',
              style: TextStyle(
                color: Colors.white,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'মিস্ত্রি আর বাসা — একসাথে',
              style: TextStyle(
                color: Colors.white70,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ================= ROLE SELECTION =================

class RoleSelectionScreen extends StatelessWidget {
  const RoleSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'মিস্ত্রি সেবা',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF082B59),
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 15),
            const Text(
              'আপনি কী করতে চান?',
              style: TextStyle(
                fontSize: 27,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'আপনার প্রয়োজন অনুযায়ী একটি অপশন নির্বাচন করুন',
              style: TextStyle(
                fontSize: 15,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 25),

            RoleCard(
              icon: Icons.home_repair_service,
              title: 'আমি কাজ করাইতে চাই',
              subtitle: 'বাসা বা প্রতিষ্ঠানের কাজের জন্য মিস্ত্রি খুঁজুন',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const CustomerScreen(),
                  ),
                );
              },
            ),

            RoleCard(
              icon: Icons.engineering,
              title: 'আমি কাজ করতে চাই',
              subtitle: 'মিস্ত্রি, শ্রমিক বা হেল্পার হিসেবে কাজ খুঁজুন',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const CategoryScreen(),
                  ),
                );
              },
            ),

            RoleCard(
              icon: Icons.architecture,
              title: 'আমি ইঞ্জিনিয়ার',
              subtitle: 'ইঞ্জিনিয়ার হিসেবে কাজের সুযোগ খুঁজুন',
              onTap: () {},
            ),

            RoleCard(
              icon: Icons.business,
              title: 'আমি ঠিকাদার',
              subtitle: 'কাজ নিন এবং মিস্ত্রি/শ্রমিক পরিচালনা করুন',
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}

// ================= ROLE CARD =================

class RoleCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const RoleCard({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 14),
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(18),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Row(
            children: [
              Container(
                width: 58,
                height: 58,
                decoration: BoxDecoration(
                  color: const Color(0xFFE8F0FA),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Icon(
                  icon,
                  size: 32,
                  color: const Color(0xFF082B59),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      subtitle,
                      style: const TextStyle(
                        fontSize: 13,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              const Icon(
                Icons.arrow_forward_ios,
                size: 18,
                color: Colors.grey,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ================= CUSTOMER SCREEN =================

class CustomerScreen extends StatelessWidget {
  const CustomerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('কাজের পোস্ট'),
        backgroundColor: const Color(0xFF082B59),
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Icon(
              Icons.home_work,
              size: 80,
              color: Color(0xFF082B59),
            ),
            const SizedBox(height: 20),
            const Text(
              'আপনার কাজের বিস্তারিত দিন',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 25),
            TextField(
              decoration: InputDecoration(
                labelText: 'কাজের বিবরণ',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
              maxLines: 4,
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF082B59),
                  foregroundColor: Colors.white,
                ),
                child: const Text(
                  'কাজের পোস্ট দিন',
                  style: TextStyle(fontSize: 17),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ================= CATEGORY SCREEN =================

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  final List<String> categories = const [
    'রাজমিস্ত্রি',
    'রড মিস্ত্রি',
    'কাঠমিস্ত্রি',
    'স্যানিটারি মিস্ত্রি',
    'টাইলস মিস্ত্রি',
    'ইলেকট্রিশিয়ান',
    'রং মিস্ত্রি',
    'গ্লাস মিস্ত্রি',
    'ওয়েল্ডিং মিস্ত্রি',
    'এসি মিস্ত্রি',
    'প্লাম্বার',
    'পাইপ মিস্ত্রি',
    'অ্যালুমিনিয়াম মিস্ত্রি',
    'ছাদ/টিন মিস্ত্রি',
    'মেকানিক',
    'হেল্পার / সাহায্যকারী',
    'আদার্স',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('কাজের ধরন নির্বাচন করুন'),
        backgroundColor: const Color(0xFF082B59),
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.only(bottom: 10),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: const Color(0xFFE8F0FA),
                child: Text(
                  '${index + 1}',
                  style: const TextStyle(
                    color: Color(0xFF082B59),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              title: Text(
                categories[index],
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {},
            ),
          );
        },
      ),
    );
  }
}
