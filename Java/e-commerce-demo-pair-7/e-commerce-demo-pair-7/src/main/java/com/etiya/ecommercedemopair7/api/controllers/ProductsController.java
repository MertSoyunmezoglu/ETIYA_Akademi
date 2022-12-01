package com.etiya.ecommercedemopair7.api.controllers;

import com.etiya.ecommercedemopair7.business.abstracts.ProductService;
import com.etiya.ecommercedemopair7.entities.concretes.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;


@RestController
@RequestMapping("/api/products")
public class ProductsController {

    @Autowired
    private ProductService productService;
    public ProductsController(ProductService productService) {
        this.productService = productService;
    }
    @GetMapping("/getAll")
    public List<Product> getAll(){
    return productService.getAll();

        }
    @GetMapping("{id}")
    public Product getById(@PathVariable int id){
        return  productService.getById(id);
    }

}
