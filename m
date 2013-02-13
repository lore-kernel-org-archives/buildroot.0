From: Joe Halpin <jhalpin@luminatorusa.com>
Date: Wed, 13 Feb 2013 07:54:45 -0600
Subject: [Buildroot]  [PATCH] add pre-build script
Message-ID: <05255DE50A102443A25D42F2CCAC151FA58C25@LUMEXCH.luminatorusa.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is a patch to add a pre-build script, which runs before the build
starts. This lets us setup symlinks and such before the build starts,
which makes things easier and cleaner for us. Maybe it will for other
people too. This was made from the 20.12.11 release.

I searched for a patch like this but didn't find one. Apologies if I'm
being redundant.

Joe

----

Joe Halpin | Software Engineer | Luminator LTG | 972-516-3083

 

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130213/3b296ae1/attachment.html>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: buildroot-prebuild.patch
Type: application/octet-stream
Size: 1608 bytes
Desc: buildroot-prebuild.patch
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130213/3b296ae1/attachment.obj>
