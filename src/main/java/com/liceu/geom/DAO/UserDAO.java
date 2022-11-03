package com.liceu.geom.DAO;

import com.liceu.geom.model.User;

import java.util.List;

public interface UserDAO {
    boolean insert(User user);
    List<User> getUserList();
}
