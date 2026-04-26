import 'package:flutter/material.dart';

// ─── ENTRY POINT ─────────────────────────────────────────────────────────────

void main() => runApp(const ServiceFinderApp());

// ─── APP STATE (Dark Mode + Favourites — lifted to top) ──────────────────────

class AppState extends ChangeNotifier {
  bool _isDark = false;
  final Set<String> _favourites = {};

  bool get isDark => _isDark;
  Set<String> get favourites => _favourites;

  void toggleTheme() {
    _isDark = !_isDark;
    notifyListeners();
  }

  void toggleFavourite(String providerName) {
    if (_favourites.contains(providerName)) {
      _favourites.remove(providerName);
    } else {
      _favourites.add(providerName);
    }
    notifyListeners();
  }

  bool isFavourite(String name) => _favourites.contains(name);
}

final AppState appState = AppState();

class ServiceFinderApp extends StatefulWidget {
  const ServiceFinderApp({super.key});

  @override
  State<ServiceFinderApp> createState() => _ServiceFinderAppState();
}

class _ServiceFinderAppState extends State<ServiceFinderApp> {
  @override
  void initState() {
    super.initState();
    appState.addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ServiceFinder',
      debugShowCheckedModeBanner: false,
      themeMode: appState.isDark ? ThemeMode.dark : ThemeMode.light,
      theme: _buildLightTheme(),
      darkTheme: _buildDarkTheme(),
      home: const CategoryScreen(),
    );
  }

  ThemeData _buildLightTheme() => ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF1A73E8)),
    scaffoldBackgroundColor: const Color(0xFFF1F4F9),
    fontFamily: 'Roboto',
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF1A73E8),
      foregroundColor: Colors.white,
      elevation: 0,
      titleTextStyle: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
    ),
    cardTheme: CardThemeData(
      color: Colors.white,
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
    ),
  );

  ThemeData _buildDarkTheme() => ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: ColorScheme.fromSeed(
        seedColor: const Color(0xFF1A73E8), brightness: Brightness.dark),
    scaffoldBackgroundColor: const Color(0xFF0F1117),
    fontFamily: 'Roboto',
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF1A1F2E),
      foregroundColor: Colors.white,
      elevation: 0,
      titleTextStyle: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
    ),
    cardTheme: CardThemeData(
      color: const Color(0xFF1A1F2E),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
    ),
  );
}

// ─── DATA MODELS ─────────────────────────────────────────────────────────────

class ServiceCategory {
  final String name;
  final IconData icon;
  final Color color;
  final int providerCount;
  const ServiceCategory(
      {required this.name,
        required this.icon,
        required this.color,
        required this.providerCount});
}

class ServiceProvider {
  final String name;
  final String category;
  final double rating;
  final int reviewCount;
  final String phone;
  final String location;
  final String experience;
  final Color avatarColor;
  final String about;
  final List<String> skills;
  final String availability;
  final int jobsDone;

  const ServiceProvider({
    required this.name,
    required this.category,
    required this.rating,
    required this.reviewCount,
    required this.phone,
    required this.location,
    required this.experience,
    required this.avatarColor,
    required this.about,
    required this.skills,
    required this.availability,
    required this.jobsDone,
  });
}

// ─── SAMPLE DATA ─────────────────────────────────────────────────────────────

const List<ServiceCategory> categories = [
  ServiceCategory(name: 'Plumber', icon: Icons.plumbing, color: Color(0xFF1A73E8), providerCount: 12),
  ServiceCategory(name: 'Electrician', icon: Icons.electric_bolt, color: Color(0xFFF9AB00), providerCount: 9),
  ServiceCategory(name: 'Tutor', icon: Icons.school, color: Color(0xFF34A853), providerCount: 15),
  ServiceCategory(name: 'Carpenter', icon: Icons.handyman, color: Color(0xFFE8710A), providerCount: 7),
  ServiceCategory(name: 'Painter', icon: Icons.format_paint, color: Color(0xFF9C27B0), providerCount: 8),
  ServiceCategory(name: 'Cleaner', icon: Icons.cleaning_services, color: Color(0xFF00BCD4), providerCount: 11),
  ServiceCategory(name: 'Mechanic', icon: Icons.build, color: Color(0xFFE53935), providerCount: 6),
  ServiceCategory(name: 'Gardener', icon: Icons.yard, color: Color(0xFF43A047), providerCount: 5),
];

