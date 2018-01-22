package bootsample.controller;


import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import bootsample.model.Product;
import bootsample.service.ProductService;


@Controller
public class ProductController {
	
	@Autowired
	private ProductService productService;
	
	@GetMapping("/all-products")
	public String allProducts(HttpServletRequest request){
		request.setAttribute("products", productService.findAll());
		request.setAttribute("mode", "MODE_TASKS");
		return "index";
	}
	@GetMapping("/dashboard")
	public String topProducts(HttpServletRequest request){
		request.setAttribute("products", productService.findTop5());
		request.setAttribute("mode", "MODE_Dashboard");
		return "index";
	}
	
	@GetMapping("/new-product")
	public String newProduct(HttpServletRequest request){
		request.setAttribute("mode", "MODE_NEW");
		return "index";
	}
	
	@PostMapping("/save-product")
	public String saveProduct(@Valid @ModelAttribute Product product, BindingResult bindingResult, HttpServletRequest request){
		//task.setDateCreated(new Date());
			productService.save(product);
			request.setAttribute("products", productService.findAll());
			request.setAttribute("mode", "MODE_TASKS");
			return "redirect:/all-products";
		
		
	}
	
	@GetMapping("/update-product")
	public String updateProduct(@RequestParam int id, HttpServletRequest request){
		request.setAttribute("product", productService.findProduct(id));
		request.setAttribute("mode", "MODE_UPDATE");
		return "index";
	}
	
	@GetMapping("/delete-product")
	public String deleteProduct(@RequestParam int id, HttpServletRequest request){
		productService.delete(id);
		request.setAttribute("products", productService.findAll());
		request.setAttribute("mode", "MODE_TASKS");
		return "redirect:/all-products";
	}
}
