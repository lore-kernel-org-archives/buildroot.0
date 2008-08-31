From: Steven Woody <narkewoody@gmail.com>
Date: Sun, 31 Aug 2008 08:50:14 +0800
Subject: [Buildroot] Make error
Message-ID: <ed4892840808301750t13e320a6ne218b2a0e96168f@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Following were outputed when run 'make', but I don't know what step it
is related to:

table='target/generic/mini_device_table.txt'
makedevs: line 53: regular file '/home/narke/buildroot/project_build_arm/uclibc/
root/usr/share/udhcpc/default.script' does not exist: No such file or directory
-rw-r--r-- 1 narke users 10530816 2008-08-31 08:47 /home/narke/buildroot/binarie
s/uclibc/rootfs.arm.ext2
rm -f /home/narke/buildroot/project_build_arm/uclibc/.fakeroot*


Do you know what's wrong with the making?

Thanks.