final Map<String, List<ServiceProvider>> providerData = {
  'Plumber': [
    ServiceProvider(name: 'Rajesh Kumar', category: 'Plumber', rating: 4.8, reviewCount: 124, phone: '+91 98765 43210', location: 'Sector 12, Noida', experience: '8 yrs exp', avatarColor: const Color(0xFF1A73E8), about: 'Expert in pipe fitting, leak repair, and bathroom installations. Trusted by 100+ families across Noida and GZB.', skills: ['Pipe Fitting', 'Leak Repair', 'Bathroom Install', 'Drainage Fix'], availability: 'Mon–Sat, 8AM–7PM', jobsDone: 312),
    ServiceProvider(name: 'Sunil Verma', category: 'Plumber', rating: 4.5, reviewCount: 87, phone: '+91 91234 56789', location: 'Indirapuram, GZB', experience: '5 yrs exp', avatarColor: const Color(0xFF0D47A1), about: 'Specialises in overhead tank installations and kitchen plumbing. Fast and affordable service.', skills: ['Tank Install', 'Kitchen Plumbing', 'Tap Repair'], availability: 'Mon–Sun, 9AM–6PM', jobsDone: 189),
    ServiceProvider(name: 'Amit Singh', category: 'Plumber', rating: 4.2, reviewCount: 63, phone: '+91 99887 65432', location: 'Vasundhara, GZB', experience: '3 yrs exp', avatarColor: const Color(0xFF1565C0), about: 'Young and reliable plumber available for emergency calls on weekends.', skills: ['Emergency Repair', 'Water Pump', 'Pipe Laying'], availability: 'Mon–Sun, 8AM–9PM', jobsDone: 98),
    ServiceProvider(name: 'Deepak Yadav', category: 'Plumber', rating: 4.7, reviewCount: 101, phone: '+91 88776 54321', location: 'Raj Nagar, GZB', experience: '10 yrs exp', avatarColor: const Color(0xFF1976D2), about: 'Senior plumber with a decade of experience in residential and commercial projects.', skills: ['Commercial Plumbing', 'RO Install', 'Geyser Fitting'], availability: 'Mon–Sat, 7AM–8PM', jobsDone: 450),
  ],
  'Electrician': [
    ServiceProvider(name: 'Vinod Sharma', category: 'Electrician', rating: 4.9, reviewCount: 198, phone: '+91 97654 32109', location: 'Kaushambi, GZB', experience: '12 yrs exp', avatarColor: const Color(0xFFF9AB00), about: 'Top-rated electrician for wiring, AC installation, and switchboard repair. ISI certified.', skills: ['AC Install', 'Switchboard', 'Inverter Setup', 'Wiring'], availability: 'Mon–Sat, 8AM–8PM', jobsDone: 620),
    ServiceProvider(name: 'Pradeep Gupta', category: 'Electrician', rating: 4.6, reviewCount: 75, phone: '+91 90123 45678', location: 'Vaishali, GZB', experience: '6 yrs exp', avatarColor: const Color(0xFFE65100), about: 'Experienced in CCTV wiring, smart home setups, and electrical panel work.', skills: ['CCTV Wiring', 'Smart Home', 'Panel Work'], availability: 'Mon–Sun, 9AM–7PM', jobsDone: 210),
    ServiceProvider(name: 'Manoj Tiwari', category: 'Electrician', rating: 4.3, reviewCount: 52, phone: '+91 88654 21098', location: 'Crossing Republik', experience: '4 yrs exp', avatarColor: const Color(0xFFFF8F00), about: 'Reliable for daily electrical repairs and appliance installations at budget rates.', skills: ['Fan Install', 'Light Fitting', 'Appliance Repair'], availability: 'Tue–Sun, 9AM–6PM', jobsDone: 130),
  ],
  'Tutor': [
    ServiceProvider(name: 'Dr. Priya Mehta', category: 'Tutor', rating: 5.0, reviewCount: 210, phone: '+91 95432 10987', location: 'Sector 62, Noida', experience: '15 yrs exp', avatarColor: const Color(0xFF34A853), about: 'PhD in Mathematics. Teaches Class 9–12 and competitive exam prep (JEE/NEET). 95% student success rate.', skills: ['Mathematics', 'Physics', 'JEE Prep', 'NEET Prep'], availability: 'Mon–Fri, 4PM–8PM', jobsDone: 540),
    ServiceProvider(name: 'Ankit Joshi', category: 'Tutor', rating: 4.7, reviewCount: 133, phone: '+91 87654 32198', location: 'Sector 18, Noida', experience: '7 yrs exp', avatarColor: const Color(0xFF1B5E20), about: 'Ex-IITian coaching for Math and Science for classes 6–10. Online and offline available.', skills: ['Maths', 'Science', 'Computer'], availability: 'Mon–Sat, 5PM–9PM', jobsDone: 310),
    ServiceProvider(name: 'Neha Agarwal', category: 'Tutor', rating: 4.8, reviewCount: 167, phone: '+91 96543 21087', location: 'Indirapuram, GZB', experience: '9 yrs exp', avatarColor: const Color(0xFF2E7D32), about: 'English Literature and SST expert. Specialises in board exam writing skills and grammar.', skills: ['English', 'SST', 'Hindi', 'Writing Skills'], availability: 'Mon–Sun, 3PM–7PM', jobsDone: 380),
    ServiceProvider(name: 'Ravi Shankar', category: 'Tutor', rating: 4.4, reviewCount: 89, phone: '+91 78965 43210', location: 'Vaishali, GZB', experience: '5 yrs exp', avatarColor: const Color(0xFF388E3C), about: 'Affordable home tutor for primary classes. Friendly teaching approach for young learners.', skills: ['Primary Maths', 'EVS', 'Drawing'], availability: 'Mon–Sat, 4PM–7PM', jobsDone: 160),
  ],
  'Carpenter': [
    ServiceProvider(name: 'Ramesh Patel', category: 'Carpenter', rating: 4.6, reviewCount: 78, phone: '+91 89012 34567', location: 'Sector 5, Noida', experience: '11 yrs exp', avatarColor: const Color(0xFFE8710A), about: 'Master carpenter for custom furniture, modular kitchens, and wardrobe fittings.', skills: ['Modular Kitchen', 'Wardrobe', 'Custom Furniture'], availability: 'Mon–Sat, 9AM–7PM', jobsDone: 280),
    ServiceProvider(name: 'Suresh Nair', category: 'Carpenter', rating: 4.3, reviewCount: 45, phone: '+91 78901 23456', location: 'Greater Noida', experience: '6 yrs exp', avatarColor: const Color(0xFFBF360C), about: 'Door and window specialist. Quick turnaround for repair and polishing jobs.', skills: ['Door Repair', 'Window Fix', 'Polishing'], availability: 'Mon–Sun, 8AM–6PM', jobsDone: 145),
  ],
  'Painter': [
    ServiceProvider(name: 'Harish Yadav', category: 'Painter', rating: 4.5, reviewCount: 91, phone: '+91 96789 01234', location: 'Sector 22, Noida', experience: '8 yrs exp', avatarColor: const Color(0xFF9C27B0), about: 'Professional interior and exterior painter. Uses eco-friendly paints and delivers on time.', skills: ['Interior Paint', 'Exterior Paint', 'Texture Work'], availability: 'Mon–Sat, 8AM–6PM', jobsDone: 230),
    ServiceProvider(name: 'Kishore Das', category: 'Painter', rating: 4.2, reviewCount: 56, phone: '+91 85678 90123', location: 'Raj Nagar Ext.', experience: '4 yrs exp', avatarColor: const Color(0xFF6A1B9A), about: 'Budget painter for single rooms or full flats. Flexible hours and neat finish guaranteed.', skills: ['Room Painting', 'Wall Putty', 'Primer Work'], availability: 'Tue–Sun, 9AM–7PM', jobsDone: 120),
  ],
  'Cleaner': [
    ServiceProvider(name: 'Sunita Devi', category: 'Cleaner', rating: 4.8, reviewCount: 143, phone: '+91 94321 09876', location: 'Kaushambi, GZB', experience: '6 yrs exp', avatarColor: const Color(0xFF00BCD4), about: 'Deep cleaning expert for homes, offices, and post-construction sites. Team of 3 available.', skills: ['Deep Clean', 'Office Clean', 'Post-Construction'], availability: 'Mon–Sat, 8AM–5PM', jobsDone: 390),
    ServiceProvider(name: 'Meena Kumari', category: 'Cleaner', rating: 4.6, reviewCount: 112, phone: '+91 93210 98765', location: 'Vaishali, GZB', experience: '4 yrs exp', avatarColor: const Color(0xFF006064), about: 'Reliable daily maid and part-time cleaner. Careful with valuables and always punctual.', skills: ['Daily Maid', 'Kitchen Clean', 'Laundry'], availability: 'Mon–Sun, 7AM–2PM', jobsDone: 270),
    ServiceProvider(name: 'Geeta Singh', category: 'Cleaner', rating: 4.4, reviewCount: 67, phone: '+91 92109 87654', location: 'Sector 63, Noida', experience: '3 yrs exp', avatarColor: const Color(0xFF00838F), about: 'Sofa, carpet, and curtain cleaning specialist using professional steam cleaning equipment.', skills: ['Sofa Clean', 'Carpet Steam', 'Curtain Wash'], availability: 'Mon–Sat, 9AM–6PM', jobsDone: 150),
  ],
  'Mechanic': [
    ServiceProvider(name: 'Rohit Mishra', category: 'Mechanic', rating: 4.7, reviewCount: 88, phone: '+91 91098 76543', location: 'Greater Noida', experience: '9 yrs exp', avatarColor: const Color(0xFFE53935), about: 'Certified auto mechanic for cars and bikes. Doorstep service available with own tools.', skills: ['Engine Repair', 'AC Gas Refill', 'Tyre Change'], availability: 'Mon–Sat, 9AM–7PM', jobsDone: 310),
    ServiceProvider(name: 'Sachin Dubey', category: 'Mechanic', rating: 4.4, reviewCount: 54, phone: '+91 90987 65432', location: 'Sector 10, Noida', experience: '5 yrs exp', avatarColor: const Color(0xFFB71C1C), about: 'Two-wheeler specialist. Quick oil change, brake service, and puncture repairs at your doorstep.', skills: ['Bike Repair', 'Oil Change', 'Puncture Fix'], availability: 'Mon–Sun, 8AM–8PM', jobsDone: 195),
  ],
  'Gardener': [
    ServiceProvider(name: 'Mohan Lal', category: 'Gardener', rating: 4.5, reviewCount: 42, phone: '+91 89876 54321', location: 'Greater Noida', experience: '7 yrs exp', avatarColor: const Color(0xFF43A047), about: 'Landscape gardener for bungalows, societies, and office parks. Seasonal planting expert.', skills: ['Landscaping', 'Seasonal Plants', 'Lawn Mowing'], availability: 'Mon–Sat, 7AM–4PM', jobsDone: 175),
    ServiceProvider(name: 'Bhanu Pratap', category: 'Gardener', rating: 4.3, reviewCount: 31, phone: '+91 88765 43210', location: 'Sector 45, Noida', experience: '4 yrs exp', avatarColor: const Color(0xFF1B5E20), about: 'Terrace and balcony garden specialist. Pot arrangements, drip irrigation, and pruning services.', skills: ['Terrace Garden', 'Drip Irrigation', 'Pruning'], availability: 'Tue–Sun, 8AM–5PM', jobsDone: 95),
  ],
};

