From: Ravi Kumar Kulkarni <ravilinux4u@gmail.com>
Date: Tue, 23 Mar 2010 23:23:15 +0530
Subject: [Buildroot] understanding and using buildroot
Message-ID: <532dd5841003231053w2b88f147ne655bc7985e65aff@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello everybody,
finally after 2 weeks of struggling i managed to build buildroot!
 i have some doubts to clarify on usage of buildroot and regarding some packages
i have built buildroot jffs2 image from using daily snapshot and
booted onto target.
but
a)when i get login prompt what password should i enter for a user and for root?
b)and what should be enabled to so as to login as root?

my /etc/passwd file is as belw

root:x:0:0:root:/root:/bin/sh
daemon:x:1:1:daemon:/usr/sbin:/bin/sh
bin:x:2:2:bin:/bin:/bin/sh
sys:x:3:3:sys:/dev:/bin/sh
sync:x:4:100:sync:/bin:/bin/sync
mail:x:8:8:mail:/var/spool/mail:/bin/sh
proxy:x:13:13:proxy:/bin:/bin/sh
www-data:x:33:33:www-data:/var/www:/bin/sh
backup:x:34:34:backup:/var/backups:/bin/sh
operator:x:37:37:Operator:/var:/bin/sh
haldaemon:x:68:68:hald:/:/bin/sh
dbus:x:81:81:dbus:/var/run/dbus:/bin/sh
nobody:x:99:99:nobody:/home:/bin/sh
sshd:x:103:99:Operator:/var:/bin/sh
default:x:1000:1000:Default non-root user:/home/default:/bin/sh


and my /etc/securetty file is below

tty1
tty2
tty3
tty4
tty5
tty6
tty7
tty8
ttyS0
ttyS1
ttyS2
ttyS3
ttyAMA0
ttyAMA1
ttyAMA2
ttyAMA3
ttySAC0
ttySAC1
ttySAC2
ttySAC3
ttyUL0
ttyUL1
ttyUL2
ttyUL3
ttyPSC0
ttyPSC1
ttyPSC2
ttyPSC3
ttyCPM0
ttyCPM1
ttyCPM2
ttyCPM3


 now apart from this to build a ubifs file system image what should i configure?
im building kernel outside buildroot . is there no way to  build ubifs
without configuring kernelin buildroot?

i would be thankful if anybody clarifies the above doubts.
warm regards,
Ravi Kulkarni.
