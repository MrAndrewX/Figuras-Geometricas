package com.liceu.geom.DAO.db;

import com.liceu.geom.DAO.UserDAO;
import com.liceu.geom.model.User;

import java.util.ArrayList;
import java.util.List;

public class UserDAODB implements UserDAO {
    public static List<User> userList = new ArrayList<>();
    @Override
    public boolean insert(User user) {
        if (userList.contains(user)){
            return false;
        }
        userList.add(user);
        return true;
    }

    @Override
    public List<User> getUserList() {
        return userList;
    }
}
