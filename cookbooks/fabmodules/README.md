# fabmodules

This cookbook installs [fabmodules](https://github.com/FabModules/fabmodules-html5) from the [FabLabWgtn git repo](https://github.com/FabLabWgtn/fabmodules-html5).
It creates a system service to automatically run on startup and creates a desktop shortcut for [guest](https://github.com/FabLabWgtn/fab_chef/tree/master/cookbooks/guest_setup) users.

**Note:** This script does _not_ install or configure any machines automatically.  
Vinyl cutters / PCB mill need to be manually setup matching output setting from [fabmodules](https://github.com/FabLabWgtn/fabmodules-html5/tree/master/outputs)  

TODO:  
Add and autostart systemctl services for fablocal.service & fabnode.services
```
systemctl enable fablocal.service
systemctl start fablocal.service
systemctl status fablocal.service
```  

`systemctl daemon-reload`  

```
#lsusb - find that roland vinyl cutter
#sudo usb_printerid /dev/usb/lp0
#node /opt/fabmodules/mod_server/mod_server.js
#in groups fabmodules & dialout
#write access to /opt/fabmodules
#/opt/fabmodules/package.json exits
#/dev/ttyUSB0
#sudo lpr -PRoland-GX-24 -oraw test.camm
#description = Roland GX-24
#device URL =  usb://Roland/GX-24?serial=DAN8585
#make & model = generic text-only printer

#send command lpr -PRoland-GX-24

 #sudo adduser $USER lpr --- is this nesscary???
 ```
