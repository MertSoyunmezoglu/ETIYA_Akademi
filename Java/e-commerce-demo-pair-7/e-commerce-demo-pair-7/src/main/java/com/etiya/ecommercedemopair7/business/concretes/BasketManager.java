package com.etiya.ecommercedemopair7.business.concretes;

import com.etiya.ecommercedemopair7.business.abstracts.IBasketService;
import com.etiya.ecommercedemopair7.business.abstracts.ICustomerService;
import com.etiya.ecommercedemopair7.business.constants.Messages;
import com.etiya.ecommercedemopair7.business.request.baskets.AddBasketRequest;
import com.etiya.ecommercedemopair7.business.response.baskets.AddBasketResponse;
import com.etiya.ecommercedemopair7.business.response.baskets.GetAllBasketResponse;
import com.etiya.ecommercedemopair7.core.utilities.exceptions.BusinessException;
import com.etiya.ecommercedemopair7.core.utilities.mapping.IModelMapperService;
import com.etiya.ecommercedemopair7.core.utilities.messages.IMessageSourceService;
import com.etiya.ecommercedemopair7.core.utilities.results.DataResult;
import com.etiya.ecommercedemopair7.core.utilities.results.SuccessDataResult;
import com.etiya.ecommercedemopair7.entities.concretes.Basket;
import com.etiya.ecommercedemopair7.entities.concretes.Customer;
import com.etiya.ecommercedemopair7.repository.abstracts.IBasketRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class BasketManager implements IBasketService {
    private IBasketRepository basketRepository;
    private ICustomerService customerService;
    private IModelMapperService mapper;
    private IMessageSourceService messageSource;

    @Autowired
    public BasketManager(IBasketRepository basketRepository, ICustomerService customerService,
                         IModelMapperService mapper, IMessageSourceService messageSource) {
        this.basketRepository = basketRepository;
        this.customerService = customerService;
        this.mapper = mapper;
        this.messageSource=messageSource;
    }

    @Override
    public DataResult<List<GetAllBasketResponse>> getAll() {
        List<Basket> baskets = basketRepository.findAll();
        List<GetAllBasketResponse> response = baskets.stream()
                .map(basket -> mapper.forResponse().map(basket, GetAllBasketResponse.class))
                .collect(Collectors.toList());
        return new SuccessDataResult<>(response, messageSource.getMessage(Messages.Basket.basketsListed));
    }

    @Override
    public DataResult<Basket> getById(int basketId) {
        return new SuccessDataResult<>(checkIfBasketExistsById(basketId), messageSource.getMessage(Messages.Basket.basketReceived));
    }

    @Override
    public DataResult<AddBasketResponse> add(AddBasketRequest addBasketRequest) {

        getCustomer(addBasketRequest);

        Basket basket = mapper.forRequest().map(addBasketRequest, Basket.class);

        Basket savedBasket = basketRepository.save(basket);

        AddBasketResponse response = mapper.forResponse().map(savedBasket, AddBasketResponse.class);

        return new SuccessDataResult<>(response, messageSource.getMessage(Messages.Basket.basketReceived));
    }

    private DataResult<Customer> getCustomer(AddBasketRequest addBasketRequest) {
        DataResult<Customer> customer = customerService.getByCustomerId(addBasketRequest.getCustomerId());
        return customer;
    }

    private Basket checkIfBasketExistsById(int basketId) {
        Basket currentBasket;
        try {
            currentBasket = this.basketRepository.findById(basketId).get();
        } catch (Exception e) {
            throw new BusinessException(messageSource.getMessage(Messages.Basket.basketNotFound));
        }
        return currentBasket;
    }
}

