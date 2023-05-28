const mongoose = require('mongoose');

//structure how the user is gonna look like
const userSchema = mongoose.Schema({
    name: {
        require: true,
        type: String,
        trim: true,
        // trim means it makes '  amcj  ' to 'amcj' basically it removes unnecessary spaces
    },
    email: {
        type: String,
        trim: true,
        required: true,
        validate: {
            validator: (value) => {
                const re =/^(([^<>()[\]\.,;:\s@\"]+(\.[^<>()[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/i;
                return value.match(re);
            },
            message: 'Enter valid email' 
             // if value doesn't match error is returned and we will say mesg
        }
    },
    password: {
        type: String,
        required: true,
    },
    role: {
        type: String,
        default: 'user', // so everybody doesn't become admin
    },
    address:{
        type: String,
        default: '' // since not required
    },
    
});

const User = mongoose.model('User', userSchema);
module.exports = User;