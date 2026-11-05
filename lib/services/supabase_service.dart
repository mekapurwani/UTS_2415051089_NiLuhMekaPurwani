import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseService {
  static const String supabaseUrl = 'https://psfnjxeiainbtugbvgtm.supabase.co';
  static const String supabaseKey = 'sb_publishable_hyqvpHGIfrRs-cnnIst6NA_PSl4ZcB5';

  static Future<void> initialize() async {
    await Supabase.initialize(
      url: supabaseUrl,
      publishableKey: supabaseKey, 
    );
  }
}