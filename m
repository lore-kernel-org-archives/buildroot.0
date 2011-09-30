From: H Hartley Sweeten <hartleys@visionengravers.com>
Date: Fri, 30 Sep 2011 16:21:02 -0500
Subject: [Buildroot] Question: Multiple versions of a package.
Message-ID: <ADE657CA350FB648AAC2C43247A983F001F39DC568EC@AUSP01VMBX24.collaborationhost.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Can a package/*/*.mk file be setup to handle two different versions
of a package or should two separate package/* directories be created?

I'm trying to add the ParaGUI package to buildroot.  This is a widget
toolkit library that uses SDL.  It also needs libsigc++, which is
available in packages/, but it's an incompatible version.

The version of libsigc++ in buildroot is 2.2.8.  ParaGUI needs
libsigc++1.2 >= 1.2.5.  It appears that even though these libraries
do the same thing they have very different API's.

A similar issue occurs with the new version of SDL.  It has not been
offically released yet but SDL1.2 and SDL1.3 (2.0?) use completely
different APIs.

What's that bast way to handle this situation?

Regards,
Hartley
