package edu.itis.webapp.dao.repository;

import edu.itis.webapp.dao.entities.User;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service("userRepository")
@Transactional
public class UserRepository implements GenericRepository<User> {

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public List<User> getAll() {
        Session session = sessionFactory.getCurrentSession();
        session.beginTransaction();

        Query query = session.createQuery("FROM User");

        return query.list();
    }

    @Override
    public User get(Long id) {
        Session session = sessionFactory.getCurrentSession();
        session.beginTransaction();

        User selectedUser = session.get(User.class, id);

        return selectedUser;
    }

    @Override
    public void add(User user) {
        Session session = sessionFactory.getCurrentSession();
        session.beginTransaction();
        session.save(user);
    }

    @Override
    public void delete(Long id) {
        Session session = sessionFactory.getCurrentSession();
        session.beginTransaction();

        User deleteUser = session.get(User.class, id);

        session.delete(deleteUser);
    }

    @Override
    public void update(User user) {
        Session session = sessionFactory.getCurrentSession();
        session.beginTransaction();

        User updateUser = session.get(User.class, user.getId());

        updateUser.setFirstname(user.getFirstname());
        updateUser.setLastname(user.getLastname());
        updateUser.setAge(user.getAge());

        session.save(updateUser);
    }
}
