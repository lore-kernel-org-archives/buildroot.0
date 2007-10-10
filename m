From: Robert P. J. Day <rpjday@mindspring.com>
Date: Wed, 10 Oct 2007 04:59:14 -0400 (EDT)
Subject: [Buildroot] "make distclean" doesn't do a full clean
Message-ID: <Pine.LNX.4.64.0710100447510.10223@localhost.localdomain>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


  probably just the first in a series of beginner-level questions and
observations, but is there a reason that "make distclean" leaves a
fair bit of generated content lying around?

Only in br-svn: .auto.deps
Only in br-svn: .config
Only in br-svn/package/config: buildroot-config
Only in br-svn/package/config: conf
Only in br-svn/package/config: conf.o
Only in br-svn/package/config: .depend
Only in br-svn/package/config: kxgettext.o
Only in br-svn/package/config/lxdialog: checklist.o
Only in br-svn/package/config/lxdialog: inputbox.o
Only in br-svn/package/config/lxdialog: menubox.o
Only in br-svn/package/config/lxdialog: textbox.o
Only in br-svn/package/config/lxdialog: util.o
Only in br-svn/package/config/lxdialog: yesno.o
Only in br-svn/package/config: mconf.o
Only in br-svn/package/config: zconf.tab.o

  shouldn't "make distclean" theoretically clean back to the level of
pristine distribution?

rday

-- 
========================================================================
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry
Waterloo, Ontario, CANADA

http://crashcourse.ca
========================================================================
