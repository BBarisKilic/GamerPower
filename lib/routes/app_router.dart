import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import '../models/data_model.dart';
import '../screens/details_page.dart';
import '../screens/home_page.dart';

part 'app_router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: HomePage, initial: true),
    AutoRoute(page: DetailsPage)
  ],
)
// extend the generated private router
class AppRouter extends _$AppRouter {}
