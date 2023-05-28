const jwt = require('jsonwebtoken');
const User = require('../models/user');

//creating admin middleware
const admin = async (req, res, next) => {
    try{
        const token = req.header('x-auth-token');
        if (!token) return res.status(401).json({msg: "No auth token, acsess denied" });

        const verified = jwt.verify(token, 'passwordKey');
        if(!verified) return res.status(401).json({msg: 'Token verification failed, Authorization denied'});
        
        const user =await User.findById(verified.id);
        console.log("USER",user)
        if(user.role == 'user' || user.role == 'seller'){
            return res.status(401).json({msg: 'You not admin ' });
        }
        req.user = verified.id;
        req.token = token;
        next();
        
    }
    catch(err){
        return res.status(500).json({error: err.message });
    }
}
module.exports = admin;

// const jwt = require("jsonwebtoken");
// const User = require("../models/user");

// const admin = async (req, res, next) => {
//   try {
//     const token = req.header("x-auth-token");
//     if (!token)
//       return res.status(401).json({ msg: "No auth token, access denied" });

//     const verified = jwt.verify(token, "passwordKey");
//     if (!verified)
//       return res
//         .status(401)
//         .json({ msg: "Token verification failed, authorization denied." });
//     const user = await User.findById(verified.id);
//     if (user.type == "user" || user.type == "seller") {
//       return res.status(401).json({ msg: "You are not an admin!" });
//     }
//     req.user = verified.id;
//     req.token = token;
//     next();
//   } catch (err) {
//     res.status(500).json({ error: err.message });
//   }
// };

// module.exports = admin;
