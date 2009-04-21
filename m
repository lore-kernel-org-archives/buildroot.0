From: Sven Neumann <s.neumann@phase-zero.de>
Date: Tue, 21 Apr 2009 17:03:40 +0200
Subject: [Buildroot] trouble with FUSE (Filesystem in Userspace)
Message-ID: <1240326220.8272.4.camel@sven>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

we are using buildroot on an ARM platform with uCLibC 0.9.30.1 and Linux
2.6.30rc2 and can't get FUSE to work. I tried the simple hello.c example
from the fuse-2.7.3 sources and everything seems to work fine until I
try to read from the filesystem. This read blocks forever. Now I wonder
if anyone on this list has ever got FUSE and uCLibC to work on an ARM or
if there are known problems with this combination? Any help would be
much appreciated as I am running out of ideas here...


Sven
