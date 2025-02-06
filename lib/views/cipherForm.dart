import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:stage0_task/utils/crypt.dart';

class StringInputForm extends StatefulWidget {
  const StringInputForm({super.key});

  @override
  _StringInputFormState createState() => _StringInputFormState();
}

class _StringInputFormState extends State<StringInputForm> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _textController = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  String? _encryptedValue;
  String? _decryptedValue;

  @override
  void dispose() {
    _textController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _encryptInput() {
    String? secretKey = dotenv.env['SECRET_KEY'];
    if (secretKey == null || secretKey.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Error: SECRET_KEY not found")),
      );
      return;
    }

    setState(() {
      _encryptedValue = SimpleCipher.encrypt(_textController.text, secretKey);
      _decryptedValue = null; // Reset decrypted value
    });
    print("heree");
    _textController.clear();
  }

  void _decryptInput() {
    String? secretKey = dotenv.env['SECRET_KEY'];
    if (secretKey == null || secretKey.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Error: SECRET_KEY not found")),
      );
      return;
    }

    setState(() {
      _decryptedValue = SimpleCipher.decrypt(_encryptedValue ?? "", secretKey);
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _focusNode.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.amber,
          title: (Text("Encryption/Decryption")),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    controller: _textController,
                    decoration: const InputDecoration(
                      labelText: 'Enter a string to encypt',
                      border: OutlineInputBorder(),
                    ),
                    focusNode: _focusNode,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _encryptInput();
                        }
                      },
                      child: const Text(
                        'Encrypt',
                        style: TextStyle(color: Colors.amber),
                      ),
                    ),
                  ),
                  if (_encryptedValue != null)
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 100),
                        child: Column(
                          children: [
                            const Text(
                              "Encrypted String:",
                              style: TextStyle(fontSize: 18),
                            ),
                            SelectableText(
                              _encryptedValue!,
                              style: const TextStyle(
                                  fontSize: 18, color: Colors.blue),
                            ),
                            const SizedBox(height: 10),
                            ElevatedButton(
                              onPressed: _decryptInput,
                              child: const Text("Decrypt"),
                            ),
                          ],
                        ),
                      ),
                    ),
                  if (_decryptedValue != null)
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Column(
                          children: [
                            const Text(
                              "Decrypted String:",
                              style: TextStyle(fontSize: 18),
                            ),
                            SelectableText(
                              _decryptedValue!,
                              style: const TextStyle(
                                  fontSize: 18, color: Colors.green),
                            ),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
