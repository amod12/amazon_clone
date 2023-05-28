const mongoose = require('mongoose');

//structure how the user is gonna look like
const productSchema = mongoose.Schema({
    name: {
        require: true,
        type: String,
        trim: true,
    },
    description: {
        type: String,
        trim: true,
        required: true,
    },
    // array of images with properties
    images:[
         {
        type: String,
        required: true,
    }
    ],
    quantity: {
        type: Number, // or we can write Int32Array
        required: true,
    },
    price: {
        type: Number, // or we can write Int32Array
        required: true,
    },
    category:{
        type: String,
        required: true,
    },
    // userid store id of admin or the person who sold this product but in here only u are present so only 1 admin
});

const Product = mongoose.model('Product', productSchema);
module.exports = Product;