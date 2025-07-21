function [signature, publicKey, enc_message, hashValue] = enc_mod(id)
    import java.security.*
    nonce = 10;
    concat = uint8([id,nonce, zeros(1, 14)]);

    enc_message = secure_crypt(concat, 'encrypt');
    
    md = java.security.MessageDigest.getInstance('SHA-256');
    md.update(uint8(concat));
    digest = md.digest();  % Java byte[]
    hashValue = typecast(digest, 'uint8');  % Convert to MATLAB uint8

    % Generate RSA key pair
    keyGen = KeyPairGenerator.getInstance('RSA');
    keyGen.initialize(2048);  % 2048-bit RSA
    keyPair = keyGen.generateKeyPair();
    
    privateKey = keyPair.getPrivate();
    publicKey = keyPair.getPublic();
    
    sig = java.security.Signature.getInstance('SHA256withRSA');
    sig.initSign(privateKey);
    sig.update(concat);
    signature = sig.sign(); 
end