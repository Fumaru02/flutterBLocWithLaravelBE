import 'package:bloc_flutter/common/routes/names.dart';
import 'package:bloc_flutter/common/values/constant.dart';
import 'package:bloc_flutter/pages/application/bloc/app_blocs.dart';
import 'package:bloc_flutter/pages/application/bloc/app_events.dart';
import 'package:bloc_flutter/pages/profile/settings/bloc/settings_blocs.dart';
import 'package:bloc_flutter/pages/profile/settings/widgets/settings_widgets.dart';
import 'package:bloc_flutter/pages/profile/widgets/profile_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../global.dart';
import 'bloc/setting_states.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  void removeUserData() {
    context.read<AppBlocs>().add(const TriggerAppEvent(0));
    Global.storageService.remove(AppConstants.STORAGE_USER_TOKEN_KEY);
    Navigator.of(context)
        .pushNamedAndRemoveUntil(AppRoutes.SIGN_IN, (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppbarSettings(),
      body: SingleChildScrollView(
        child: BlocBuilder<SettingsBlocs, SettingsStates>(
          builder: (context, state) {
            return Container(
              child: Column(
                children: [settingsButton(context, removeUserData)],
              ),
            );
          },
        ),
      ),
    );
  }
}
