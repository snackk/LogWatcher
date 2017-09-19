# LogWatcher


### About

I personally use this script to monitor my own servers, and to send me an email in case of someone's trying to access them. At the moment this script is only monitoring the ssh connection and using Gmail's client to send an email.

### Before running it

You'll have to create the ambient variables:
```sh
$ export log_email_from="your.email@gmail.com"
$ export log_email_to="your.email@account"
$ export log_passwd="email.password"
```
After that you have to clone the repo and run it at startup, haven't tested yet, but guess it's something like this:
```sh
$ cd ~ 
$ mkdir git && cd git
$ git clone https://github.com/snackk/logwatcher
$ cd logwatcher
$ sudo cp LogsWatcher.sh /etc/init.d/
$ sudo chmod 755 /etc/init.d/LogsWatcher.sh
$ sudo update-rc.d LogsWatcher.sh defaults
```
If everything works as expected, you should receive an email everytime someone's log on to your machine, including yourself.
  
  Written by Diogo Santos.
