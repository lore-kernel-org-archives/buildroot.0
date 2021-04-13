From: Henri Roosen <henriroosen@gmail.com>
Date: Tue, 13 Apr 2021 11:51:58 +0200
Subject: [Buildroot] xserver: KDrive / TinyX configuration invalid
Message-ID: <CANKLDmttZENvhVd99Qwt+w8dhxQJmV+VpGe+zHx5aL=+62srOQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I've been using an older version of xserver (1.17.x) and configured to use
the "KDrive / TinyX" server type. Since switching to Buildroot 2021.02.x,
only a recent version of the xserver is available. It seems that "KDrive /
TinyX" does not build Xfbdev anymore and Buildroot installs a dangling link
/usr/bin/X to Xfbdev.

Xfbdev seems to be removed since [1] from the upstream code-base.

Should the Buildroot options to build KDrive / TinyX and it's input drivers
be removed, leaving only "Modular X.org", or is there a good alternative
for a tiny X server for embedded?

Thanks!
Henri

[1]
https://cgit.freedesktop.org/xorg/xserver/commit/?id=feed7e3f982a7ac14f6fe85ed2e1ec4a83700841
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20210413/bf037aec/attachment.html>
