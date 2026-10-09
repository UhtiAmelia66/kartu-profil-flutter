import 'package:flutter/material.dart';

void main() {
  runApp(const ProfileApp());
}

class ProfileApp extends StatelessWidget {
  const ProfileApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kartu Profil',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.pink,
        scaffoldBackgroundColor: const Color(0xFFFDF7F9),
      ),
      home: const ProfilePage(),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Kartu Profil',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),

      body: LayoutBuilder(
        builder: (context, constraints) {
          // Jika layar lebih dari 600px → Row
          // Jika layar kurang dari/sama dengan 600px → Column
          final bool layarLebar = constraints.maxWidth > 600;

          return Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Container(
                constraints: const BoxConstraints(maxWidth: 900),
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.08),
                      blurRadius: 15,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),

                child: layarLebar
                    ? Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _fotoProfil(),
                          const SizedBox(width: 35),
                          Expanded(
                            child: _informasiProfil(),
                          ),
                        ],
                      )
                    : Column(
                        children: [
                          _fotoProfil(),
                          const SizedBox(height: 25),
                          _informasiProfil(),
                        ],
                      ),
              ),
            ),
          );
        },
      ),
    );
  }

  // =========================
  // FOTO + BADGE
  // =========================
  Widget _fotoProfil() {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        CircleAvatar(
          radius: 90,
          backgroundImage: const AssetImage(
             'assets/foto_profil.jpg',
          ),
        ),

        // Badge Available
        Positioned(
          bottom: 5,
          right: -5,
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 7,
            ),
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: Colors.white,
                width: 3,
              ),
            ),
            child: const Text(
              'Available',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
          ),
        ),
      ],
    );
  }

  // =========================
  // INFORMASI PROFIL
  // =========================
  Widget _informasiProfil() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Uhti Amelia',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 6),

        const Text(
          'Mahasiswa Sistem Informasi',
          style: TextStyle(
            fontSize: 18,
            color: Colors.pink,
            fontWeight: FontWeight.w600,
          ),
        ),

        const SizedBox(height: 15),

        const Text(
          'Halo Saya Uhti Amelia (4124012) Saya mahasiswa Sistem Informasi yang tertarik '
          'pada pengembangan aplikasi, desain antarmuka, dan '
          'teknologi informasi. Saya senang mempelajari hal baru '
          'dan mengembangkan kemampuan di bidang teknologi.',
          style: TextStyle(
            fontSize: 15,
            height: 1.6,
            color: Colors.black87,
          ),
        ),

        const SizedBox(height: 20),

        const Text(
          'Keahlian',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 10),

        // WRAP untuk skill
       Wrap(
  spacing: 8,
  runSpacing: 8,
  children: const [
    Chip(
      avatar: Icon(Icons.description, size: 18),
      label: Text('Microsoft Office'),
    ),
    Chip(
      avatar: Icon(Icons.palette, size: 18),
      label: Text('Desain Canva'),
    ),
    Chip(
  avatar: Icon(Icons.design_services, size: 18),
  label: Text('UI/UX Desain'),
  ),
    Chip(
      avatar: Icon(Icons.code, size: 18),
      label: Text('HTML & CSS'),
            ),
          ],
        ),

        const SizedBox(height: 25),

        const Text(
          'Kontak',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 10),

        // ROW untuk 3 ikon sosial/kontak
        Row(
          children: [
            _iconKontak(
              Icons.email,
              'Email',
            ),
            const SizedBox(width: 20),
            _iconKontak(
              Icons.phone,
              'Telepon',
            ),
            const SizedBox(width: 20),
            _iconKontak(
              Icons.code,
              'GitHub',
            ),
          ],
        ),
      ],
    );
  }

  // Widget untuk ikon kontak
  Widget _iconKontak(
    IconData icon,
    String label,
  ) {
    return Column(
      children: [
        CircleAvatar(
          radius: 22,
          backgroundColor: Colors.pink.shade50,
          child: Icon(
            icon,
            color: Colors.pink,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          label,
          style: const TextStyle(fontSize: 12),
        ),
      ],
    );
  }
}