clc;
clear;
close all;

% Global trusted key registry
global pk_mem
pk_mem = {};

% === Sender Side ===
id = 54;
[signature, publicKey, enc_message, hashValue] = enc_mod(id);

% Register the sender's public key as trusted
pk_mem{end+1} = publicKey;

friend = dec_mod(signature, publicKey, enc_message, hashValue);
disp(['Is sender a friend? ', mat2str(friend)]);