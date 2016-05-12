package edu.itis.webapp.mvc.controller;

import edu.itis.webapp.dao.entities.Order;
import edu.itis.webapp.dao.entities.User;
import edu.itis.webapp.dao.repository.GenericService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.validation.Valid;
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
    public String addorder(@Valid Order order, BindingResult bindingResult, Model model) {
        if (bindingResult.hasErrors()) {
            List<User> userList = userService.getAll();
            model.addAttribute("userList", userList);
            return "orderinfo";
        } else {
            orderService.add(order);
            return "redirect:/orderlist";
        }
    }

    @RequestMapping(value = "/updateorder", method = RequestMethod.GET)
    public String updateorder(@RequestParam(name = "id") String id, Model model) {
        Order order = orderService.get(Long.valueOf(id));
        List<User> userList = userService.getAll();
        model.addAttribute("order", order);
        model.addAttribute("userList", userList);
        return "orderinfo";
    }

    @RequestMapping(value = "/updateorder", method = RequestMethod.POST)
    public String updateorder(@Valid Order order, BindingResult bindingResult, Model model) {
        if (bindingResult.hasErrors()) {
            List<User> userList = userService.getAll();
            model.addAttribute("userList", userList);
            return "orderinfo";
        } else {
            orderService.update(order);
            return "redirect:/orderlist";
        }
    }

    @RequestMapping(value = "/deleteorder", method = RequestMethod.POST)
    public String deleteorder(@RequestParam(name = "id") String id) {
        orderService.delete(Long.valueOf(id));
        return "redirect:/orderlist";
    }


}
