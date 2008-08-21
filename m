From: Wade Berrier <wberrier@gmail.com>
Date: Thu, 21 Aug 2008 13:36:44 -0600
Subject: [Buildroot] [PATCH] gcc softfloat on powerpc
Message-ID: <1219347404.7367.21.camel@wberrierlx.appsig.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I'm running into the same situation described here:

http://www.uclibc.org/lists/busybox/2007-July/028210.html

I'm using softfloat on ppc, and also noticed that '-float-abi' is only
for arm.

How does the attached patch look?  (Uses -float-abi for arm, but
-msoft-float for other architectures)

Wade
-------------- next part --------------
A non-text attachment was scrubbed...
Name: buildroot-gcc_softfloat_non_arm.patch
Type: text/x-patch
Size: 533 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20080821/a70c48ea/attachment.bin 
