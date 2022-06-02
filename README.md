# base64-ransware-nim
a base 64 encoding and decoding ransomeware/software in the nim-lang
## you will need 
* nim language compiler 
* git / github cli
* vm (it is recommended not needed because it is better not to run it on your local machine

## to encrypt file
```console
foo:~bar$ nim c -r enc.nim -e # --enc
```
## to decrypt file(with / without pass word)

```console
foo:~bar$ nim c -r enc.nim -d # --dec or (-dp or -d -p)for pass word decryption(pass word is in .pass.key file) 
```


### when using this software/ransome ware be carefull the creator will not take any responsibility
