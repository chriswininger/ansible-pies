Ansible PIES
-----------------

This is an ansible playbook for configuring raspberry pies on my local network as remote cameras.

It assumes the base pi setup found [here](file:///media/chris/bigdata/Downloads/linux\ images/my\ pi\ base\ images/pi-base-image-20_04-16gb-100421.gz)

example:

```
sudo su
gzip -dc /media/chris/bigdata/Downloads/linux\ images/my\ pi\ base\ images/pi-base-image-20_04-16gb-100421.gz | dd bs=4M of=/dev/mmcblk0
```

## Running

```
ansible-playbook -K ./pi-cam_playbook.yml
```

### Base Image

`~/Downloads/linux\ images/my\ pi\ base\ images/pi-base-image-ubuntu-server-090422.img`

The base image is an ubuntu server, with my ssh keys added. SSH listening on port 1027 and `avahi` setup to provide
hostname broadcasting.

You can restore this to a pi using cli or "Startup Disk Creator"

Note: This block was a local change that had not been committed, last time I set up a camera I used the pi-base-image from the opening
section, that was probably older :-(


### Compressed Base Image

`gunzip -c /mnt/yourddimage.img.gz | dd of=/dev/sdX`

example:

`gunzip -c "/home/chris/Downloads/linux images/my pi base images/pi-base-image-20_04-16gb-100421.gz" | dd of=mmcblk0p1`

`sudo gunzip -c "/home/chris/Downloads/linux images/my pi base images/pi-base-image-20_04-16gb-100421.gz" | sudo dd of=/dev/mmcblk0p1 conv=sync,noerror bs=10M`

(I did not have to do it this way using the image at the top but I did have to do sudo su)

**The may be issues with the compressed images, pi-base-image-ubuntu-server-090422.img is the one to use for now**

!!! Full cirlcle what a mess lol, see below, so possibly I did it right this time, just keep using  pi-base-image-ubuntu-server-090422.img
until we can clean this up

=======
## More Info on the PI-Cam

This playbook will clone https://github.com/chriswininger/home-monitor-service/tree/master/live-cam to the pi.
It contains a README with more info about debugging the service.


## Left in some notes that are probably no longer true from merge conflict

This is not fully generalized to deploy to all cameras, so

* !!! Update hosts file and make sure you are targeting the right pi/pis
* Update this block in the playbook to set the desired hostname
  ```
      - name: Set hostname # will need to update this to vary by server instance
      become: true
      copy:
        dest: /etc/hostname
        content: "pi-cam-1\n" # update this to possibly look up from dictionary by host address
  ```
* Create your secrets file from the example


