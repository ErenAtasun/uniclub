import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController universityController = TextEditingController();
  final TextEditingController studentNumberController = TextEditingController();
  final TextEditingController communityNameController = TextEditingController();
  final TextEditingController roleController = TextEditingController();

  String userType = 'Üye'; // Varsayılan kullanıcı tipi
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> registerUser() async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      // Kullanıcı bilgilerini kaydetmek için User Metadata'ı güncelle
      String additionalInfo = '';
      if (userType == 'Üye') {
        additionalInfo =
            'Üniversite: ${universityController.text}, Öğrenci Numarası: ${studentNumberController.text}';
      } else if (userType == 'Topluluk') {
        additionalInfo =
            'Topluluk: ${communityNameController.text}, Üniversite: ${universityController.text}, Öğrenci No: ${studentNumberController.text}, Rol: ${roleController.text}';
      }

      await userCredential.user?.updateDisplayName('$userType | $additionalInfo');
      print("Kayıt Başarılı: $additionalInfo");

      // Kullanıcıyı bilgilendir
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Kayıt başarılı!')),
      );

      // Başarılı kayıt sonrası başka bir ekrana yönlendirin
      Navigator.pop(context);
    } catch (e) {
      print("Hata: $e");

      // Kullanıcıyı bilgilendir
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Kayıt başarısız: ${e.toString()}')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Kullanıcı Tipi Seçimi',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: RadioListTile<String>(
                    dense: true,
                    title: const Text(
                      'Üye',
                      style: TextStyle(fontSize: 14),
                    ),
                    value: 'Üye',
                    groupValue: userType,
                    onChanged: (value) {
                      setState(() {
                        userType = value!;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: RadioListTile<String>(
                    dense: true,
                    title: const Text(
                      'Topluluk',
                      style: TextStyle(fontSize: 14),
                    ),
                    value: 'Topluluk',
                    groupValue: userType,
                    onChanged: (value) {
                      setState(() {
                        userType = value!;
                      });
                    },
                  ),
                ),
              ],
            ),
            const Divider(height: 20, thickness: 1),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'E-posta',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Şifre',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 24),
            if (userType == 'Üye') ...[
              TextField(
                controller: universityController,
                decoration: InputDecoration(
                  labelText: 'Üniversite',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: studentNumberController,
                decoration: InputDecoration(
                  labelText: 'Öğrenci Numarası',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ],
            if (userType == 'Topluluk') ...[
              TextField(
                controller: communityNameController,
                decoration: InputDecoration(
                  labelText: 'Topluluk İsmi',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: universityController,
                decoration: InputDecoration(
                  labelText: 'Üniversite',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: studentNumberController,
                decoration: InputDecoration(
                  labelText: 'Öğrenci Numarası',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: roleController,
                decoration: InputDecoration(
                  labelText: 'Rol',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ],
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: registerUser,
              child: const Text('Kayıt Ol'),
            ),
          ],
        ),
      ),
    );
  }
}
