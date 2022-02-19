import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import '../screens/home_page.dart';

part 'router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: HomePage, initial: true),
  ],
)
// extend the generated private router
class Router extends _$Router {}