// ─── HELPERS ─────────────────────────────────────────────────────────────────

Widget buildStarRating(double rating, {double size = 14}) {
  return Row(
    mainAxisSize: MainAxisSize.min,
    children: List.generate(5, (i) {
      if (i < rating.floor()) return Icon(Icons.star, size: size, color: const Color(0xFFF9AB00));
      if (i < rating && rating - i >= 0.5) return Icon(Icons.star_half, size: size, color: const Color(0xFFF9AB00));
      return Icon(Icons.star_outline, size: size, color: const Color(0xFFF9AB00));
    }),
  );
}

// ─── SCREEN 1: CATEGORY SCREEN ───────────────────────────────────────────────

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  int _tab = 0;

  @override
  void initState() {
    super.initState();
    appState.addListener(() { if (mounted) setState(() {}); });
  }

  @override
  Widget build(BuildContext context) {
    final isDark = appState.isDark;

    return Scaffold(
      backgroundColor: isDark ? const Color(0xFF0F1117) : const Color(0xFFF1F4F9),
      appBar: AppBar(
        title: const Text('ServiceFinder'),
        actions: [
          IconButton(
            icon: Icon(isDark ? Icons.light_mode_outlined : Icons.dark_mode_outlined),
            tooltip: isDark ? 'Light Mode' : 'Dark Mode',
            onPressed: appState.toggleTheme,
          ),
          const Padding(
            padding: EdgeInsets.only(right: 12),
            child: CircleAvatar(
              radius: 16,
              backgroundColor: Colors.white24,
              child: Icon(Icons.person, size: 18, color: Colors.white),
            ),
          ),
        ],
      ),
      body: _tab == 0 ? _homeTab(isDark) : _favTab(isDark),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _tab,
        onDestinationSelected: (i) => setState(() => _tab = i),
        destinations: [
          const NavigationDestination(
            icon: Icon(Icons.grid_view_rounded),
            label: 'Categories',
          ),
          NavigationDestination(
            icon: Badge(
              isLabelVisible: appState.favourites.isNotEmpty,
              label: Text('${appState.favourites.length}'),
              child: const Icon(Icons.favorite_border),
            ),
            selectedIcon: const Icon(Icons.favorite, color: Color(0xFFE53935)),
            label: 'Favourites',
          ),
        ],
      ),
    );
  }

  Widget _homeTab(bool isDark) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _hero(isDark),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 8),
          child: Text('Browse Categories',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: isDark ? Colors.white : const Color(0xFF1A1A2E))),
        ),
        Expanded(
          child: GridView.builder(
            padding: const EdgeInsets.fromLTRB(16, 4, 16, 20),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 14,
                mainAxisSpacing: 14,
                childAspectRatio: 1.1),
            itemCount: categories.length,
            itemBuilder: (ctx, i) => _CategoryCard(
              category: categories[i],
              isDark: isDark,
              onTap: () => Navigator.push(
                  ctx,
                  MaterialPageRoute(
                      builder: (_) =>
                          ProviderListScreen(category: categories[i]))),
            ),
          ),
        ),
      ],
    );
  }

  Widget _favTab(bool isDark) {
    final favs = providerData.values
        .expand((l) => l)
        .where((p) => appState.isFavourite(p.name))
        .toList();

    if (favs.isEmpty) {
      return Center(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Icon(Icons.favorite_border, size: 72, color: Colors.grey[300]),
          const SizedBox(height: 16),
          Text('No favourites yet',
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey[500],
                  fontWeight: FontWeight.w500)),
          const SizedBox(height: 8),
          Text('Tap ♥ on any provider to save them here',
              style: TextStyle(fontSize: 14, color: Colors.grey[400])),
        ]),
      );
    }

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: Text('${favs.length} Saved Providers',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: isDark ? Colors.white : const Color(0xFF1A1A2E))),
        ),
        ...favs.map((p) {
          final cat = categories.firstWhere((c) => c.name == p.category,
              orElse: () => categories[0]);
          return _ProviderCard(
            provider: p,
            categoryColor: cat.color,
            isDark: isDark,
            onCallTap: () => _snack(p.name, p.phone),
          );
        }),
      ],
    );
  }

  Widget _hero(bool isDark) {
    return Container(
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF1A1F2E) : const Color(0xFF1A73E8),
        borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(28),
            bottomRight: Radius.circular(28)),
      ),
      padding: const EdgeInsets.fromLTRB(20, 8, 20, 28),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Text('Good Morning! 👋',
            style: TextStyle(color: Colors.white70, fontSize: 14)),
        const SizedBox(height: 4),
        const Text('Find Trusted\nService Experts',
            style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
                height: 1.2)),
        const SizedBox(height: 16),
        Container(
          decoration: BoxDecoration(
            color: isDark ? const Color(0xFF252B3D) : Colors.white,
            borderRadius: BorderRadius.circular(14),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 8,
                  offset: const Offset(0, 3))
            ],
          ),
          child: TextField(
            style:
            TextStyle(color: isDark ? Colors.white : Colors.black87),
            decoration: InputDecoration(
              hintText: 'Search for a service...',
              hintStyle:
              TextStyle(color: Colors.grey[400], fontSize: 14),
              prefixIcon:
              const Icon(Icons.search, color: Color(0xFF1A73E8)),
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(vertical: 14),
            ),
            onSubmitted: (v) {
              if (v.trim().isNotEmpty) {
                final cat = categories.firstWhere(
                      (c) =>
                      c.name.toLowerCase().contains(v.toLowerCase()),
                  orElse: () => categories[0],
                );
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => ProviderListScreen(
                            category: cat, initialSearch: v)));
              }
            },
          ),
        ),
      ]),
    );
  }

  void _snack(String name, String phone) {
    ScaffoldMessenger.of(context)
      ..clearSnackBars()
      ..showSnackBar(SnackBar(
        content: Row(children: [
          const Icon(Icons.call, color: Colors.white, size: 20),
          const SizedBox(width: 10),
          Expanded(
              child: Text('Calling $name at $phone...',
                  style: const TextStyle(fontWeight: FontWeight.w500))),
        ]),
        backgroundColor: const Color(0xFF1A73E8),
        behavior: SnackBarBehavior.floating,
        shape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        margin: const EdgeInsets.all(16),
        duration: const Duration(seconds: 3),
      ));
  }
}

