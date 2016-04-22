package edu.itis.webapp.dao.repository;

import edu.itis.webapp.dao.entities.Order;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service("orderService")
@Transactional
public class OrderService implements GenericService<Order> {

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public List<Order> getAll() {
        Session session = sessionFactory.getCurrentSession();

        session.beginTransaction();

        Query query = session.createQuery("FROM Order ");

        return query.list();
    }

    @Override
    public Order get(Long id) {
        Session session = sessionFactory.getCurrentSession();

        Order selectedOrder = session.get(Order.class, id);

        return selectedOrder;
    }

    @Override
    public void add(Order order) {
        Session session = sessionFactory.getCurrentSession();

        session.save(order);
    }

    @Override
    public void delete(Long id) {
        Session session = sessionFactory.getCurrentSession();

        Order deleteOrder = session.get(Order.class, id);

        session.delete(deleteOrder);
    }

    @Override
    public void update(Order order) {
        Session session = sessionFactory.getCurrentSession();

        Order updateOrder = session.get(Order.class, order.getId());

        updateOrder.setCustomerId(order.getCustomerId());
        updateOrder.setSalesPersonId(order.getSalesPersonId());

        session.save(updateOrder);
    }
}
