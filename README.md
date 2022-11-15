# magic_workout

A starting point for creating robust, highly scalable and testable flutter apps.

## Architecture

Implemented Clean Architecture with Bloc.

![image](https://user-images.githubusercontent.com/25193983/112195232-b8665d80-8c2f-11eb-83cb-e362b8bff420.png)

## Third party packges used
`flutter_bloc` for State Management
`flutter_hooks` for Lifecycle Management and avoiding Statefull Widget
`objectbox` for Local Storage
`equatable` for Data Class support
`get_it` for dependency injection
`form_field_validator` for validating form fileds 
`bloc_test` and `mockito` for testing 


# How to run

run `flutter pub get`
run `flutter pub run build_runner build --delete-conflicting-outputs`

`flutter run`