class _CategoryCard extends StatelessWidget {
  final ServiceCategory category;
  final bool isDark;
  final VoidCallback onTap;

  const _CategoryCard(
      {required this.category,
        required this.isDark,
        required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 2,
        shadowColor: category.color.withOpacity(0.25),
        shape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            gradient: LinearGradient(
              colors: isDark
                  ? [
                const Color(0xFF1A1F2E),
                category.color.withOpacity(0.1)
              ]
                  : [Colors.white, category.color.withOpacity(0.04)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: category.color.withOpacity(0.12),
                    borderRadius: BorderRadius.circular(12)),
                child: Icon(category.icon, color: category.color, size: 28),
              ),
              Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(category.name,
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: isDark
                                ? Colors.white
                                : const Color(0xFF1A1A2E))),
                    const SizedBox(height: 2),
                    Text('${category.providerCount} experts',
                        style:
                        TextStyle(fontSize: 12, color: Colors.grey[500])),
                  ]),
            ],
          ),
        ),
      ),
    );
  }
}

// ─── SCREEN 2: PROVIDER LIST SCREEN ──────────────────────────────────────────

class ProviderListScreen extends StatefulWidget {
  final ServiceCategory category;
  final String? initialSearch;

  const ProviderListScreen(
      {super.key, required this.category, this.initialSearch});

