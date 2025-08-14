Ansible PIES
-----------------

This is an ansible playbook for configuring raspberry pies on my local network as remote cameras.

It assumes the base pi setup found [here](file:///home/chris/Downloads/linux\ images/my\ pi\ base\ images/pi-base-image-20_04-16gb-100421.gz)

## Running

```
ansible-playbook -K ./pi-cam_playbook.yml
```

### Base Image

`~/Downloads/linux\ images/my\ pi\ base\ images/pi-base-image-ubuntu-server-090422.img`

The base image is an ubuntu server, with my ssh keys added. SSH listening on port 1027 and `avahi` setup to provide
hostname broadcasting.

You can restore this to a pi using cli or "Startup Disk Creator"

### Compressed Base Image

`gunzip -c /mnt/yourddimage.img.gz | dd of=/dev/sdX`

example:

`gunzip -c "/home/chris/Downloads/linux images/my pi base images/pi-base-image-20_04-16gb-100421.gz" | dd of=mmcblk0p1`

`sudo gunzip -c "/home/chris/Downloads/linux images/my pi base images/pi-base-image-20_04-16gb-100421.gz" | sudo dd of=/dev/mmcblk0p1 conv=sync,noerror bs=10M`

**The may be issues with the compressed images, pi-base-image-ubuntu-server-090422.img is the one to use for now**