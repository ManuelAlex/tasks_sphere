import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_sphere/src/entities/app/app_barrel.dart';

part 'custom/task_sphere_wrapper.dart';

class TaskSphereApp extends StatelessWidget {
  const TaskSphereApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return TaskSphereWrapper(
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.light,
        color: AppColors.orange,
        builder: (context, child) => ScreenUtilInit(
          designSize: const Size(390, 844),
          splitScreenMode: true,
          useInheritedMediaQuery: true,
          builder: (context, child) => MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaler: const TextScaler.linear(1)),
            child: Theme(
              data: AppTheme.light,
              child: child!,
            ),
          ),
          child: child,
        ),
        routerConfig: AppRouter.routerConfig,
      ),
    );
  }
}
