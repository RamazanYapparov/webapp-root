package edu.itis.webapp.mvc.controller;

import edu.itis.webapp.dao.entities.Order;
import edu.itis.webapp.dao.entities.User;
import edu.itis.webapp.dao.repository.GenericRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import javax.validation.Valid;
import java.util.List;

@Controller
public class UserController {

    @Autowired//@Resource(name = "userRepository")
            GenericRepository<User> userRepository;

    @Autowired//@Resource(name = "orderRepository")
            GenericRepository<Order> orderRepository;

    @RequestMapping(value = "/")
    public String welcome() {
        return "redirect:/userlist";
    }

    @RequestMapping(value = "/userlist", method = RequestMethod.GET)
    public String userlist(Model model) {
        List userList = userRepository.getAll();
        model.addAttribute("userList", userList);
        return "userlist";
    }

    @RequestMapping(value = "/adduser", method = RequestMethod.GET)
    public String adduser(Model model) {
        model.addAttribute("user", new User());
        return "userinfo";
    }

    @RequestMapping(value = "/adduser", method = RequestMethod.POST)
    public String adduser(@Valid User user, BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            return "userinfo";
        } else {
            userRepository.add(user);
            return "redirect:/userlist";
        }
    }

    @RequestMapping(value = "/userdelete", method = RequestMethod.GET)
    public String userdelete(@RequestParam(name = "id") String id) {
        userRepository.delete(Long.valueOf(id));
        return "redirect:/userlist";
    }

    @RequestMapping(value = "/userupdate", method = RequestMethod.GET)
    public String userupdate(@RequestParam(name = "id") String id, Model model) {
        User user = userRepository.get(Long.valueOf(id));
        model.addAttribute("user", user);
        return "userinfo";
    }

    @RequestMapping(value = "/userupdate", method = RequestMethod.POST)
    public String userupdate(@Valid User user, BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            return "userupdate";
        } else {
            userRepository.update(user);
            return "redirect:/userlist";
        }
    }

}
