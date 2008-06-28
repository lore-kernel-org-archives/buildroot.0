From: =?ISO-8859-1?Q?Thiago_A._Corr=EAa?= <thiago.correa@gmail.com>
Date: Sat, 28 Jun 2008 00:19:31 -0300
Subject: [Buildroot] Removing Qt/E
Message-ID: <d6cda7730806272019i3bbb07dcrd951128d91c17190@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

   Let me first explain the history of this package to those who don't
follow Qt development: Qt/E was the original name of Qtopia Core (the
library, not the shell). Recently, Trolltech/Nokia has renamed Qtopia Core
to Qt for Embedded Linux.

   Is there anyone who still uses Qt/E? Qt Embedded (original), like Qt 2.x
is very, very old. If there are no users of this package, I would propose
removing it and possibly renaming qtopia to Qt Embedded.

   The current Qtopia we have is 4.4.0, which was prior to this 4.3 and I
imagine that at some point it might have been 3.3. All of those versions are
not 100% source code compatible with one another, in speciall the 3.x to 4.x
jump. Since support for newer versions have already been dropped in the
past, I don't see why keep this much older one.

Kind Regards,
   Thiago A. Correa
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20080628/f77ef2f9/attachment.htm 
