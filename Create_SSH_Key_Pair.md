# Create an SSH Key Pair
An SSH key is used to securely connect to your server. It is broken into two pieces, the private key and the public key. You should protect your private key at all costs. If someone gains access to this file they can access all of your systems. An extra security measure would be to passphrase protect your SSH key. This will prompt you for your passphrase every time you use your key.

Generating an SSH key is different per OS. Please follow the instructions for your OS below.
## Windows
In order to generate an SSH key pair on Windows you will need [PuttyGen](https://the.earth.li/~sgtatham/putty/latest/w32/puttygen.exe).

Once you have this tool you simply open it and click the ***Generate*** (I highly recommend replacing the ***Bits*** for the key from ***2048 --> 4096*** for added security). 

Now there are two keys you need to save. 

The ***Correct*** public key is actually printed into the box towards the top. You will want to copy that and save it to a file.

Download the ***Private*** key. (I recommend adding a ***passphrase*** before downloading to help secure this private key. ***SAVE THIS FOR LATER***)

Again protect the private key at all cost.

## Mac
Creating and SSH key pair in Mac is quite easy.

Open your Terminal application.

Run the  following command
```bash
ssh-keygen -t rsa -b 4096
```
You will be prompted to name the key, type in something like (my_ssh_key)

You will then be prompted to enter a ***passphrase*** (And I recommend doing this ***SAVE THIS FOR LATER***)

You will now see two new files named whatever you named the key ***my_ssh_key*** and ***my_ssh_key.pub***

The ***my_ssh_key.pub*** is your public key. And ***my_ssh_key*** is your private key and should be protected at all cost. 
