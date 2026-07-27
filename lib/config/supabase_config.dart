import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseConfig {
  static const String url = 'https://ochajhysuwyixtkvymno.supabase.co';
  static const String anonKey =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im9jaGFqaHlzdXd5aXh0a3Z5bW5vIiwicm9sZSI6ImFub24iLCJpYXQiOjE3ODUwMzYzMjYsImV4cCI6MjEwMDYxMjMyNn0.06O_O5C4rfherz054wCU-RE4li79bjGKaO9wuOBsbks';

  static Future<void> initialize() async {
    if (url.isEmpty || anonKey.isEmpty) {
      return;
    }

    await Supabase.initialize(url: url, publishableKey: anonKey);
  }
}