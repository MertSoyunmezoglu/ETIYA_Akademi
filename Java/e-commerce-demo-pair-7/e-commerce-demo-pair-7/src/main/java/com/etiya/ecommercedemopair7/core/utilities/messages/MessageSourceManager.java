package com.etiya.ecommercedemopair7.core.utilities.messages;

import com.etiya.ecommercedemopair7.business.constants.Messages;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import java.util.Locale;

@Service
public class MessageSourceManager implements IMessageSourceService {

    private MessageSource messageSource;

    @Autowired
    public MessageSourceManager(MessageSource messageSource) {
        this.messageSource = messageSource;
    }

    @Override
    public String getMessage(String code) {
       return messageSource.getMessage(code, null, LocaleContextHolder.getLocale());

    }
}
