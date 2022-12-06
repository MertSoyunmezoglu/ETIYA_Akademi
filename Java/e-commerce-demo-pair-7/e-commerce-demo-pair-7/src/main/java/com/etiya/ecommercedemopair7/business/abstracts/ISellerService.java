package com.etiya.ecommercedemopair7.business.abstracts;

import com.etiya.ecommercedemopair7.business.request.sellers.AddSellerRequest;
import com.etiya.ecommercedemopair7.business.response.sellers.AddSellerResponse;
import com.etiya.ecommercedemopair7.entities.concretes.Seller;

public interface ISellerService {
    Seller getById(int sellerId);
    AddSellerResponse add(AddSellerRequest addSellerRequest);
}