From: Sergey Gusarov <laborer2008@gmail.com>
Date: Wed, 06 Jul 2011 23:47:56 +0400
Subject: [Buildroot] Note on the large files support in sqlite(as part of Qt)
Message-ID: <4E14BBEC.40908@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

In git i saw a 
http://git.buildroot.net/buildroot/commit/?id=7e4d47593850851d6fcaa6068258c16cc8761ab5 
commit, but it seems it is no longer necessary.
Look at this page http://bugreports.qt.nokia.com/browse/QTBUG-15395
Patch from qt bugtracker already included in the upstream, at least it 
is in the Qt 4.7.3 release.
This means that the qt build system itself conveys the desired 
flag(-DSQLITE_DISABLE_LFS) for sqlite.

Regards, Sergey
