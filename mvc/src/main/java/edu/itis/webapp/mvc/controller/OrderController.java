package edu.itis.webapp.mvc.controller;

import edu.itis.webapp.dao.entities.Order;
import edu.itis.webapp.dao.entities.User;
import edu.itis.webapp.dao.repository.GenericService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;

@Controller
public class OrderController {

    @Autowired
    private GenericService<Order> orderService;

    @Autowired
    private GenericService<User> userService;

    @RequestMapping(value = "/orderlist", method = RequestMethod.GET)
    public String orderlist(Model model) {
        List<Order> orderList = orderService.getAll();
        model.addAttribute("orderList", orderList);
        return "orderlist";
    }

    @RequestMapping(value = "/addorder", method = RequestMethod.GET)
    public String addorder(Model model) {
        model.addAttribute("order", new Order());

        List<User> userList = userService.getAll();
        model.addAttribute("userList", userList);
        return "orderinfo";
    }

    @RequestMapping(value = "/addorder", method = RequestMethod.POST)
    public String addorder(Order order) {
        orderService.add(order);
        return "redirect:/orderlist";
    }


}
