
import 'package:flutter/material.dart';

void main() {
  runApp(const NovaAIStudy());
}

const Color bg = Color(0xFF080B16);
const Color panel = Color(0xFF11182A);
const Color cyan = Color(0xFF43E8FF);
const Color purple = Color(0xFF9D7BFF);

class NovaAIStudy extends StatelessWidget {
  const NovaAIStudy({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NovaAI Study',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: bg,
        colorScheme: ColorScheme.fromSeed(
          seedColor: cyan,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
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
  int selectedTab = 0;

  final List<Map<String, dynamic>> features = [
    {
      'icon': Icons.document_scanner_rounded,
      'title': 'قراءة المحاضرات',
      'desc': 'جهّز نص محاضرتك للمذاكرة',
      'color': cyan,
    },
    {
      'icon': Icons.translate_rounded,
      'title': 'الترجمة الذكية',
      'desc': 'افهم النص ومعناه بالعربي',
      'color': purple,
    },
    {
      'icon': Icons.auto_awesome_rounded,
      'title': 'شرح بالمصري',
      'desc': 'بسّط المعلومة خطوة بخطوة',
      'color': Color(0xFF63F5B0),
    },
    {
      'icon': Icons.quiz_rounded,
      'title': 'اختبر نفسك',
      'desc': 'جهّز أسئلة للمراجعة',
      'color': Color(0xFFFFC46B),
    },
  ];

  void showFeature(String title) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => FeaturePage(title: title),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: SafeArea(
          child: ListView(
            padding: const EdgeInsets.all(20),
            children: [
              Row(
                children: [
                  Container(
                    width: 52,
                    height: 52,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(17),
                      gradient: const LinearGradient(
                        colors: [cyan, purple],
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: cyan.withOpacity(0.20),
                          blurRadius: 22,
                        ),
                      ],
                    ),
                    child: const Icon(
                      Icons.auto_awesome,
                      color: bg,
                      size: 30,
                    ),
                  ),
                  const SizedBox(width: 12),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'NovaAI Study',
                          style: TextStyle(
                            fontSize: 23,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'مساعدك الذكي للمذاكرة',
                          style: TextStyle(
                            color: cyan,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      showFeature('الإعدادات');
                    },
                    icon: const Icon(Icons.settings_outlined),
                  ),
                ],
              ),
              const SizedBox(height: 28),
              Container(
                padding: const EdgeInsets.all(22),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(26),
                  gradient: const LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      Color(0xFF202A50),
                      Color(0xFF15182F),
                      Color(0xFF101626),
                    ],
                  ),
                  border: Border.all(
                    color: cyan.withOpacity(0.35),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.psychology_alt_rounded,
                      color: cyan,
                      size: 42,
                    ),
                    const SizedBox(height: 14),
                    const Text(
                      'ذاكر بذكاء، مش بمجهود أكتر',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 9),
                    const Text(
                      'حوّل محاضراتك إلى ترجمة وشرح '
                      'ومراجعة تساعدك تفهم المعلومة.',
                      style: TextStyle(
                        color: Colors.white70,
                        height: 1.7,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      child: FilledButton.icon(
                        onPressed: () {
                          showFeature('ابدأ مذاكرتك');
                        },
                        icon: const Icon(Icons.rocket_launch_rounded),
                        label: const Text('ابدأ مذاكرتك'),
                        style: FilledButton.styleFrom(
                          backgroundColor: cyan,
                          foregroundColor: bg,
                          padding: const EdgeInsets.symmetric(
                            vertical: 15,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 28),
              const Text(
                'أدواتك الدراسية',
                style: TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 6),
              const Text(
                'اختار الأداة اللي محتاجها',
                style: TextStyle(color: Colors.white60),
              ),
              const SizedBox(height: 15),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: features.length,
                gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 13,
                  crossAxisSpacing: 13,
                  childAspectRatio: 0.93,
                ),
                itemBuilder: (context, index) {
                  final item = features[index];
                  final color = item['color'] as Color;

                  return InkWell(
                    borderRadius: BorderRadius.circular(22),
                    onTap: () => showFeature(item['title'] as String),
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: panel,
                        borderRadius: BorderRadius.circular(22),
                        border: Border.all(
                          color: color.withOpacity(0.28),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 48,
                            height: 48,
                            decoration: BoxDecoration(
                              color: color.withOpacity(0.12),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Icon(
                              item['icon'] as IconData,
                              color: color,
                              size: 27,
                            ),
                          ),
                          const Spacer(),
                          Text(
                            item['title'] as String,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 7),
                          Text(
                            item['desc'] as String,
                            style: const TextStyle(
                              fontSize: 12,
                              height: 1.5,
                              color: Colors.white60,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 24),
              Container(
                padding: const EdgeInsets.all(17),
                decoration: BoxDecoration(
                  color: panel,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Row(
                  children: [
                    Icon(Icons.lightbulb_outline, color: cyan, size: 30),
                    SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        'نصيحة اليوم\n'
                        'افهم الفكرة الأول، وبعدها احفظ المصطلحات.',
                        style: TextStyle(height: 1.7),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              const Center(
                child: Text(
                  'NOVA AI  •  STUDY SMARTER',
                  style: TextStyle(
                    color: Colors.white38,
                    fontSize: 11,
                    letterSpacing: 2,
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: NavigationBar(
          backgroundColor: panel,
          indicatorColor: cyan.withOpacity(0.16),
          selectedIndex: selectedTab,
          onDestinationSelected: (index) {
            setState(() => selectedTab = index);
            if (index == 1) showFeature('مكتبتي');
            if (index == 2) showFeature('المراجعة');
          },
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.home_outlined),
              selectedIcon: Icon(Icons.home, color: cyan),
              label: 'الرئيسية',
            ),
            NavigationDestination(
              icon: Icon(Icons.folder_open_outlined),
              label: 'مكتبتي',
            ),
            NavigationDestination(
              icon: Icon(Icons.school_outlined),
              label: 'المراجعة',
            ),
          ],
        ),
      ),
    );
  }
}

class FeaturePage extends StatelessWidget {
  final String title;

  const FeaturePage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(title: Text(title)),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.auto_awesome,
                  color: cyan,
                  size: 70,
                ),
                const SizedBox(height: 20),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  'إحنا بنجهّز القسم ده في مشروعك.\n'
                  'الخطوة الجاية هنضيف الوظائف الفعلية '
                  'ونربطها بملفات محاضراتك.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white70,
                    height: 1.8,
                  ),
                ),
                const SizedBox(height: 25),
                FilledButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('العودة للرئيسية'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
