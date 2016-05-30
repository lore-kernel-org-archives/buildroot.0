From: gdbabu Krishnan <gdbabu.krishnan@gmail.com>
Date: Mon, 30 May 2016 11:51:24 +0530
Subject: [Buildroot] lirc_rpi : module is from the staging directroy
Message-ID: <CAG7w3y=7sp9HMTbSSyqvRoY4CLJtk9fMFZzenWH5YGK=1zZx4A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,


i have enable LIRC in buildroot for raspberry pi and sucessfully build it ,
than insert the kernel driver for lirc, i found in following path,

/lib/modules/4.4.8/kernel/driver/media/rc/keymaps#

then i gave in terminal  modprobe rc-lirc.ko  it successfully inserted.
after this step i given "lsmod"
then i got following drivers are inserted

rc_lirc
lirc_dev
rc_code


then i want to insert "lirc_rpi.ko" i found in following directory

 /lib/modules/4.4.8/kernel/driver/staging/media/lirc/

insmod lirc_rpi.ko

then i got following message ,

insmod:can't insert 'lirc_rpi.ko:No such Device'

or

modprobe lirc_rpi.ko

than i got following message

modprobe: can't load module
lirc_rpi.ko(kernel/driver/staging/media/lirc/lirc_rpi.ko):NO such device


why i can't able to load this driver is there any other configuration
please help me to solve this problem


thank you
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160530/12c96b26/attachment.html>