  @override
  State<ProviderListScreen> createState() => _ProviderListScreenState();
}

class _ProviderListScreenState extends State<ProviderListScreen> {
  late TextEditingController _ctrl;
  String _query = '';

  @override
  void initState() {
    super.initState();
    _query = widget.initialSearch ?? '';
    _ctrl = TextEditingController(text: _query);
    appState.addListener(() { if (mounted) setState(() {}); });
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  List<ServiceProvider> get _filtered {
    final all = providerData[widget.category.name] ?? [];
    if (_query.isEmpty) return all;
    return all
        .where((p) =>
        p.name.toLowerCase().contains(_query.toLowerCase()))
        .toList();
  }

  void _call(String name, String phone) {
    ScaffoldMessenger.of(context)
      ..clearSnackBars()
      ..showSnackBar(SnackBar(
        content: Row(children: [
          const Icon(Icons.call, color: Colors.white, size: 20),
          const SizedBox(width: 10),
          Expanded(
              child: Text('Calling $name at $phone...',
                  style: const TextStyle(fontWeight: FontWeight.w500))),
        ]),
        backgroundColor: widget.category.color,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12)),
        margin: const EdgeInsets.all(16),
        duration: const Duration(seconds: 3),
      ));
  }

  @override
  Widget build(BuildContext context) {
    final isDark = appState.isDark;
    final providers = _filtered;

    return Scaffold(
      backgroundColor:
      isDark ? const Color(0xFF0F1117) : const Color(0xFFF1F4F9),
      appBar: AppBar(
        title: Text('${widget.category.name}s'),
        leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new, size: 20),
            onPressed: () => Navigator.pop(context)),
      ),
      body: Column(children: [
        Container(
          color: isDark
              ? const Color(0xFF1A1F2E)
              : const Color(0xFF1A73E8),
          padding: const EdgeInsets.fromLTRB(16, 4, 16, 20),
          child: Container(
            decoration: BoxDecoration(
              color:
              isDark ? const Color(0xFF252B3D) : Colors.white,
              borderRadius: BorderRadius.circular(14),
            ),
            child: TextField(
              controller: _ctrl,
              style: TextStyle(
                  color: isDark ? Colors.white : Colors.black87),
              decoration: InputDecoration(
                hintText:
                'Search ${widget.category.name}s by name...',
                hintStyle: TextStyle(
                    color: Colors.grey[400], fontSize: 14),
                prefixIcon: const Icon(Icons.search,
                    color: Color(0xFF1A73E8)),
                border: InputBorder.none,
                contentPadding:
                const EdgeInsets.symmetric(vertical: 14),
                suffixIcon: _query.isNotEmpty
                    ? IconButton(
                    icon: const Icon(Icons.clear,
                        color: Colors.grey),
                    onPressed: () => setState(() {
                      _query = '';
                      _ctrl.clear();
                    }))
                    : null,
              ),
              onChanged: (v) => setState(() => _query = v),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: 20, vertical: 10),
          child: Row(children: [
            Icon(widget.category.icon,
                color: widget.category.color, size: 18),
            const SizedBox(width: 8),
            Text('${providers.length} available',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: isDark
                        ? Colors.white
                        : const Color(0xFF1A1A2E))),
            const Spacer(),
            Text('Near Muradnagar',
                style:
                TextStyle(fontSize: 12, color: Colors.grey[500])),
          ]),
        ),
        Expanded(
          child: providers.isEmpty
              ? Center(
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.search_off,
                        size: 60, color: Colors.grey[300]),
                    const SizedBox(height: 12),
                    Text('No results for "$_query"',
                        style: TextStyle(
                            color: Colors.grey[500])),
                    TextButton(
                        onPressed: () => setState(() {
                          _query = '';
                          _ctrl.clear();
                        }),
                        child: const Text('Clear')),
                  ]))
              : ListView.builder(
            padding:
            const EdgeInsets.fromLTRB(16, 4, 16, 24),
            itemCount: providers.length,
            itemBuilder: (ctx, i) => _ProviderCard(
              provider: providers[i],
              categoryColor: widget.category.color,
              isDark: isDark,
              onCallTap: () =>
                  _call(providers[i].name, providers[i].phone),
            ),
          ),
        ),
      ]),
    );
  }
}

