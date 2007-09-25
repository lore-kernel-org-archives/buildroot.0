From: Rex Luscus <sinestado@gmail.com>
Date: Mon, 24 Sep 2007 23:28:50 -0300
Subject: [Buildroot] [Libusb PATCH] for revision 20000
Message-ID: <46F87262.20806@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

To compile tests must have the libs in stagedir but is impossible to
copy libs before to compile tests!!!
Tests are not used and ignored in the package copy. This patch omit this 
compilation
(There are not an option in configure file of package to omit this)
This patch update my yesterday patch

-------------- next part --------------
A non-text attachment was scrubbed...
Name: br2-libusb.patch
Type: text/x-patch
Size: 392 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20070924/c6db5e95/attachment.bin 
