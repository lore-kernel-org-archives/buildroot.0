From: H.Fijnvandraat at inter.nl.net <H.Fijnvandraat@inter.nl.net>
Date: Sat, 20 Apr 2013 17:26:09 +0200 (CEST)
Subject: [Buildroot] iMX6Q prerequisite patches for Qt5
Message-ID: <51034.217.149.209.147.1366471569.squirrel@webmail.internl.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi All,

I have been successfull in compiling Qt5 for the Freescale iMX6Q processor
using the contributions from Thomas Petazzoni.

However, the iMX6Q uses a closed source Vivante GPU, which must be handled
by some libraries.

The attached patches are an attempt to incorporate these into Buildroot.

Regards,

Henk

-------------- next part --------------
A non-text attachment was scrubbed...
Name: patches-iMX6Q-1
Type: application/octet-stream
Size: 6424 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130420/730b2bb5/attachment.obj>
