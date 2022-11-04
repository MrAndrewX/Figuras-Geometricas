package com.liceu.geom.Services;

import com.liceu.geom.DAO.UserDAO;
import com.liceu.geom.DAO.db.UserDAODB;
import com.liceu.geom.model.User;

import java.util.List;

public class UserService {
    UserDAO userDAO = new UserDAODB();
    int lastID = 1;
    public void newUser(String name){
        User user = new User();

        user.setName(name);
        user.setId(lastID);

        userDAO.insert(user);
        lastID++;

    }


    public User getUserByName(String username) {
        User user = new User();
        for (User u: UserDAODB.userList){
            if (u.getName().equals(username)){
                user = u;
            }
        }
        return user;
    }
    public List<User> getListUsers(){
        return userDAO.getUserList();
    }
}
