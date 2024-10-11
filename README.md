# Remarkable Paper Pro

## SSH

Enable `Developer mode` on the reMarkable Pro

Connect the reMarkable Pro via USB-C to your computer.

Check the `Settings` / `General` / `About` / `Copyrights and licenses` for the password to use on the initial connection

### Generate public/private key SSH keypair

Generate the keypair. Leave the passphrase blank to allow logging in without a password

```bash
$ ssh-keygen -f ~/.ssh/ssh-remarkable-pro.pem
```

### SSH using password

Use the password you found in the `About` section mentioned above to login to the reMarkable Pro for the first time

```bash
$ ssh root@10.11.99.1
```

### Add config

Setup your `~/.ssh/config` on your local machine to use the private key whenever you connect to the device

```
Host remarkable
	User root
	HostName 10.11.99.1
	IdentityFile ~/.ssh/ssh-remarkable-pro.pem
```

### Create authorized_keys file on the reMarkable Pro

You can find your public key using the following command:

```bash
$ ssh-keygen -y -f ~/.ssh/ssh-remarkable-pro.pem
```

And the put that public key into your `authorized_keys` file

```bash
$ cd .ssh
$ vi authorized_keys
$ chmod go-rwx authorized_keys

```

### Test connection

You should now be able to connect to the reMarkable Pro by symply doing

```bash
$ ssh remarkable
```


## Custom Splash screens

* location: `/usr/share/remarkable`
* dimensions: 1620 x 2160, DPI: 72
* line colors: RGBA(170, 170, 170, 100)

Customized splash screen files:

* suspended.png: Shown when the device goes into sleep mode
* rebooting.png: Shown when the device is starting up
* poweroff.png: Shown when the device is powered off

