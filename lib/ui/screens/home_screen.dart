import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/user_provider.dart';
import '../../utils/responsive_utils.dart';
import '../widgets/responsive_widgets.dart';
import '../widgets/user_card.dart';
import 'settings_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<UserProvider>().loadUsers();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Bridger',
          style: TextStyle(
            fontSize: ResponsiveUtils.getResponsiveFontSize(context, 20),
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => context.read<UserProvider>().loadUsers(),
          ),
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => _showAddUserDialog(context),
          ),
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const SettingsScreen(),
              ),
            ),
          ),
        ],
      ),
      body: ResponsiveContainer(
        child: Consumer<UserProvider>(
          builder: (context, userProvider, child) {
            if (userProvider.isLoading && userProvider.users.isEmpty) {
              return const Center(child: CircularProgressIndicator());
            }

            if (userProvider.error != null) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.error_outline,
                      size: 64,
                      color: Theme.of(context).colorScheme.error,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Error: ${userProvider.error}',
                      style: TextStyle(
                        fontSize: ResponsiveUtils.getResponsiveFontSize(context, 16),
                        color: Theme.of(context).colorScheme.error,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        userProvider.clearError();
                        userProvider.loadUsers();
                      },
                      child: const Text('Retry'),
                    ),
                  ],
                ),
              );
            }

            if (userProvider.users.isEmpty) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.people_outline,
                      size: 64,
                      color: Theme.of(context).colorScheme.onSurface.withOpacity(0.5),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'No users found',
                      style: TextStyle(
                        fontSize: ResponsiveUtils.getResponsiveFontSize(context, 18),
                        color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Add your first user to get started',
                      style: TextStyle(
                        fontSize: ResponsiveUtils.getResponsiveFontSize(context, 14),
                        color: Theme.of(context).colorScheme.onSurface.withOpacity(0.5),
                      ),
                    ),
                  ],
                ),
              );
            }

            return ResponsiveLayout(
              mobile: _buildMobileLayout(userProvider),
              tablet: _buildTabletLayout(userProvider),
              desktop: _buildDesktopLayout(userProvider),
            );
          },
        ),
      ),
    );
  }

  Widget _buildMobileLayout(UserProvider userProvider) {
    return ListView.builder(
      padding: EdgeInsets.all(ResponsiveUtils.getResponsivePadding(context)),
      itemCount: userProvider.users.length,
      itemBuilder: (context, index) {
        final user = userProvider.users[index];
        return UserCard(
          user: user,
          onTap: () => _showUserDetails(user),
          onEdit: () => _showEditUserDialog(context, user),
          onDelete: () => _showDeleteConfirmation(context, user),
        );
      },
    );
  }

  Widget _buildTabletLayout(UserProvider userProvider) {
    return GridView.builder(
      padding: EdgeInsets.all(ResponsiveUtils.getResponsivePadding(context)),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: ResponsiveUtils.getCrossAxisCount(context),
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 4,
      ),
      itemCount: userProvider.users.length,
      itemBuilder: (context, index) {
        final user = userProvider.users[index];
        return UserCard(
          user: user,
          onTap: () => _showUserDetails(user),
          onEdit: () => _showEditUserDialog(context, user),
          onDelete: () => _showDeleteConfirmation(context, user),
        );
      },
    );
  }

  Widget _buildDesktopLayout(UserProvider userProvider) {
    return GridView.builder(
      padding: EdgeInsets.all(ResponsiveUtils.getResponsivePadding(context)),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: ResponsiveUtils.getCrossAxisCount(context),
        crossAxisSpacing: 24,
        mainAxisSpacing: 24,
        childAspectRatio: 4.5,
      ),
      itemCount: userProvider.users.length,
      itemBuilder: (context, index) {
        final user = userProvider.users[index];
        return UserCard(
          user: user,
          onTap: () => _showUserDetails(user),
          onEdit: () => _showEditUserDialog(context, user),
          onDelete: () => _showDeleteConfirmation(context, user),
        );
      },
    );
  }

  void _showUserDetails(user) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(user.name),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Email: ${user.email}'),
            Text('ID: ${user.id}'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  void _showAddUserDialog(BuildContext context) {
    // TODO: Implement add user dialog
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Add user feature will be implemented')),
    );
  }

  void _showEditUserDialog(BuildContext context, user) {
    // TODO: Implement edit user dialog
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Edit ${user.name} feature will be implemented')),
    );
  }

  void _showDeleteConfirmation(BuildContext context, user) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete User'),
        content: Text('Are you sure you want to delete ${user.name}?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              context.read<UserProvider>().deleteUser(user.id);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('${user.name} deleted')),
              );
            },
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }
}
