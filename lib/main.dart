import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp_bloc/config/themes/app_themes.dart';
import 'package:newsapp_bloc/features/daily_news/representation/bloc/article/remote/remote_article_bloc.dart';
import 'package:newsapp_bloc/features/daily_news/representation/bloc/article/remote/remote_article_event.dart';
import 'package:newsapp_bloc/features/daily_news/representation/pages/home/daily_news.dart';
import 'package:newsapp_bloc/insection_container.dart';

Future<void> main() async {
  await initializedDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RemoteArticlesBloc>(
      create: (context) => sl()..add(const GetArticles()),
      child: MaterialApp(
        title: 'Daily News',
        debugShowCheckedModeBanner: false,
        theme: theme(),
        home: const DailyNews(),
      ),
    );
  }
}
