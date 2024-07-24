import 'package:form_task/core/utiles/routes.dart';
import 'package:form_task/features/authentication/screens/login_screen.dart';
import 'package:go_router/go_router.dart';

import '../../features/authentication/screens/register_screen.dart';
import '../../features/form_screen/screens/form_screen.dart';

class AppRouter {
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => LoginScreen(),
      ),
      GoRoute(
        path: Routes.kRegisterScreen,
        builder: (context, state) => RegisterScreen(),
      ),
      GoRoute(
        path: Routes.kFormScreen,
        builder: (context, state) => FormScreen(),
      ),

    ],
  );
}