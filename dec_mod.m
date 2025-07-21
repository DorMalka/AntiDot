function friend = dec_mod(signature, publicKey, enc_message, hashValue)

    import java.security.*
    import java.util.Base64

    global pk_mem  % Ensure you're accessing the shared trusted registry

    % Step 1: Decrypt message
    try
        dec_message = secure_crypt(enc_message, 'decrypt');
    catch
        disp('AES decryption failed');
        friend = false;
        return;
    end

    % Step 2: Check public key trust
    target_encoded = string(Base64.getEncoder().encodeToString(publicKey.getEncoded()));
    trusted = false;
    for i = 1:length(pk_mem)
        encoded_i = string(Base64.getEncoder().encodeToString(pk_mem{i}.getEncoded()));
        if encoded_i == target_encoded
            trusted = true;
            break;
        end
    end

    if ~trusted
        disp('Untrusted public key');
        friend = false;
        return;
    end

    % Step 3: Signature verification
    try
        sig = Signature.getInstance('SHA256withRSA');
        sig.initVerify(publicKey);
        sig.update(dec_message);  % SHA-256 digest
        verified = sig.verify(signature);
    catch
        disp('Signature verification failed');
        friend = false;
        return;
    end

    if ~verified
        disp('Invalid signature');
        friend = false;
        return;
    end

    % Step 4: Nonce check
    expected_nonce = 10;
    if numel(dec_message) < 2
        disp('Decryption failed: too short');
        friend = false;
        return;
    end

    nonce_val = dec_message(2);
    friend = (nonce_val == expected_nonce);
end
