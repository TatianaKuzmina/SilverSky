package com.example.silversky.repositories;

import com.example.silversky.models.Order;
import com.example.silversky.models.Person;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface OrderRepository extends JpaRepository<Order, Integer> {
    List<Order> findByPerson(Person person);
    // Поиск заказа по последним 4 символам в номере заказа
    @Query(value = "select * from orders where number like %?1", nativeQuery = true)
    List<Order> findOrderByPartOfNumber(String number);
}
