import 'dart:convert';

class SimpleCipher {
  static String encrypt(String plainText, String cipherKey) {
    List<int> plainBytes = utf8.encode(plainText);
    List<int> keyBytes = utf8.encode(cipherKey);

    List<int> encryptedBytes = [];
    for (int i = 0; i < plainBytes.length; i++) {
      int xorResult = plainBytes[i] ^ keyBytes[i % keyBytes.length];
      int shiftedResult = xorResult + 5;
      encryptedBytes.add(shiftedResult);
    }

    return base64.encode(encryptedBytes);
  }

  static String decrypt(String encryptedText, String cipherKey) {
    List<int> encryptedBytes = base64.decode(encryptedText);
    List<int> keyBytes = utf8.encode(cipherKey);

    List<int> decryptedBytes = [];
    for (int i = 0; i < encryptedBytes.length; i++) {
      int shiftedResult = encryptedBytes[i] - 5;
      int xorResult = shiftedResult ^ keyBytes[i % keyBytes.length];
      decryptedBytes.add(xorResult);
    }

    return utf8.decode(decryptedBytes);
  }
}
