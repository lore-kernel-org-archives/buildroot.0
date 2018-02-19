From: Alex Hildebrand <alexander.hildebrand@googlemail.com>
Date: Mon, 19 Feb 2018 20:32:02 +0100
Subject: [Buildroot] Read only rootfs with writable (aufs) overlay
Message-ID: <5a8b2633.54afdf0a.cb7dd.554c@mx.google.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi there,
Does anyone of you have experience with a rootfs with a writable (aufs) overlay?
I managed to compile aufs and mount a folder combining the read only rootfs with a read write data overlay. How to switch the rootfs to this mount point? Tried to move the mount point to this folder in the inittab, but this fails with "Too many levels of symbolic links"
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180219/2ef7ac4f/attachment.html>
