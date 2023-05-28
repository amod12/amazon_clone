const jwt = require('jsonwebtoken');
// making auth middleware
const auth = async (req, res, next) => {
    try{
        const token = req.header('x-auth-token');
        if (!token) return res.status(401).json({msg: "No auth token, acsess denied" });

        const verified = jwt.verify(token, 'passwordKey');
        if(!verified) return res.status(401).json({msg: 'Token verification failed, Authorization denied'});

        req.user = verified.id;
        req.token = token;
        next(); //if not specified will not go to nextroute
    }
    catch(err){
        return res.status(500).json({error: err.message });
    }
}

module.exports = auth;