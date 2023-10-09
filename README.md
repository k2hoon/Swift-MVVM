# Swift-MVVM

Swift-MVVM concept is inspired by ViewModel from Android Architecture components.

- ViewModel class is created and returned by a factory(implementation of ViewModelFactory protocol).
- instantiated View Model is passed to the View(ie. UIViewController).
- View Model is managed by the context(UIViewController) provided to the view provider.

The API used for testing uses https://jsonplaceholder.typicode.com/.
