/// A simple service locator using a Map to register and retrieve services.
/// For more robust solutions in larger applications, consider packages like `get_it`.

final Map<Type, dynamic> _services = {};

/// Registers a singleton instance of a service.
///
/// [T] is the type of the service.
/// [instance] is the actual object instance to register.
void registerSingleton<T>(T instance) {
  _services[T] = instance;
}

/// Retrieves a registered service instance.
///
/// [T] is the type of the service to retrieve.
T injection<T>() {
  if (!_services.containsKey(T)) {
    throw Exception(
      'Service of type $T not registered. Did you forget to call registerSingleton<${T.toString()}>()?',
    );
  }
  return _services[T] as T;
}
