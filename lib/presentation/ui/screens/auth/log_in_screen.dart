import 'package:flutter/material.dart';
import 'package:snap_share/presentation/ui/screens/auth/create_account_screen.dart';
import 'package:snap_share/presentation/ui/screens/auth/verify_log_in_screen.dart';
import 'package:snap_share/presentation/ui/utility/app_colors.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              const SizedBox(
                height: 300,
              ),
              Text("SociaLive",
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontSize: 30,
                      )),
              const SizedBox(
                height: 4,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CreateAccountScreen()));
                  },
                  child: const Text(
                    "Create Account",
                  ),
                ),
              ),
              const SizedBox(
                height: 2,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 85),
                child: ListTile(
                  trailing: const Icon(
                    Icons.keyboard_arrow_down,
                    color: AppColors.primaryColor,
                  ),
                  title: const Text(
                    "Log In",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryColor,
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const VerifyLogInScreen(),
                      ),
                    );
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
