From: Julien Letessier <julien.letessier@technosens.fr>
Date: Wed, 4 Jul 2007 10:29:52 +0200
Subject: [Buildroot] X11R7 packages available
Message-ID: <f0528b5b0707040129j262b9e24i774fd06d8d579a2a@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi list,

As promised, here is
- a full set of X11R7 and support packages (including Mesa3D OpenGL, 2D and
3D drivers, Xv support)
- an updated version (release 4) of the autotools patch

The files are available from:
   http://bazaar.mezis.net/buildroot_autotools4.patch.bz2
   http://bazaar.mezis.net/buildroot_x11r7_v1.tar.bz2
[because mailman won't let me attach them]

Extract the archive, move packages to your buildroot package directory, and
remember to add
   source "package/Config.xorg7.in"
to your package/Config.in

Hopefully I didn't forget a dependancy package.

Any feedback is welcome... once this is tested I think it would be a good
idea to add the whole thing to Buildroot.

Cheers,
-- 
Julien Letessier
<julien.letessier@technosens.fr>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20070704/fbadc4cd/attachment.htm 
