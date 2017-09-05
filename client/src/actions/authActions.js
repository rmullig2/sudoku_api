export const LOGIN = 'LOGIN';
export const LOGOUT = 'LOGOUT';
export const SIGNUP = 'SIGNUP';

export const login = (username, password) => {
    return {
        type: LOGIN,
        username: username,
        password: password
    };
};
 
export const logout = () => {
    return {
        type: 'LOGOUT'
    };
};
 
export const signup = (username, password) => {	
    return (dispatch) => {
    };
};
