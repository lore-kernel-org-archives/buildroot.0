From: Paul Kavan <pkavan@gmail.com>
Date: Tue, 10 Jul 2007 16:42:35 -0500
Subject: [Buildroot] Problem with GDB in linux 2.6.22-rc1
Message-ID: <61c0054e0707101442g6731159dk4e34c48b8c6c82a@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello all:

I am using buildroot for my rfs. I am trying to use gdb and am getting the
following message when I try to run it:

dlopen failed on 'libthread_db.so.1' - File not found
GDB will not be able to debug pthreads.

I have tried to determine how to get libthread_db.so.1 included into my rfs
via buildroot, but have been unsuccessful. Does anyone here know how this is
accomplished?

Thanks.

Paul

-- 
***************************************
Paul David Kavan
Project Engineer
GRH Electronics, Inc.
402-734-4900
pkavan at gmail.com
***************************************
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20070710/bfb18eca/attachment.htm 
