key = uint8([103, 19, 55, 202, 88, 41, 67, 199, ...
             155, 47, 118, 24, 3, 201, 84, 231]);

message = uint8([54, 10, zeros(1, 14)]);  % 16 bytes

import javax.crypto.*
import javax.crypto.spec.*

cipher = Cipher.getInstance('AES');
keySpec = SecretKeySpec(key, 'AES');

cipher.init(Cipher.ENCRYPT_MODE, keySpec);
ciphertext = cipher.doFinal(message);  % Should be 32 bytes

cipher.init(Cipher.DECRYPT_MODE, keySpec);
plaintext = cipher.doFinal(ciphertext);  % Should return the original 16-byte message

disp('Decrypted:');
disp(plaintext');