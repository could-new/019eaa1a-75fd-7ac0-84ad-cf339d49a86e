import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'about_developer_screen.dart';
import 'about_app_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _scriptController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  String _generatedResult = "";
  String _observationMode = "Raw URL GitHub";

  void _generateLoadstring() {
    String scriptContent = _scriptController.text.trim();
    String customName = _nameController.text.trim();

    if (scriptContent.isEmpty || customName.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Harap isi teks script dan nama custom")),
      );
      return;
    }

    // Ubah nama file menjadi URL encode yang valid atau slug
    String encodedName = Uri.encodeComponent(customName);
    
    // Format link Raw custom
    String rawLink = "https://NalaNeo/$encodedName/Raw.com";
    
    setState(() {
      _generatedResult = 'loadstring(game:HttpGet("$rawLink"))()';
    });
  }

  void _copyToClipboard() {
    if (_generatedResult.isNotEmpty) {
      Clipboard.setData(ClipboardData(text: _generatedResult));
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Berhasil disalin ke clipboard!")),
      );
    }
  }

  @override
  void dispose() {
    _scriptController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("NalaNeo Loadstring"),
        centerTitle: true,
      ),
      endDrawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Tentang Developer'),
              onTap: () {
                Navigator.pop(context); // Tutup drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AboutDeveloperScreen()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('Tentang Loadstring Make'),
              onTap: () {
                Navigator.pop(context); // Tutup drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AboutAppScreen()),
                );
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Center(
              child: Text(
                "Loadstring Make",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 24),
            TextField(
              controller: _scriptController,
              maxLines: 5,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Isi Teks Script / Kode Anda di sini",
                alignLabelWithHint: true,
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Custom Name Script",
                hintText: "Contoh: AutoFarm",
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                const Text("Pilihan Observasi: "),
                const SizedBox(width: 8),
                Expanded(
                  child: DropdownButton<String>(
                    isExpanded: true,
                    value: _observationMode,
                    items: <String>["Raw URL GitHub", "Pastebin (coming soon)"]
                        .map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      if (newValue != null) {
                        setState(() {
                          _observationMode = newValue;
                        });
                      }
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: _generateLoadstring,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                textStyle: const TextStyle(fontSize: 18),
              ),
              child: const Text("Generate Loadstring"),
            ),
            const SizedBox(height: 32),
            if (_generatedResult.isNotEmpty) ...[
              const Text(
                "Hasil Generate:",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey[400]!),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        _generatedResult,
                        style: const TextStyle(
                          fontFamily: 'monospace',
                          fontSize: 14,
                        ),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.copy),
                      onPressed: _copyToClipboard,
                      tooltip: "Salin Hasil",
                    ),
                  ],
                ),
              ),
            ]
          ],
        ),
      ),
    );
  }
}
