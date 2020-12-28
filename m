From: Vicary A <vicary@yahoo.com>
Date: Mon, 28 Dec 2020 17:27:53 +0800
Subject: [Buildroot] Build failure with alpine
References: <66004670-FB20-4C02-9998-B7071C0F6249.ref@yahoo.com>
Message-ID: <66004670-FB20-4C02-9998-B7071C0F6249@yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello everyone,

I am new to buildroot, please let me know if this is not the correct place for general help.

This is my first time building buildroot, I started with a clean alpine container with the 2020.11 archive.

I installed alpine equivalents of recommended prerequisites from the official site, packages are:

I typed "make raspberrypi4_64_defconfig" followed by "make all", I can see most of the compilation went through until I get the following lines:

making install in e2fsck
make[2]: Entering directory '/root/buildroot/output/build/host-e2fsprogs-1.45.6/e2fsck'
        MKDIR_P /root/buildroot/output/host/sbin /root/buildroot/output/host/share/man/man8
make[2]: config/install-sh: No such file or directory
make[2]: *** [Makefile:522: installdirs] Error 127
make[2]: Leaving directory '/root/buildroot/output/build/host-e2fsprogs-1.45.6/e2fsck'
make[1]: *** [Makefile:433: install-progs-recursive] Error 1
make[1]: Leaving directory '/root/buildroot/output/build/host-e2fsprogs-1.45.6'
make: *** [package/pkg-generic.mk:260: /root/buildroot/output/build/host-e2fsprogs-1.45.6/.stamp_host_installed] Error 2

(Full output log attached)

Where shall I start? Any help is appreciated.

Best,
Vicary

-------------- next part --------------
A non-text attachment was scrubbed...
Name: make-all.log
Type: application/octet-stream
Size: 4799 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20201228/14efefd1/attachment.obj>
