import 'package:flutter/material.dart';
import '../../utils/responsive_utils.dart';
import '../../utils/constants.dart';
import '../widgets/responsive_widgets.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _darkMode = false;
  bool _notifications = true;
  bool _animations = true;
  double _fontSize = 16.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Settings',
          style: TextStyle(
            fontSize: ResponsiveUtils.getResponsiveFontSize(context, 20),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ResponsiveContainer(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSectionHeader('Appearance'),
              _buildSettingsCard([
                _buildSwitchTile(
                  'Dark Mode',
                  'Enable dark theme',
                  Icons.dark_mode,
                  _darkMode,
                  (value) => setState(() => _darkMode = value),
                ),
                _buildSliderTile(
                  'Font Size',
                  'Adjust text size',
                  Icons.format_size,
                  _fontSize,
                  12.0,
                  24.0,
                  (value) => setState(() => _fontSize = value),
                ),
              ]),

              SizedBox(height: ResponsiveUtils.getResponsivePadding(context)),

              _buildSectionHeader('Preferences'),
              _buildSettingsCard([
                _buildSwitchTile(
                  'Notifications',
                  'Enable push notifications',
                  Icons.notifications,
                  _notifications,
                  (value) => setState(() => _notifications = value),
                ),
                _buildSwitchTile(
                  'Animations',
                  'Enable UI animations',
                  Icons.animation,
                  _animations,
                  (value) => setState(() => _animations = value),
                ),
              ]),

              SizedBox(height: ResponsiveUtils.getResponsivePadding(context)),

              _buildSectionHeader('About'),
              _buildSettingsCard([
                _buildInfoTile('Version', Constants.appVersion, Icons.info),
                _buildInfoTile('App Name', Constants.appName, Icons.apps),
                _buildActionTile(
                  'Reset Settings',
                  'Restore default settings',
                  Icons.restore,
                  _resetSettings,
                ),
              ]),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: ResponsiveUtils.getResponsivePadding(context),
        vertical: ResponsiveUtils.getResponsivePadding(context) / 2,
      ),
      child: Text(
        title,
        style: TextStyle(
          fontSize: ResponsiveUtils.getResponsiveFontSize(context, 18),
          fontWeight: FontWeight.w600,
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
    );
  }

  Widget _buildSettingsCard(List<Widget> children) {
    return Card(
      margin: EdgeInsets.symmetric(
        horizontal: ResponsiveUtils.getResponsivePadding(context),
        vertical: ResponsiveUtils.getResponsivePadding(context) / 4,
      ),
      child: Column(children: children),
    );
  }

  Widget _buildSwitchTile(
    String title,
    String subtitle,
    IconData icon,
    bool value,
    ValueChanged<bool> onChanged,
  ) {
    return SwitchListTile(
      title: Text(
        title,
        style: TextStyle(
          fontSize: ResponsiveUtils.getResponsiveFontSize(context, 16),
          fontWeight: FontWeight.w500,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(
          fontSize: ResponsiveUtils.getResponsiveFontSize(context, 14),
          color: Theme.of(context).textTheme.bodySmall?.color,
        ),
      ),
      secondary: Icon(icon, size: ResponsiveUtils.isMobile(context) ? 24 : 28),
      value: value,
      onChanged: onChanged,
    );
  }

  Widget _buildSliderTile(
    String title,
    String subtitle,
    IconData icon,
    double value,
    double min,
    double max,
    ValueChanged<double> onChanged,
  ) {
    return ListTile(
      leading: Icon(icon, size: ResponsiveUtils.isMobile(context) ? 24 : 28),
      title: Text(
        title,
        style: TextStyle(
          fontSize: ResponsiveUtils.getResponsiveFontSize(context, 16),
          fontWeight: FontWeight.w500,
        ),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            subtitle,
            style: TextStyle(
              fontSize: ResponsiveUtils.getResponsiveFontSize(context, 14),
              color: Theme.of(context).textTheme.bodySmall?.color,
            ),
          ),
          Slider(
            value: value,
            min: min,
            max: max,
            divisions: ((max - min) / 2).round(),
            label: value.round().toString(),
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }

  Widget _buildInfoTile(String title, String value, IconData icon) {
    return ListTile(
      leading: Icon(icon, size: ResponsiveUtils.isMobile(context) ? 24 : 28),
      title: Text(
        title,
        style: TextStyle(
          fontSize: ResponsiveUtils.getResponsiveFontSize(context, 16),
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: Text(
        value,
        style: TextStyle(
          fontSize: ResponsiveUtils.getResponsiveFontSize(context, 14),
          color: Theme.of(context).textTheme.bodySmall?.color,
        ),
      ),
    );
  }

  Widget _buildActionTile(
    String title,
    String subtitle,
    IconData icon,
    VoidCallback onTap,
  ) {
    return ListTile(
      leading: Icon(icon, size: ResponsiveUtils.isMobile(context) ? 24 : 28),
      title: Text(
        title,
        style: TextStyle(
          fontSize: ResponsiveUtils.getResponsiveFontSize(context, 16),
          fontWeight: FontWeight.w500,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(
          fontSize: ResponsiveUtils.getResponsiveFontSize(context, 14),
          color: Theme.of(context).textTheme.bodySmall?.color,
        ),
      ),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: onTap,
    );
  }

  void _resetSettings() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Reset Settings'),
        content: const Text(
          'Are you sure you want to reset all settings to default values?',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              setState(() {
                _darkMode = false;
                _notifications = true;
                _animations = true;
                _fontSize = 16.0;
              });
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Settings reset to default values'),
                ),
              );
            },
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: const Text('Reset'),
          ),
        ],
      ),
    );
  }
}
