From: Gernot Kvas <gernot.kvas@gmail.com>
Date: Tue, 5 Feb 2008 11:26:05 +0100
Subject: [Buildroot] X11R7 on ARM
Message-ID: <b47ad75d0802050226u65a6f337i11fe7df4e7b3cc25@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

The version of X11R7 (Release 7.2) fails to work properly on ARM.
Reason for this is some missing defines that have been fixed years ago
for xfree86 [1]. Are there plans to pump the version to 7.3? I
compared xserver code (1.2.0 and 1.4) and 1.4 includes these fixes.
Anyone working on a more recent X11R7 package in buildroot?

As a sidenote, has anyone successfully tried to mate a PCI-card with
an ARM and X11?

Cheers,

Gernot

[1] http://www.mail-archive.com/debian-x at lists.debian.org/msg31585.html