// ─── PROVIDER CARD ────────────────────────────────────────────────────────────

class _ProviderCard extends StatefulWidget {
  final ServiceProvider provider;
  final Color categoryColor;
  final bool isDark;
  final VoidCallback onCallTap;

  const _ProviderCard(
      {required this.provider,
        required this.categoryColor,
        required this.isDark,
        required this.onCallTap});

  @override
  State<_ProviderCard> createState() => _ProviderCardState();
}

class _ProviderCardState extends State<_ProviderCard> {
  @override
  void initState() {
    super.initState();
    appState.addListener(() { if (mounted) setState(() {}); });
  }

  @override
  Widget build(BuildContext context) {
    final isFav = appState.isFavourite(widget.provider.name);

    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18)),
        child: InkWell(
          borderRadius: BorderRadius.circular(18),
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => ProviderProfileScreen(
                  provider: widget.provider,
                  categoryColor: widget.categoryColor),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(children: [
              Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Hero(
                      tag: 'avatar_${widget.provider.name}',
                      child: CircleAvatar(
                        radius: 28,
                        backgroundColor: widget.provider.avatarColor,
                        child: Text(
                          widget.provider.name
                              .split(' ')
                              .map((e) => e[0])
                              .take(2)
                              .join(),
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                      ),
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Column(
                          crossAxisAlignment:
                          CrossAxisAlignment.start,
                          children: [
                            Row(children: [
                              Expanded(
                                child: Text(
                                  widget.provider.name,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: widget.isDark
                                          ? Colors.white
                                          : const Color(0xFF1A1A2E)),
                                ),
                              ),
                              GestureDetector(
                                onTap: () => appState.toggleFavourite(
                                    widget.provider.name),
                                child: AnimatedSwitcher(
                                  duration:
                                  const Duration(milliseconds: 250),
                                  transitionBuilder: (child, anim) =>
                                      ScaleTransition(
                                          scale: anim, child: child),
                                  child: Icon(
                                    isFav
                                        ? Icons.favorite
                                        : Icons.favorite_border,
                                    key: ValueKey(isFav),
                                    color: isFav
                                        ? const Color(0xFFE53935)
                                        : Colors.grey[400],
                                    size: 22,
                                  ),
                                ),
                              ),
                            ]),
                            const SizedBox(height: 4),
                            Row(children: [
                              buildStarRating(widget.provider.rating),
                              const SizedBox(width: 6),
                              Text(
                                  '${widget.provider.rating} (${widget.provider.reviewCount})',
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey[600])),
                            ]),
                            const SizedBox(height: 6),
                            Row(children: [
                              Icon(Icons.location_on,
                                  size: 13,
                                  color: Colors.grey[400]),
                              const SizedBox(width: 3),
                              Flexible(
                                  child: Text(widget.provider.location,
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.grey[500]))),
                              const SizedBox(width: 10),
                              Icon(Icons.work_outline,
                                  size: 13,
                                  color: Colors.grey[400]),
                              const SizedBox(width: 3),
                              Text(widget.provider.experience,
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey[500])),
                            ]),
                          ]),
                    ),
                  ]),
              const SizedBox(height: 12),
              Divider(
                  height: 1,
                  color: widget.isDark
                      ? Colors.white12
                      : const Color(0xFFF0F0F0)),
              const SizedBox(height: 12),
              Row(children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ProviderProfileScreen(
                            provider: widget.provider,
                            categoryColor: widget.categoryColor),
                      ),
                    ),
                    icon: const Icon(Icons.person_outline, size: 16),
                    label: const Text('View Profile',
                        style: TextStyle(fontSize: 13)),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: widget.categoryColor,
                      side: BorderSide(
                          color:
                          widget.categoryColor.withOpacity(0.5)),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      padding:
                      const EdgeInsets.symmetric(vertical: 10),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: widget.onCallTap,
                    icon: const Icon(Icons.call, size: 16),
                    label: const Text('Call Now',
                        style: TextStyle(fontSize: 13)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: widget.categoryColor,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      padding:
                      const EdgeInsets.symmetric(vertical: 10),
                      elevation: 0,
                    ),
                  ),
                ),
              ]),
            ]),
          ),
        ),
      ),
    );
  }
}

