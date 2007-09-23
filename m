From: aldot at uclibc.org <aldot@uclibc.org>
Date: Sun, 23 Sep 2007 07:07:00 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/config:  lxdialog
Message-ID: <20070923140700.9103AA6AC0@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-09-23 07:06:59 -0700 (Sun, 23 Sep 2007)
New Revision: 19969

Log:
- pull kbuild from 2.6.22.7. This should fix the ncurses detection for dylib et al


Modified:
   trunk/buildroot/package/config/Makefile.kconfig
   trunk/buildroot/package/config/README.buildroot2
   trunk/buildroot/package/config/conf.c
   trunk/buildroot/package/config/kconfig-to-buildroot2.patch
   trunk/buildroot/package/config/lex.zconf.c_shipped
   trunk/buildroot/package/config/lkc.h
   trunk/buildroot/package/config/lxdialog/check-lxdialog.sh
   trunk/buildroot/package/config/lxdialog/dialog.h
   trunk/buildroot/package/config/lxdialog/util.c
   trunk/buildroot/package/config/mconf.c
   trunk/buildroot/package/config/menu.c
   trunk/buildroot/package/config/qconf.cc
   trunk/buildroot/package/config/qconf.h
   trunk/buildroot/package/config/symbol.c
   trunk/buildroot/package/config/util.c
   trunk/buildroot/package/config/zconf.l
   trunk/buildroot/package/config/zconf.tab.c_shipped
   trunk/buildroot/package/config/zconf.y


Changeset:

Sorry, the patch is too large to include (1485 lines).
Please use ViewCVS to see it!

http://uclibc.org/cgi-bin/viewcvs.cgi?view=rev&root=svn&rev=19969
