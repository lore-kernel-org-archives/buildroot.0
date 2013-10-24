From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Thu, 24 Oct 2013 22:58:01 +0200
Subject: [Buildroot] uboot host tools 2013.10 mkimage does not exist
Message-ID: <A96AA0A8EE3542B9971D20A3266209BA@JohanW7>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi
 
 
make[1]: Leaving directory `/home/buildroot12git'
>>> host-uboot-tools 2013.10 Installing to host directory
/usr/bin/install -m 0755 -D /home/buildroot12git/output/build/host-uboot-tools-2013.10/tools/mkimage
/home/buildroot12git/output/host/usr/bin/mkimage
/usr/bin/install: cannot stat `/home/buildroot12git/output/build/host-uboot-tools-2013.10/tools/mkimage': No such file or directory

If i look into the host-uboot build dir , i find no mkimage.
Maybe it needs te be explicit enabled ?
 
Sagaert Johan
