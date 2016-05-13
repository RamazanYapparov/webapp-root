package edu.itis.webapp.mvc.validator;

import edu.itis.webapp.dao.entities.User;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

public class NumberValidator implements Validator {
    @Override
    public boolean supports(Class<?> clazz) {
        return User.class.equals(clazz);
    }

    @Override
    public void validate(Object target, Errors errors) {
        User user = (User) target;
        if (errors.hasFieldErrors("age"))
        if (user.getAge() == null)
//            if (IsNumberUtil.isNumber(user.getAge()))
                errors.rejectValue("age", "error");
    }
}
