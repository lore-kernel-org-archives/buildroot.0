From: Rex Luscus <sinestado@gmail.com>
Date: Sun, 23 Sep 2007 22:03:54 -0300
Subject: [Buildroot] Libusb break when try to compile tests. Patch to solve
	this
Message-ID: <46F70CFA.5090809@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

To compile tests must have the libs in stagedir but is impossible to 
copy libs before to compile tests!!!
Tests are ignored in the package copy. This patch omit this compilation 
(Thera are not an option in configure file of package to omit this)
-------------- next part --------------
A non-text attachment was scrubbed...
Name: br2-libusb.patch
Type: text/x-patch
Size: 907 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20070923/93539f3b/attachment.bin 
