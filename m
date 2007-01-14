From: andersen at uclibc.org <andersen@uclibc.org>
Date: Sun, 14 Jan 2007 15:26:16 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/libgtk2
Message-ID: <20070114232616.0B6E148612@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: andersen
Date: 2007-01-14 15:26:15 -0800 (Sun, 14 Jan 2007)
New Revision: 17309

Log:
fix build and ensure we install needed runtime components


Added:
   trunk/buildroot/package/libgtk2/000_gtk+-2.0.6-exportsymbols.patch
   trunk/buildroot/package/libgtk2/000_gtk+-2.2.0-buildfix-immodule.patch
   trunk/buildroot/package/libgtk2/002_xpmico.patch
   trunk/buildroot/package/libgtk2/007_password_char.patch
   trunk/buildroot/package/libgtk2/0815_ia32-hack.patch
   trunk/buildroot/package/libgtk2/gdk-pixbuf.loaders
   trunk/buildroot/package/libgtk2/gtk.immodules
   trunk/buildroot/package/libgtk2/gtklabel-resize.patch
   trunk/buildroot/package/libgtk2/odd-include-problem.patch

Removed:
   trunk/buildroot/package/libgtk2/gtklabel-resize-patch
   trunk/buildroot/package/libgtk2/pangoxft2.10.6.diff

Modified:
   trunk/buildroot/package/libgtk2/libgtk2.mk
   trunk/buildroot/package/libgtk2/run-iconcache.patch


Changeset:

Sorry, the patch is too large to include (3155 lines).
Please use ViewCVS to see it!

http://uclibc.org/cgi-bin/viewcvs.cgi?view=rev&root=svn&rev=17309
