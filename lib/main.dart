import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:imdb_clone/app/imdb_clone_app.dart';
import 'package:imdb_clone/core/di/di_container.dart';
import 'package:imdb_localization/strings.g.dart'; // важно!
import 'package:slang_flutter/slang_flutter.dart';

// import 'package:imdb_localization/strings.g.dart';


// void main() async {
//   await dotenv.load(fileName: ".env");
//   WidgetsFlutterBinding.ensureInitialized();
//   await Hive.initFlutter();
//   await initDi();
//   runApp(
//     TranslationProvider(
//       child: const IMDBCloneApp(),
//     ),
//   );
// }

void main() async {
  // Загружаем .env файл с API ключами
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  
  // Получаем ключ из .env
  final apiKey = dotenv.env['TMDB_API_KEY'];
  print("TMDB API Key: $apiKey"); // Проверяем, что ключ загружен

  // Инициализация Flutter и Hive
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await initDi();

  // Запуск приложения
  runApp(
    TranslationProvider(
      child: const IMDBCloneApp(),
    ),
  );
}