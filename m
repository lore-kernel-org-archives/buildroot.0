From: Nigel Sollars <nsollars@gmail.com>
Date: Tue, 24 Apr 2012 19:49:44 -0400
Subject: [Buildroot] Buildroot fails to build when selecting build packages
Message-ID: <CAG6aBkV4xjdsXcvq-AssYQ1nOw0XiBiEjTZvi2rowStdfSCJNg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I have successfully built a buildroot for my Pandaboard es that uses mdev
which is nice,  now I want to include the build environment in my install
packages.

The build fails since as a dependency glib2 is selected this fails with a
dbus like so:

gdbus-proxy-threads.c:34:31: fatal error: dbus/dbus-shared.h: No such file
or directory
compilation terminated.
make[7]: *** [gdbus-proxy-threads.o] Error 1
make[7]: *** Waiting for unfinished jobs....
make[7]: Leaving directory
`/usr/local/panda-stuff/buildroot-git/buildroot/output/build/libglib2-2.30.2/gio/tests'
make[6]: *** [all-recursive] Error 1
make[6]: Leaving directory
`/usr/local/panda-stuff/buildroot-git/buildroot/output/build/libglib2-2.30.2/gio/tests'
make[5]: *** [all] Error 2
make[5]: Leaving directory
`/usr/local/panda-stuff/buildroot-git/buildroot/output/build/libglib2-2.30.2/gio/tests'
make[4]: *** [all-recursive] Error 1
make[4]: Leaving directory
`/usr/local/panda-stuff/buildroot-git/buildroot/output/build/libglib2-2.30.2/gio'
make[3]: *** [all] Error 2
make[3]: Leaving directory
`/usr/local/panda-stuff/buildroot-git/buildroot/output/build/libglib2-2.30.2/gio'
make[2]: *** [all-recursive] Error 1
make[2]: Leaving directory
`/usr/local/panda-stuff/buildroot-git/buildroot/output/build/libglib2-2.30.2'
make[1]: *** [all] Error 2
make[1]: Leaving directory
`/usr/local/panda-stuff/buildroot-git/buildroot/output/build/libglib2-2.30.2'
make: ***
[/usr/local/panda-stuff/buildroot-git/buildroot/output/build/libglib2-2.30.2/.stamp_built]
Error 2


Any help with this one since I have tried a number of things ( google found
), would be awesome.

Regards
Nigel Sollars

-- 
?Science is a differential equation. Religion is a boundary condition.?

Alan Turing
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120424/149a56e8/attachment.html>
