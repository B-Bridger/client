class Constants {
  // App Information
  static const String appName = 'Bridger';
  static const String appVersion = '1.0.0';
  static const String appDescription = 'Cross-Platform Connection';

  // Responsive Breakpoints
  static const double mobileBreakpoint = 600;
  static const double tabletBreakpoint = 900;
  static const double desktopBreakpoint = 1200;

  // Animation Durations
  static const Duration shortAnimationDuration = Duration(milliseconds: 200);
  static const Duration mediumAnimationDuration = Duration(milliseconds: 400);
  static const Duration longAnimationDuration = Duration(milliseconds: 600);

  // Padding and Margins
  static const double smallPadding = 8.0;
  static const double mediumPadding = 16.0;
  static const double largePadding = 24.0;
  static const double extraLargePadding = 32.0;

  // Border Radius
  static const double smallBorderRadius = 4.0;
  static const double mediumBorderRadius = 8.0;
  static const double largeBorderRadius = 12.0;
  static const double extraLargeBorderRadius = 16.0;

  // Font Sizes
  static const double smallFontSize = 12.0;
  static const double mediumFontSize = 14.0;
  static const double largeFontSize = 16.0;
  static const double extraLargeFontSize = 18.0;
  static const double titleFontSize = 20.0;
  static const double headlineFontSize = 24.0;

  // Icon Sizes
  static const double smallIconSize = 16.0;
  static const double mediumIconSize = 24.0;
  static const double largeIconSize = 32.0;
  static const double extraLargeIconSize = 48.0;

  // Grid Properties
  static const int mobileGridColumns = 1;
  static const int tabletGridColumns = 2;
  static const int desktopGridColumns = 4;

  // Window Properties
  static const double minWindowWidth = 800;
  static const double minWindowHeight = 600;
  static const double defaultWindowWidth = 1200;
  static const double defaultWindowHeight = 800;

  // Network
  static const Duration networkTimeout = Duration(seconds: 30);
  static const Duration shortNetworkTimeout = Duration(seconds: 10);

  // User Messages
  static const String loadingMessage = 'Loading...';
  static const String noDataMessage = 'No data available';
  static const String errorMessage = 'Something went wrong';
  static const String networkErrorMessage = 'Network error occurred';
  static const String tryAgainMessage = 'Try again';
}

class AppStrings {
  // App
  static const String appTitle = 'Bridger';
  static const String appSubtitle = 'Cross-Platform Connection';

  // Navigation
  static const String home = 'Home';
  static const String back = 'Back';
  static const String close = 'Close';
  static const String cancel = 'Cancel';
  static const String ok = 'OK';
  static const String yes = 'Yes';
  static const String no = 'No';

  // Actions
  static const String add = 'Add';
  static const String edit = 'Edit';
  static const String delete = 'Delete';
  static const String save = 'Save';
  static const String refresh = 'Refresh';
  static const String retry = 'Retry';
  static const String search = 'Search';
  static const String filter = 'Filter';
  static const String sort = 'Sort';

  // User Management
  static const String users = 'Users';
  static const String addUser = 'Add User';
  static const String editUser = 'Edit User';
  static const String deleteUser = 'Delete User';
  static const String userDetails = 'User Details';
  static const String noUsers = 'No users found';
  static const String addFirstUser = 'Add your first user to get started';

  // Form Fields
  static const String name = 'Name';
  static const String email = 'Email';
  static const String id = 'ID';
  static const String avatar = 'Avatar';

  // Messages
  static const String loading = 'Loading...';
  static const String error = 'Error';
  static const String success = 'Success';
  static const String warning = 'Warning';
  static const String info = 'Info';

  // Confirmations
  static const String deleteConfirmation = 'Are you sure you want to delete this item?';
  static const String unsavedChanges = 'You have unsaved changes. Are you sure you want to leave?';

  // Errors
  static const String genericError = 'Something went wrong. Please try again.';
  static const String networkError = 'Network error. Please check your connection.';
  static const String validationError = 'Please check your input and try again.';
}
