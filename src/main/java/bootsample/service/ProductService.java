package bootsample.service;

import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import bootsample.dao.ProductRepository;
import bootsample.model.Product;

@Service
@Transactional
public class ProductService {

	private final ProductRepository productRepository;

	public ProductService(ProductRepository productRepository) {
		this.productRepository = productRepository;
	}
	
	public List<Product> findAll(){
		List<Product> products = new ArrayList<>();
		for(Product product : productRepository.findAll()){
			products.add(product);
		}
		return products;
	}
	public List<Product> findTop5(){
		List<Product>top_products=new ArrayList<>();
		top_products=productRepository.findTop5ByOrderByProfitDesc();
		return top_products;
		}
	public Product findProduct(int id){
		return productRepository.findOne(id);
	}
	
	public void save(Product product){
		productRepository.save(product);
	}
	
	public void delete(int id){
		productRepository.delete(id);
	}
}
