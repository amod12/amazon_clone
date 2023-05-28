const express = require('express');
const User = require('../models/user');
const bcryptjs = require('bcryptjs');
const jwt = require('jsonwebtoken');
const auth = require('../middleware/auth');
const authRouter = express.Router();

authRouter.post('/api/signup', async (req, res) => {
    try{
        const { name, email, password } = req.body;
        const existingUser = await User.findOne({ email });
        if (existingUser) {
            return res.status(400).json({msg: 'Already exists'}); 
        }
        const hashedPassword = await bcryptjs.hash(password,8);  

        let user =new User ({
            email,
            password: hashedPassword,
            name,
        });
        user = await user.save();
        // getting from user and user get from userschema
        res.json(user);
    }       
    catch(e){
        res.status(500).json({error: e.message});
        // returning error as json file
    }        
           
});

// signin route
authRouter.post('/api/signin', async (req, res) => {
    try{
        const {email, password } = req.body;
    // means const email = req.body.email;
    // const password = req.body.password;

        const user = await User.findOne({ email });
        if(!user){
            return res.status(400).json({ msg: 'No such eamil exists'});
        }

        const isMatch = await bcryptjs.compare(password, user.password);
        if (!isMatch){
            return res.status(400).json({ msg: 'Incorrect password'});
        }
        const token = jwt.sign({id: user._id}, 'passwordKey');
        res.json({token, ...user._doc});
       //  ...user._doc: here ... means destructuring and making a copy of user._doc
       // and token is added tn that copied ...user._doc
       
    }
    catch(e){
        res.status(500).json({error: e.message});
    }

});

// token is passed through header not body
authRouter.post('/tokenIsValid', async (req, res) => {
    try{
        const token = req.header('x-auth-token');
        if (!token) return res.json(false); 
        const verified = jwt.verify(token, 'passwordKey');
        if(!verified) return res.json(false);

        const user = User.findById(verified.id);
        if(!user) return res.json(false);
        res.json(true);
    }
    catch(e){
        res.status(500).json({error: e.message});
    }

});

// get user data
authRouter.get('/', auth, async (req, res) => {
    const user = await User.findById(req.user);
    res.json({ ...user._doc, token: req.token });  // only by adding this we can get user data
});// adding middleware as auth
// and both this and the above code does the same thing

module.exports = authRouter;