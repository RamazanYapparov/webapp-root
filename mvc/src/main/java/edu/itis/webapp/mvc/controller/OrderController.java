package edu.itis.webapp.mvc.controller;

import edu.itis.webapp.dao.entities.Order;
import edu.itis.webapp.dao.entities.User;
import edu.itis.webapp.dao.repository.GenericRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;

@Controller
public class OrderController {

    @Autowired
    private GenericRepository<Order> orderRepository;

    @Autowired
    private GenericRepository<User> userRepository;

    @RequestMapping(value = "/orderlist", method = RequestMethod.GET)
    public String orderlist(Model model) {
        List<Order> orderList = orderRepository.getAll();
        model.addAttribute("orderList", orderList);
        return "orderlist";
    }

    @RequestMapping(value = "/addorder", method = RequestMethod.GET)
    public String addorder(Model model) {
        model.addAttribute("order", new Order());
        List<User> userList = userRepository.getAll();
        model.addAttribute("userList", userList);
        return "orderinfo";
    }


}
