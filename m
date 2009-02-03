From: John Voltz <john.voltz@gmail.com>
Date: Tue, 3 Feb 2009 11:40:35 -0500
Subject: [Buildroot] MySQL patch
Message-ID: <46a136670902030840n3492edd9yb08289fc3493bed@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi there,

Attached is a patch to version bump MySQL to 5.1.30, and add support
for MySQL server as well. I have tested both the client and server on
the AVR32 target, with PHP as well. I tested it using Ampache, and
another proprietary Qt4 desktop MySQL client application.

Note that there are some removals of (call DOWNLOAD) which can be
ignored in my patch.

Regards,
John Voltz
-------------- next part --------------
A non-text attachment was scrubbed...
Name: mysql-5.1.30-buildroot.patch
Type: text/x-patch
Size: 7796 bytes
Desc: not available
Url : http://lists.busybox.net/pipermail/buildroot/attachments/20090203/7bde2fb6/attachment-0001.bin 
