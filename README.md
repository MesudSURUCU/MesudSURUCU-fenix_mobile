# Fenix Mobile - Movie App

This application lists trending movies, allows you to search between movies (2 characters or more searches need to be done), shows the details of movies and can be added and removed to the favorite list of liked movies. (Adding and subtractions are done locally, not by service.)

# Architectural structure of the project (Clean architecture and MVVM are used) 
lib/
├── core/
│   └── constants/ 
|   └── network/
├── data/
│   └── datasources/
│   └── models/
|   └── repositories/
├── domain/
│   └── entities/
│   └── repositories/
|   └── usecases/
├── presentation/
│   └── favorites/
│   └── home/
|       └── home_screen.dart
|       └── home_state.dart
|       └── home_view_model.dart
│   └── main/
|   └── movie_detail/
|   └── widgets/
├── routes/
│   └── app_router.dart    
├── main.dart

# Packages and functions used

- flutter_riverpod
Status managements in the project were used for operations.

- go_router
Used for page redirects operations in the project.

- dio
Used for API calls.

- hive, hive_flutter
Used so that favorite movies could be stored in a local database.

- path_provider
Used for access to file paths on the device. (for hive box)

- retrofit, retrofit_generator
Used for Type_safe API calls and code generator.

- json_serializable, json_annotation
JSON automatic converter used for code generation.
Used for JSON serialization infrastructure for model classes.

- build_runner
CLI tool for code generation operations.

- flutter_screenutil
Used for responsive design.

- flutter_native_splash
Used to customize the splash screen at application launch.




