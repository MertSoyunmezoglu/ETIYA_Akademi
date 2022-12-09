package com.etiya.ecommercedemopair7.api.controllers;

import com.etiya.ecommercedemopair7.business.abstracts.IAddressService;
import com.etiya.ecommercedemopair7.business.constants.Paths;
import com.etiya.ecommercedemopair7.business.request.addresses.AddAddressRequest;
import com.etiya.ecommercedemopair7.business.response.addresses.AddAddressResponse;
import com.etiya.ecommercedemopair7.business.response.addresses.GetAddressResponse;
import com.etiya.ecommercedemopair7.business.response.addresses.GetAllAddressResponse;
import com.etiya.ecommercedemopair7.core.utilities.results.DataResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.List;

@RestController
@RequestMapping(Paths.apiPrefix + "addresses")
public class AddressesController {

    private IAddressService addressService;

    @Autowired
    public AddressesController(IAddressService addressService) {
        this.addressService = addressService;
    }

    @GetMapping
    public DataResult<List<GetAllAddressResponse>> getAll(){
        return addressService.getAll();
    }
    @GetMapping("/{id}")
    public DataResult<GetAddressResponse> getById(@PathVariable int id) {
        return addressService.getById(id);
    }

    @PostMapping("/add")
    public ResponseEntity<DataResult<AddAddressResponse>> add(@RequestBody @Valid AddAddressRequest addAddressRequest) {
        return new ResponseEntity<>(addressService.add(addAddressRequest), HttpStatus.CREATED);
    }
}
