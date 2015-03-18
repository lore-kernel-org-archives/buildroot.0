From: Chris Rodley <carlighting@yahoo.co.nz>
Date: Wed, 18 Mar 2015 02:52:21 +0000 (UTC)
Subject: [Buildroot] Buildroot fails with: mkusers: user already exists with
 group 'nogroup'
Message-ID: <1349450149.2228539.1426647141409.JavaMail.yahoo@mail.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Buildroot fails with: mkusers: user already exists with group 'nogroup'

PATH="/home/user/buildroot/output/host/bin:/home/user/buildroot/output/host/sbin:/home/user/buildroot/output/host/usr/bin:/home/user/buildroot/output/host/usr/sbin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games" /home/user/buildroot/support/scripts/mkusers /home/user/buildroot/output/build/_users_table.txt /home/user/buildroot/output/target >> /home/user/buildroot/output/build/_fakeroot.fs
mkusers: user already exists with group 'nogroup'
fs/tar/tar.mk:13: recipe for target '/home/user/buildroot/output/images/rootfs.tar' failed
make: *** [/home/user/buildroot/output/images/rootfs.tar] Error 1


This happens after make clean and make.
Any ideas?

Cheers,
CJ
