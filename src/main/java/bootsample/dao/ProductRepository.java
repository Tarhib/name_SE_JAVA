package bootsample.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import bootsample.model.Product;

public interface ProductRepository  extends JpaRepository<Product, Integer> {

	List<Product>findTop5ByOrderByProfitDesc();
}
