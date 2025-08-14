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

```
ansible-playbook -K ./pi-cam_playbook.yml
```

## More Info on the PI-Cam

This playbook will clone https://github.com/chriswininger/home-monitor-service/tree/master/live-cam to the pi.
It contains a README with more info about debugging the service.
