# Loblaw iOS Challenge

## Installation

Need to install cocoa pods 

```bash
pod install
```

## Two main entities of the project

1. Product List - Main screen listing product list from API.
2. Product Details - Showing the details of the image.
Loblaw's iOS Challenge is follwing MVVM architecture.
## Directories and Files Description
### Global Files
1.**Enums** - Storing static keywords, strings, IDs which helps to write code on separate files.

2.**Netowrk/API** - handles  Network calls
 
* **ProductAPI.swift** - Responsible to get the list of products using **cart** endpoint.
### Scenes

### Product List
1. **ViewModel** - Business logic implemented here, connecting backend and View Controller using Adapter.
2. **Adapter** - handles table view delegate and data source, confirms ProductList Protocol, and linked actions to the view controller.
3. **Protocol** - defines set of operations View Controller needs to handle.
 4. **Model** - Defines API response as ProductList structure to handle product details.
 5. **View** - connects to UI and responsible to show data on phone, confirms ProductList Protocol. at loading loads data using a view model and updates the table view.

### Product Details
1. **View** - Simply showing product details on view, which it gets from the previous view.

### Future implementation

* look for the internet connection and show the appropriate message.
* Animate the table view to show the loading indicator.
* adjust Label text according to UI design.



## License
[MIT](https://choosealicense.com/licenses/mit/)
