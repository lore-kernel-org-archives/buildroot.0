From: Rohit Kumar <rkthebest@gmail.com>
Date: Fri, 25 Jul 2014 11:41:00 +0900
Subject: [Buildroot] busybox error while building
Message-ID: <CABzetm2oeqkBFvXSAGLwzqxYUn3ENxZDmEsow4ZpbyQCN=OoKA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,
i copied .config file from previous buildroot to newest buildroot source
and when i tried to "make "
i got following error:

/bin/sed -i -e 's, at STATIC@,,'
/home/rohit/Desktop/buildroot/output/host/usr/bin/pkg-config
>>> busybox 1.22.1 Extracting
bzcat /home/rohit/Desktop/buildroot/dl/busybox-1.22.1.tar.bz2 | tar
--strip-components=1 -C
/home/rohit/Desktop/buildroot/output/build/busybox-1.22.1  -xf -
>>> busybox 1.22.1 Patching

Applying 0006-lzop-add-overflow-check.patch using patch:
patching file archival/libarchive/liblzo.h
patching file archival/libarchive/lzo1x_d.c

Applying
busybox-0001-networking-libiproute-use-linux-if_packet.h-instead-.patch
using patch:
patching file networking/libiproute/iplink.c

Applying busybox-0002-busybox-1.22.1-ash.patch using patch:
patching file shell/ash.c

Applying busybox-0003-busybox-1.22.1-date.patch using patch:
patching file libbb/time.c

Applying busybox-0004-busybox-1.22.1-iplink.patch using patch:
patching file networking/libiproute/iplink.c

Applying busybox-0005-busybox-1.22.1-nc.patch using patch:
patching file networking/nc_bloaty.c
>>> busybox 1.22.1 Configuring
/usr/bin/install -D -m 0644 package/busybox/busybox-1.22.x.config
/home/rohit/Desktop/buildroot/output/build/busybox-1.22.1/.config
/usr/bin/install: cannot stat ?package/busybox/busybox-1.22.x.config?: No
such file or directory
make: ***
[/home/rohit/Desktop/buildroot/output/build/busybox-1.22.1/.stamp_configured]
Error 1

With Regards,

Rohit Kumar
+82 1073149173
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140725/c81a5ba7/attachment.html>
