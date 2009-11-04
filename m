From: Ormund Williams <ormundw@panix.com>
Date: Wed, 04 Nov 2009 15:37:42 -0500
Subject: [Buildroot] Qt fails to build
Message-ID: <1257367062.3465.51.camel@station1.ormlab.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi All,

I did a git pull this morning and now I get this error, no change to
the .config file:

Creating qmake. Please wait...
make[1]: Entering directory .../buildroot/output/build/qt-embedded-linux-opensource-src-4.5.2/qmake'
g++: @: No such file or directory
make[1]: *** [project.o] Error 1
make[1]: Leaving directory .../buildroot/output/build/qt-embedded-linux-opensource-src-4.5.2/qmake'
make: *** [.../buildroot/output/build/qt-embedded-linux-opensource-src-4.5.2/.configured] Error 2


-- 
Ormund Williams
OrmLab LLC
