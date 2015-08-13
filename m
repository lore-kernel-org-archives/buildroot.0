From: Christian Stewart <christian@paral.in>
Date: Thu, 13 Aug 2015 02:07:46 +0000
Subject: [Buildroot] eUdev Label Issues
Message-ID: <CA+h8R2qUKBaoif-0B9Gjv3MD_0gycmxicwejCAwyR4CXnzvFYg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

I'm using buildroot to compile a system for an odroid XU4.

Here's my defconfig: http://pastebin.com/raw.php?i=ETU9d160

Seemingly randomly, my udev device labels will be messed up.

ls /dev/disk/by-label/
boot layer rogtfs swap

After a reboot there's a 50% chance it will be correct:

ls /dev/disk/by-label/
boot layer rootfs swap

I'm using an SD card with a msdos partition table made with gparted. I'm
using fat16, ext2, ext4, linux-swap for the partitions, respectively.

Any idea why this would happen? It's always rogtfs, once I saw layer
spelled daqer, and boot spelled bogt.

Thanks!
Christian
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150813/c3b4610f/attachment.html>
