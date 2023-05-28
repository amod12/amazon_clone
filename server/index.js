const express = require('express');
const mongoose = require('mongoose');
const adminRouter = require('./route/admin');
const authRouter = require('./route/auth');

const PORT = 3000;
const app = express();
const mongoDB = 'mongodb+srv://amod:agumon66@cluster0.y1z4dxl.mongodb.net/?retryWrites=true&w=majority';

// middleware
app.use(express.json());
app.use(authRouter);
app.use(adminRouter);


mongoose
.connect(mongoDB)
.then(() => {
    console.log('connected');
})
.catch((e) => {
    console.log(e);
}); 


app.listen(PORT,'0.0.0.0', () => {
    console.log("connected at port "+ PORT);
});