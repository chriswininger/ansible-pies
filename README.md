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

## More Info on the PI-Cam

This playbook will clone https://github.com/chriswininger/home-monitor-service/tree/master/live-cam to the pi.
It contains a README with more info about debugging the service.
