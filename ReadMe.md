# Loblaw iOS Challenge

## Two main entities of the project

1. Product List - The main screen that lists various products from API.
2. Product Details - Showing the details of the product.

Loblaw's iOS Challenge is following MVVM architecture.

## Installation

Need to install cocoa pods 

```bash
pod install
```

## Directories and Files description
### Global files
1.**Enums** - Storing static keywords, strings, IDs which helps to write code on separate files.

2.**Network/API** - Handles  network calls
 
* **ProductAPI.swift** - Responsible to get the list of products using **cart** endpoint.
### Scenes

### Product List
1. **ViewModel** - Business logic implemented here, connecting backend and 'View Controller' using adapter.
2. **Adapter** - Handles tableview's delegate and data source, confirms 'ProductListProtocol'
3. **Protocol** - Defines set of operations 'View Controller' needs to handle.
 4. **Model** - Defines API response as ProductList structure to handle product details.
 5. **View** - Connects to UI and responsible to show data on phone, confirms ProductList Protocol. While loading display data using a view model and updates the tableview.

### Product Details
1. **View** - Simply showing product details on the screen, which is selected from the previous view(ProductList).

### Future implementation

* App should look for the Internet connectivity and notify the user if not available.
* Lazy loading or Pagination needs to integrate to handle more data.
* Table view can be animated and show the loading indicator.
* Label text needs more constraints according to UI design.

### Screenshots
* Product List

![image](https://github.com/harshbshah/Loblaw-Challenge/raw/main/Screenshots/Product_List.png)

* Product details

![image](https://github.com/harshbshah/Loblaw-Challenge/raw/main/Screenshots/Product_Details.png)

## License
[MIT](https://choosealicense.com/licenses/mit/)
