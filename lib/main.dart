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
        scaffoldBackgroundColor: const Color(0xFFF5F8FC),
        fontFamily: 'sans',
      ),
      home: const RoleSelectionScreen(),
    );
  }
}

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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 20),
            const Icon(
              Icons.home_repair_service_rounded,
              size: 85,
              color: Color(0xFF082B59),
            ),
            const SizedBox(height: 15),
            const Text(
              'মিস্ত্রি সেবা বাংলাদেশ',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Color(0xFF082B59),
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'আপনার প্রয়োজনের কাজের লোক খুঁজুন',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),
            const SizedBox(height: 30),

            _roleButton(
              context,
              'আমি কাজ করাইতে চাই',
              Icons.home_work_rounded,
              () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const JobCategoryScreen(),
                  ),
                );
              },
            ),

            _roleButton(
              context,
              'আমি কাজ করতে চাই',
              Icons.engineering_rounded,
              () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const WorkerCategoryScreen(),
                  ),
                );
              },
            ),

            _roleButton(
              context,
              'আমি ইঞ্জিনিয়ার',
              Icons.architecture_rounded,
              () {
                _showMessage(context, 'ইঞ্জিনিয়ার প্রোফাইল খুব শিগগির যোগ হবে।');
              },
            ),

            _roleButton(
              context,
              'আমি ঠিকাদার',
              Icons.business_center_rounded,
              () {
                _showMessage(context, 'ঠিকাদার প্রোফাইল খুব শিগগির যোগ হবে।');
              },
            ),

            const SizedBox(height: 20),
            const Text(
              'মিস্ত্রি • শ্রমিক • ঠিকাদার • ইঞ্জিনিয়ার',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black54,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _roleButton(
    BuildContext context,
    String title,
    IconData icon,
    VoidCallback onTap,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      width: double.infinity,
      child: ElevatedButton.icon(
        onPressed: onTap,
        icon: Icon(icon, size: 28),
        label: Padding(
          padding: const EdgeInsets.symmetric(vertical: 17),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: const Color(0xFF082B59),
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
    );
  }

  void _showMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }
}

class JobCategoryScreen extends StatelessWidget {
  const JobCategoryScreen({super.key});

  final List<Map<String, dynamic>> categories = const [
    {'name': 'রাজমিস্ত্রি', 'icon': Icons.foundation_rounded},
    {'name': 'রড মিস্ত্রি', 'icon': Icons.construction_rounded},
    {'name': 'কাঠমিস্ত্রি', 'icon': Icons.carpenter_rounded},
    {'name': 'স্যানিটারি মিস্ত্রি', 'icon': Icons.plumbing_rounded},
    {'name': 'টাইলস মিস্ত্রি', 'icon': Icons.grid_view_rounded},
    {'name': 'ইলেকট্রিশিয়ান', 'icon': Icons.electrical_services_rounded},
    {'name': 'পেইন্টার', 'icon': Icons.format_paint_rounded},
    {'name': 'ওয়েল্ডিং মিস্ত্রি', 'icon': Icons.build_rounded},
    {'name': 'গ্লাস মিস্ত্রি', 'icon': Icons.window_rounded},
    {'name': 'অ্যালুমিনিয়াম মিস্ত্রি', 'icon': Icons.view_module_rounded},
    {'name': 'এসি/ফ্রিজ মিস্ত্রি', 'icon': Icons.ac_unit_rounded},
    {'name': 'প্লাস্টার মিস্ত্রি', 'icon': Icons.handyman_rounded},
    {'name': 'ছাদ/টিন মিস্ত্রি', 'icon': Icons.roofing_rounded},
    {'name': 'মেকানিক', 'icon': Icons.car_repair_rounded},
    {'name': 'হেল্পার', 'icon': Icons.groups_rounded},
    {'name': 'ছোট ঠিকাদার', 'icon': Icons.business_rounded},
    {'name': 'আদার্স / অন্যান্য', 'icon': Icons.more_horiz_rounded},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('কাজের লোক নির্বাচন করুন'),
        backgroundColor: const Color(0xFF082B59),
        foregroundColor: Colors.white,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: categories.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 1.05,
        ),
        itemBuilder: (context, index) {
          final category = categories[index];

          return InkWell(
            borderRadius: BorderRadius.circular(18),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => JobPostScreen(
                    category: category['name'] as String,
                  ),
                ),
              );
            },
            child: Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    category['icon'] as IconData,
                    size: 45,
                    color: const Color(0xFF082B59),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    category['name'] as String,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class WorkerCategoryScreen extends StatelessWidget {
  const WorkerCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('আমি যে কাজ করি'),
        backgroundColor: const Color(0xFF082B59),
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          WorkerOption(title: 'রাজমিস্ত্রি'),
          WorkerOption(title: 'রড মিস্ত্রি'),
          WorkerOption(title: 'কাঠমিস্ত্রি'),
          WorkerOption(title: 'স্যানিটারি মিস্ত্রি'),
          WorkerOption(title: 'টাইলস মিস্ত্রি'),
          WorkerOption(title: 'ইলেকট্রিশিয়ান'),
          WorkerOption(title: 'পেইন্টার'),
          WorkerOption(title: 'ওয়েল্ডিং মিস্ত্রি'),
          WorkerOption(title: 'হেল্পার / মিস্ত্রির সাহায্যকারী'),
          WorkerOption(title: 'ছোট ঠিকাদার'),
          WorkerOption(title: 'আদার্স / অন্যান্য'),
        ],
      ),
    );
  }
}

class WorkerOption extends StatelessWidget {
  final String title;

  const WorkerOption({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        leading: const CircleAvatar(
          backgroundColor: Color(0xFFE6EEF8),
          child: Icon(
            Icons.engineering_rounded,
            color: Color(0xFF082B59),
          ),
        ),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 18),
        onTap: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('$title নির্বাচন করা হয়েছে')),
          );
        },
      ),
    );
  }
}

class JobPostScreen extends StatefulWidget {
  final String category;

  const JobPostScreen({super.key, required this.category});

  @override
  State<JobPostScreen> createState() => _JobPostScreenState();
}

class _JobPostScreenState extends State<JobPostScreen> {
  final locationController = TextEditingController();
  final detailsController = TextEditingController();

  @override
  void dispose() {
    locationController.dispose();
    detailsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('কাজের পোস্ট'),
        backgroundColor: const Color(0xFF082B59),
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.category,
              style: const TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
                color: Color(0xFF082B59),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: locationController,
              decoration: InputDecoration(
                labelText: 'কাজের জায়গা',
                hintText: 'এলাকা / জেলা লিখুন',
                prefixIcon: const Icon(Icons.location_on_rounded),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: detailsController,
              maxLines: 5,
              decoration: InputDecoration(
                labelText: 'কাজের বিস্তারিত',
                hintText: 'কী কাজ করাতে চান লিখুন',
                prefixIcon: const Icon(Icons.description_rounded),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'অগ্রিম / পেমেন্ট ব্যবস্থা পরে যুক্ত করা হবে।',
              style: TextStyle(color: Colors.black54),
            ),
            const SizedBox(height: 25),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  if (locationController.text.trim().isEmpty ||
                      detailsController.text.trim().isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('কাজের জায়গা ও বিস্তারিত লিখুন'),
                      ),
                    );
                    return;
                  }

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        'কাজের পোস্ট তৈরি হয়েছে। কাছাকাছি মিস্ত্রি ও ঠিকাদারদের জানানো হবে।',
                      ),
                    ),
                  );
                },
                icon: const Icon(Icons.send_rounded),
                label: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  child: Text(
                    'কাজের পোস্ট দিন',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
