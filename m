From: Grant Edwards <grant.b.edwards@gmail.com>
Date: Tue, 16 Mar 2010 20:46:02 +0000 (UTC)
Subject: [Buildroot] make distclean leaves ~200 files under package/config/
Message-ID: <hnoqma$lhv$1@dough.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

After doing a "make distclean", there a couple hundred files under
package/config that seeming shouldn't be there:

  package/config/conf
  package/config/mconf.o
  package/config/.depend
  package/config/zconf.tab.o
  package/config/conf.o
  package/config/kxgettext.o
  package/config/buildroot-config  [contains 190+ files]
  package/config/lxdialog/yesno.o
  package/config/lxdialog/textbox.o
  package/config/lxdialog/inputbox.o
  package/config/lxdialog/checklist.o
  package/config/lxdialog/menubox.o
  package/config/lxdialog/util.o

Shouldn't "make distclean" get rid of those?

-- 
Grant Edwards               grant.b.edwards        Yow! I am covered with
                                  at               pure vegetable oil and I am
                              gmail.com            writing a best seller!
