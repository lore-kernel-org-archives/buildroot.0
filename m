From: aldot at uclibc.org <aldot@uclibc.org>
Date: Thu, 28 Jun 2007 03:46:21 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/config:  lxdialog
Message-ID: <20070628104621.58B1DA4606@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-06-28 03:46:19 -0700 (Thu, 28 Jun 2007)
New Revision: 18956

Log:
- pull kconfig from linux-2.6.21.5


Added:
   trunk/buildroot/package/config/Makefile.kconfig
   trunk/buildroot/package/config/POTFILES.in
   trunk/buildroot/package/config/README.buildroot2
   trunk/buildroot/package/config/gconf.c
   trunk/buildroot/package/config/gconf.glade
   trunk/buildroot/package/config/images.c
   trunk/buildroot/package/config/kconfig-to-buildroot2.patch
   trunk/buildroot/package/config/kconfig_load.c
   trunk/buildroot/package/config/kxgettext.c
   trunk/buildroot/package/config/lxdialog/check-lxdialog.sh
   trunk/buildroot/package/config/qconf.cc
   trunk/buildroot/package/config/qconf.h
   trunk/buildroot/package/config/zconf.gperf
   trunk/buildroot/package/config/zconf.hash.c_shipped

Modified:
   trunk/buildroot/package/config/Makefile
   trunk/buildroot/package/config/conf.c
   trunk/buildroot/package/config/confdata.c
   trunk/buildroot/package/config/expr.c
   trunk/buildroot/package/config/expr.h
   trunk/buildroot/package/config/lex.zconf.c_shipped
   trunk/buildroot/package/config/lkc.h
   trunk/buildroot/package/config/lkc_proto.h
   trunk/buildroot/package/config/lxdialog/checklist.c
   trunk/buildroot/package/config/lxdialog/dialog.h
   trunk/buildroot/package/config/lxdialog/inputbox.c
   trunk/buildroot/package/config/lxdialog/menubox.c
   trunk/buildroot/package/config/lxdialog/textbox.c
   trunk/buildroot/package/config/lxdialog/util.c
   trunk/buildroot/package/config/lxdialog/yesno.c
   trunk/buildroot/package/config/mconf.c
   trunk/buildroot/package/config/menu.c
   trunk/buildroot/package/config/symbol.c
   trunk/buildroot/package/config/util.c
   trunk/buildroot/package/config/zconf.l
   trunk/buildroot/package/config/zconf.tab.c_shipped
   trunk/buildroot/package/config/zconf.y


Changeset:

Sorry, the patch is too large to include (18385 lines).
Please use ViewCVS to see it!

http://uclibc.org/cgi-bin/viewcvs.cgi?view=rev&root=svn&rev=18956
