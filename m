From: Brock Williams <brock@cottonwoodcomputer.com>
Date: Tue, 15 Aug 2017 11:41:48 -0600
Subject: [Buildroot] can't build qt5webkit for raspberry pi 3
Message-ID: <20170815114148.42777e85@brock-desktop>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


I'm not able to build qt5webkit for a pi 3 from master.  It works for pi
2. Here is the error:

In file included from ./config.h:30:0,
                 from wtf/CurrentTime.cpp:34:
./wtf/Platform.h:323:6: error: #error "Not supported ARM architecture"
 #    error "Not supported ARM architecture"
      ^~~~~

I've attached the defconfig that we are using.  This is based on the
raspberrypi3_defconfig with what I think is just the minimum to build
qt5webkit added.  For now we have just configured
the build down to the pi 2 cpu settings.

Brock


-- 
Brock Williams  brock at cottonwoodcomputer.com
Cottonwood Computer Solutions, Inc.
www.cottonwoodcomputer.com      406-896-4910
-------------- next part --------------
A non-text attachment was scrubbed...
Name: defconfig
Type: application/octet-stream
Size: 1302 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170815/14926295/attachment.obj>
