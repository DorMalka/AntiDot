function out = secure_crypt(message, op)
    % op = 'encrypt' or 'decrypt'
    key = uint8([103, 19, 55, 202, 88, 41, 67, 199, 155, 47, 118, 24, 3, 201, 84, 231]);

    import java.security.*
    import javax.crypto.*
    import javax.crypto.spec.*
    
    cipher = Cipher.getInstance('AES');
    keySpec = SecretKeySpec(key, 'AES');
    
    if strcmp(op, 'encrypt')
        cipher.init(Cipher.ENCRYPT_MODE, keySpec);
        encrypted = cipher.doFinal(int8(message));
        out = int8(encrypted);
        
    elseif strcmp(op, 'decrypt')
        cipher.init(Cipher.DECRYPT_MODE, keySpec);
        decrypted = cipher.doFinal(int8(message));
        out = int8(decrypted);
        
    else
        error('Unknown operation.');
    end
end
