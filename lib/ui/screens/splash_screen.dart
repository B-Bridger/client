import 'package:flutter/material.dart';
import '../../utils/responsive_utils.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    
    _animationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    
    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));
    
    _animationController.forward();
    
    // 3초 후 홈 화면으로 이동
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        Navigator.of(context).pushReplacementNamed('/home');
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Center(
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.connect_without_contact,
                size: ResponsiveUtils.isMobile(context) ? 80 : 120,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
              SizedBox(height: ResponsiveUtils.getResponsivePadding(context)),
              Text(
                'Bridger',
                style: TextStyle(
                  fontSize: ResponsiveUtils.getResponsiveFontSize(context, 32),
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              ),
              SizedBox(height: ResponsiveUtils.getResponsivePadding(context) / 2),
              Text(
                'Cross-Platform Connection',
                style: TextStyle(
                  fontSize: ResponsiveUtils.getResponsiveFontSize(context, 16),
                  color: Theme.of(context).colorScheme.onPrimary.withOpacity(0.8),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
