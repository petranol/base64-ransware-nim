# base64-ransware-nim
a base 64 encoding and decoding ransomeware/software in the nim-lang

## to encrypt file
```shell
foo:~bar$ nim c -r enc.nim -e # --enc
```
## to decrypt file(with / without pass word)

```shell
foo:~bar$ nim c -r enc.nim -d # --dec or (-dp or -d -p)for pass word decryption(pass word is in .pass.key file) 
```
