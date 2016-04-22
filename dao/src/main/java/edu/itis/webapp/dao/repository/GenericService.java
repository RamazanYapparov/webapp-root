package edu.itis.webapp.dao.repository;

import edu.itis.webapp.dao.entities.GenericEntity;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface GenericService<T extends GenericEntity> {

    List<T> getAll();

    T get(Long id);

    void add(T t);

    void delete(Long id);

    void update(T t);
}
