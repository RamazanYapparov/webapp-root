package edu.itis.webapp.dao.repository;

import edu.itis.webapp.dao.entities.GenericEntity;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public interface GenericService<T extends GenericEntity> {

    @Transactional
    List<T> getAll();

    @Transactional
    T get(Long id);

    @Transactional
    void add(T t);

    @Transactional
    void delete(Long id);

    @Transactional
    void update(T t);
}
