From: bao bui <buiqbao@gmail.com>
Date: Sat, 2 Apr 2011 22:16:05 +0700
Subject: [Buildroot] libdl in buildroot
Message-ID: <BANLkTim6UsDHCRf5tQthWsrykgzmszn3Ew@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

How can i compile the libdl in buildroot? In the stagging/usr/lib folder, i
only have the libdl.a and libdl.so, which is the sym link to libdl.so.0.
When I compile qt 4.7.1, I got the error: undefined reference to `dlopen'. I
think the reason of this error is the missing of file libdl.so.0

Thank in advance
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110402/53e2339c/attachment.html>
