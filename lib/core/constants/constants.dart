import 'package:flutter_dotenv/flutter_dotenv.dart';

final String newApiBaseUrl = dotenv.get('API_URL_BASE');

final String apiKey = dotenv.get('API_KEY');
const String countryQuery = 'us';
const String categoryQuery = 'general';