// ─── SCREEN 3: PROVIDER PROFILE DETAIL ───────────────────────────────────────

class ProviderProfileScreen extends StatefulWidget {
  final ServiceProvider provider;
  final Color categoryColor;

  const ProviderProfileScreen(
      {super.key, required this.provider, required this.categoryColor});

  @override
  State<ProviderProfileScreen> createState() =>
      _ProviderProfileScreenState();
}

class _ProviderProfileScreenState extends State<ProviderProfileScreen> {
  @override
  void initState() {
    super.initState();
    appState.addListener(() { if (mounted) setState(() {}); });
  }

  void _call() {
    ScaffoldMessenger.of(context)
      ..clearSnackBars()
      ..showSnackBar(SnackBar(
        content: Row(children: [
          const Icon(Icons.call, color: Colors.white, size: 20),
          const SizedBox(width: 10),
          Expanded(
              child: Text(
                  'Calling ${widget.provider.name} at ${widget.provider.phone}...',
                  style: const TextStyle(fontWeight: FontWeight.w500))),
        ]),
        backgroundColor: widget.categoryColor,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12)),
        margin: const EdgeInsets.all(16),
      ));
  }

  @override
  Widget build(BuildContext context) {
    final isDark = appState.isDark;
    final p = widget.provider;
    final isFav = appState.isFavourite(p.name);
    final color = widget.categoryColor;

    return Scaffold(
      backgroundColor:
      isDark ? const Color(0xFF0F1117) : const Color(0xFFF1F4F9),
      body: CustomScrollView(slivers: [
        SliverAppBar(
          expandedHeight: 230,
          pinned: true,
          backgroundColor:
          isDark ? const Color(0xFF1A1F2E) : color,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new,
                size: 20, color: Colors.white),
            onPressed: () => Navigator.pop(context),
          ),
          actions: [
            IconButton(
              icon: Icon(
                  isFav ? Icons.favorite : Icons.favorite_border,
                  color: isFav
                      ? const Color(0xFFFF6B6B)
                      : Colors.white),
              onPressed: () =>
                  appState.toggleFavourite(p.name),
            ),
          ],
          flexibleSpace: FlexibleSpaceBar(
            background: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: isDark
                      ? [
                    const Color(0xFF1A1F2E),
                    color.withOpacity(0.7)
                  ]
                      : [color, color.withOpacity(0.75)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 50),
                    Hero(
                      tag: 'avatar_${p.name}',
                      child: CircleAvatar(
                        radius: 44,
                        backgroundColor: Colors.white24,
                        child: CircleAvatar(
                          radius: 40,
                          backgroundColor: p.avatarColor,
                          child: Text(
                            p.name
                                .split(' ')
                                .map((e) => e[0])
                                .take(2)
                                .join(),
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 24),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(p.name,
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20)),
                    const SizedBox(height: 4),
                    Row(
                        mainAxisAlignment:
                        MainAxisAlignment.center,
                        children: [
                          buildStarRating(p.rating, size: 16),
                          const SizedBox(width: 6),
                          Text(
                              '${p.rating}  •  ${p.reviewCount} reviews',
                              style: const TextStyle(
                                  color: Colors.white70,
                                  fontSize: 13)),
                        ]),
                  ]),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _StatsRow(p: p, color: color, isDark: isDark),
                  const SizedBox(height: 20),
                  _SectionCard(
                    title: 'About',
                    isDark: isDark,
                    color: color,
                    icon: Icons.info_outline,
                    child: Text(p.about,
                        style: TextStyle(
                            fontSize: 14,
                            height: 1.5,
                            color: isDark
                                ? Colors.white70
                                : Colors.grey[700])),
                  ),
                  const SizedBox(height: 14),
                  _SectionCard(
                    title: 'Skills & Services',
                    isDark: isDark,
                    color: color,
                    icon: Icons.build_circle_outlined,
                    child: Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: p.skills
                          .map((s) => Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: color.withOpacity(0.1),
                          borderRadius:
                          BorderRadius.circular(20),
                          border: Border.all(
                              color:
                              color.withOpacity(0.3)),
                        ),
                        child: Text(s,
                            style: TextStyle(
                                fontSize: 12,
                                color: color,
                                fontWeight:
                                FontWeight.w600)),
                      ))
                          .toList(),
                    ),
                  ),
                  const SizedBox(height: 14),
                  _SectionCard(
                    title: 'Contact & Availability',
                    isDark: isDark,
                    color: color,
                    icon: Icons.schedule,
                    child: Column(children: [
                      _InfoRow(
                          icon: Icons.phone,
                          label: 'Phone',
                          value: p.phone,
                          isDark: isDark),
                      const SizedBox(height: 10),
                      _InfoRow(
                          icon: Icons.location_on,
                          label: 'Location',
                          value: p.location,
                          isDark: isDark),
                      const SizedBox(height: 10),
                      _InfoRow(
                          icon: Icons.access_time,
                          label: 'Available',
                          value: p.availability,
                          isDark: isDark),
                    ]),
                  ),
                  const SizedBox(height: 24),
                  Row(children: [
                    Expanded(
                      child: OutlinedButton.icon(
                        onPressed: () {},
                        icon: const Icon(
                            Icons.chat_bubble_outline),
                        label: const Text('Message'),
                        style: OutlinedButton.styleFrom(
                          foregroundColor: color,
                          side: BorderSide(
                              color: color.withOpacity(0.5)),
                          shape: RoundedRectangleBorder(
                              borderRadius:
                              BorderRadius.circular(14)),
                          padding: const EdgeInsets.symmetric(
                              vertical: 14),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      flex: 2,
                      child: ElevatedButton.icon(
                        onPressed: _call,
                        icon: const Icon(Icons.call),
                        label: Text(
                            'Call ${p.name.split(' ')[0]}'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: color,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius:
                              BorderRadius.circular(14)),
                          padding: const EdgeInsets.symmetric(
                              vertical: 14),
                          elevation: 3,
                        ),
                      ),
                    ),
                  ]),
                  const SizedBox(height: 20),
                ]),
          ),
        ),
      ]),
    );
  }
}

