From: daniel.sangue at sangue.ch <daniel.sangue@sangue.ch>
Date: Tue, 30 Sep 2014 13:59:46 +0200
Subject: [Buildroot] Next major libftdi1-1.1
Message-ID: <2.d2dbde7bfe4fe960cb5a@polarstar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Please add the new major release of the lib FTDI. The new lib can exists alongside the other (libfdi.so and libftdi1.so) - so you could probably add the new package to the buildroot repository.

    source "package/libftdi/Config.in"
+    source "package/libftdi1/Config.in"

Tested it for armv7 builds only.

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140930/92d7f810/attachment.html>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: libftdi1.tar.gz
Type: application/x-gzip
Size: 743 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140930/92d7f810/attachment.bin>
