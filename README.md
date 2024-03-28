##  Exercise 6

### Name: Eric Conrad V. Panga III
### Student Number: 2021-06123
### Section: CMSC 23 UV1L

### Application Description:
- implemented the checkout feature of the sample state management app from the laboratory handout

### Things you Did in the Code:
- created model, provider, and screen directories
- created a MyCatalog screen which outputs a list of products, as well as add buttons which adds the item to the user's shopping cart
- created a MyCart screen which outputs the contents of the shopping cart that was updated from the user's catalog, as well as a checkout button which routes to the checkout page when clicked
- created a Checkout screen which also outputs the contents of the shopping cart, as well as a pay now button which resets the total cost to zero when clicked and reroutes back to the user's catalog
- created an Item object which contains the contents/attributes of an item from the shop
- created a shoppping cart provider which contains all the necessary functions for the shopping cart, including adding items, removing items, or removing all items

### Challenges when Developing the Application:
- had slight difficulty in implementing conditional rendering of screens, i.e. what to output depending on the contents of the shopping cart