// ─── PROFILE HELPER WIDGETS ───────────────────────────────────────────────────

class _StatsRow extends StatelessWidget {
  final ServiceProvider p;
  final Color color;
  final bool isDark;
  const _StatsRow(
      {required this.p, required this.color, required this.isDark});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      _StatBox(
          label: 'Rating',
          value: '${p.rating}★',
          color: color,
          isDark: isDark),
      const SizedBox(width: 10),
      _StatBox(
          label: 'Jobs Done',
          value: '${p.jobsDone}+',
          color: color,
          isDark: isDark),
      const SizedBox(width: 10),
      _StatBox(
          label: 'Experience',
          value: p.experience.replaceAll(' exp', ''),
          color: color,
          isDark: isDark),
    ]);
  }
}

class _StatBox extends StatelessWidget {
  final String label, value;
  final Color color;
  final bool isDark;
  const _StatBox(
      {required this.label,
        required this.value,
        required this.color,
        required this.isDark});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14),
        decoration: BoxDecoration(
          color: isDark ? const Color(0xFF1A1F2E) : Colors.white,
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 6,
                offset: const Offset(0, 2))
          ],
        ),
        child: Column(children: [
          Text(value,
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: color)),
          const SizedBox(height: 4),
          Text(label,
              style:
              TextStyle(fontSize: 11, color: Colors.grey[500])),
        ]),
      ),
    );
  }
}

class _SectionCard extends StatelessWidget {
  final String title;
  final bool isDark;
  final Color color;
  final IconData icon;
  final Widget child;
  const _SectionCard(
      {required this.title,
        required this.isDark,
        required this.color,
        required this.icon,
        required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF1A1F2E) : Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 6,
              offset: const Offset(0, 2))
        ],
      ),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(children: [
              Icon(icon, color: color, size: 18),
              const SizedBox(width: 8),
              Text(title,
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: isDark
                          ? Colors.white
                          : const Color(0xFF1A1A2E))),
            ]),
            const SizedBox(height: 12),
            child,
          ]),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String label, value;
  final bool isDark;
  const _InfoRow(
      {required this.icon,
        required this.label,
        required this.value,
        required this.isDark});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Icon(icon, size: 16, color: Colors.grey[400]),
      const SizedBox(width: 8),
      Text('$label: ',
          style: TextStyle(fontSize: 13, color: Colors.grey[500])),
      Expanded(
          child: Text(value,
              style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: isDark
                      ? Colors.white
                      : const Color(0xFF1A1A2E)))),
    ]);
  }
}