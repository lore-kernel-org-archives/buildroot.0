From: Robin Gilks <robin.gilks@tait.co.nz>
Date: Tue, 18 Sep 2007 14:23:48 +1200
Subject: [Buildroot] AVR32 libiberty build failure
Message-ID: <46EF36B4.2000703@tait.co.nz>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

At least I think thats the problem...

gcc builds OK and at the next step on a default config build for a 
atngw100 it fails.

build output attached.


$ svn info
Path: .
URL: svn://uclibc.org/trunk/buildroot
Repository Root: svn://uclibc.org
Repository UUID: 69ca8d6d-28ef-0310-b511-8ec308f3f277
Revision: 19875
Node Kind: directory
Schedule: normal
Last Changed Author: aldot
Last Changed Rev: 19875
Last Changed Date: 2007-09-18 09:50:54 +1200 (Tue, 18 Sep 2007)
Properties Last Updated: 2007-09-18 11:59:57 +1200 (Tue, 18 Sep 2007)


Build host = kubuntu 6.06LT

$ uname -a
Linux WS1737 2.6.15-28-386 #1 PREEMPT Tue Mar 13 20:49:31 UTC 2007 i686 
GNU/Linux

$ gcc --version
gcc (GCC) 3.3.6 (Ubuntu 1:3.3.6-10)
Copyright (C) 2003 Free Software Foundation, Inc.
This is free software; see the source for copying conditions.  There is NO
warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

-- 
Robin


=======================================================================
This email, including any attachments, is only for the intended
addressee.  It is subject to copyright, is confidential and may be
the subject of legal or other privilege, none of which is waived or
lost by reason of this transmission.
If the receiver is not the intended addressee, please accept our
apologies, notify us by return, delete all copies and perform no
other act on the email.
Unfortunately, we cannot warrant that the email has not been
 altered or corrupted during transmission.
=======================================================================

-------------- next part --------------
A non-text attachment was scrubbed...
Name: build_output.bz2
Type: application/octet-stream
Size: 2295 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20070918/92fab5c5/attachment.obj 
