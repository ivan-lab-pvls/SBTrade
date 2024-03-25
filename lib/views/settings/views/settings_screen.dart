import 'package:flutter/material.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:share_plus/share_plus.dart';
import 'package:trader_simulator/consts/app_text_styles/synopsis_text_style.dart';
import '../../../consts/app_colors.dart';
import '../../app/views/my_in_app_web_view.dart';
import '../widgets/settings_widget.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: AppColors.blackColor,
      ),
      body: Container(
        color: AppColors.blackColor,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: size.height * 0.12,
              ),
              Text(
                'Settings',
                style: SynopsisTextStyle.screenTitle,
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              SettingsTile(
                text: 'Terms of use',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MyScreenForVIew(
                          url:
                              'https://docs.google.com/document/d/1-TWhW5lKuMy8FxCS2ivBc2Y-yv_L-QSOK-zQZdj5CXo/edit?usp=sharing'),
                    ),
                  );
                },
                assetName: 'assets/icons/terms.svg',
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              SettingsTile(
                  text: 'Privacy Policy',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MyScreenForVIew(
                            url:
                                'https://docs.google.com/document/d/1DOZsgrjscTiaZvXIirs_VVzwoViArMbkzxPKDeOLS74/edit?usp=sharing'),
                      ),
                    );
                  },
                  assetName: 'assets/icons/privacy.svg'),
              SizedBox(
                height: size.height * 0.01,
              ),
              SettingsTile(
                  text: 'Share with friends',
                  onTap: () {
                    Share.share(
                        'Check out the Best Trading Simulator - SBTrade!');
                  },
                  assetName: 'assets/icons/share.svg'),
              SizedBox(
                height: size.height * 0.01,
              ),
              SettingsTile(
                  text: 'Rate app',
                  onTap: () {
                    InAppReview.instance
                        .openStoreListing(appStoreId: '6479981514');
                  },
                  assetName: 'assets/icons/rate.svg'),
            ],
          ),
        ),
      ),
    );
  }
}
