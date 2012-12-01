From: Santhosh Ramani <srcoolz@gmail.com>
Date: Sat, 1 Dec 2012 10:38:19 -0600
Subject: [Buildroot] Problem with NFS boot
Message-ID: <CADKZYY+nZbaXZbuG0D4RSR4N+GWQZKRALg0a7A0nZLNhMhd+rw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I'm using buildroot to create my rootfs for AM335x device and have been
able to successfully boot using an SD Card. However, when I try to use NFS
and boot it always gives me the following

[    3.628326] VFS: Mounted root (nfs filesystem) on device 0:14.
[    3.635009] Freeing init memory: 228K
can't open /dev/null: No such file or directory
can't open /dev/null: No such file or directory
can't open /dev/null: No such file or directory
can't open /dev/null: No such file or directory
can't open /dev/null: No such file or directory
Starting logging: OK
Populating /dev using udev: /etc/init.d/S10udev: line 45: can't create
/proc/sys/kernel/hotplug: nonexistent directory
cannot open /dev/null
done
Starting system message bus: done
Starting network...
ip: RTNETLINK answers: File exists
can't open /dev/ttyO0: No such file or directory
can't open /dev/ttyO0: No such file or directory
can't open /dev/ttyO0: No such file or directory
can't open /dev/ttyO0: No such file or directory
can't open /dev/ttyO0: No such file or directory
can't open /dev/ttyO0: No such file or directory
can't open /dev/ttyO0: No such file or directory

I must clarify that I am using the Linux kernel not built by Buildroot but
by manually building from the TI SDK. So the only thing I use from
Buildroot is the rootfs..it works fine when I untar it on my sd card, but
doesn't seems to work over the network  Also I've selected udev option in
buildroot.

Thanks for your replies.
Regards

Ssanthosh

-- 
Greater the Difficulty....Sweeter is the Victory
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20121201/ad93f8ab/attachment.html>
