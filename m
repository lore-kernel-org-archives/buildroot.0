From: phani teja Movva <phaniteja225@gmail.com>
Date: Thu, 5 Jun 2014 14:14:31 +0530
Subject: [Buildroot] Facing error while cross compiling libglib2 package for
	Xtensa architecture
Message-ID: <CAJQMGxGNjUBhZ39BKgOf4vf09F3nyT=O9c4B9pRYOq7+kBuj2Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I am trying to cross compile libglib2 package for Xtensa architecture. I
enabled locale/gettext and WCHAR in tool chain and libglib2 in packages.

I am facing the following issue :

?/usr/bin/glib-genmarshal: line 105: /usr/bin/.libs/lt-glib-genmarshal:
cannot execute binary file
/usr/bin/glib-genmarshal: line 105: /usr/bin/.libs/lt-glib-genmarshal:
Success
make[3]: *** [stamp-gmarshal.h] Error 1
make[3]: Leaving directory
`/home/buildroot-xtensa-HiFi2-Snapshot/build_xtensa_dc233x90/glib-2.12.9/gobject'?

 Please help me regard in this issue.

Thanks in advance
Phani Teja.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140605/b9d4288f/attachment.html>
