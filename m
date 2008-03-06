From: ninevoltz at uclibc.org <ninevoltz@uclibc.org>
Date: Thu,  6 Mar 2008 10:15:43 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/libgtk2: old_patches
Message-ID: <20080306181543.2275812022A@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ninevoltz
Date: 2008-03-06 10:15:42 -0800 (Thu, 06 Mar 2008)
New Revision: 21206

Log:
updated libgtk2

Added:
   trunk/buildroot/package/libgtk2/libgtk2-2.12.6-libdir-la.patch
   trunk/buildroot/package/libgtk2/libgtk2-2.12.6-no-tests.patch
   trunk/buildroot/package/libgtk2/old_patches/
   trunk/buildroot/package/libgtk2/old_patches/000_gtk+-2.0.6-exportsymbols.patch
   trunk/buildroot/package/libgtk2/old_patches/000_gtk+-2.2.0-buildfix-immodule.patch
   trunk/buildroot/package/libgtk2/old_patches/002_xpmico.patch
   trunk/buildroot/package/libgtk2/old_patches/007_password_char.patch
   trunk/buildroot/package/libgtk2/old_patches/0815_ia32-hack.patch
   trunk/buildroot/package/libgtk2/old_patches/automake-lossage.patch
   trunk/buildroot/package/libgtk2/old_patches/disable-print.patch
   trunk/buildroot/package/libgtk2/old_patches/disable-tooltips.patch
   trunk/buildroot/package/libgtk2/old_patches/gtk+-handhelds.patch
   trunk/buildroot/package/libgtk2/old_patches/gtklabel-resize.patch
   trunk/buildroot/package/libgtk2/old_patches/libdir-la.patch
   trunk/buildroot/package/libgtk2/old_patches/menu-deactivate.patch
   trunk/buildroot/package/libgtk2/old_patches/no-demos.patch
   trunk/buildroot/package/libgtk2/old_patches/no-xwc.patch
   trunk/buildroot/package/libgtk2/old_patches/odd-include-problem.patch
   trunk/buildroot/package/libgtk2/old_patches/run-iconcache.patch
   trunk/buildroot/package/libgtk2/old_patches/scroll-timings.patch
   trunk/buildroot/package/libgtk2/old_patches/single-click.patch
   trunk/buildroot/package/libgtk2/old_patches/small-gtkfilesel.patch
   trunk/buildroot/package/libgtk2/old_patches/spinbutton.patch
   trunk/buildroot/package/libgtk2/old_patches/xsettings.patch

Removed:
   trunk/buildroot/package/libgtk2/000_gtk+-2.0.6-exportsymbols.patch
   trunk/buildroot/package/libgtk2/000_gtk+-2.2.0-buildfix-immodule.patch
   trunk/buildroot/package/libgtk2/002_xpmico.patch
   trunk/buildroot/package/libgtk2/007_password_char.patch
   trunk/buildroot/package/libgtk2/0815_ia32-hack.patch
   trunk/buildroot/package/libgtk2/automake-lossage.patch
   trunk/buildroot/package/libgtk2/disable-print.patch
   trunk/buildroot/package/libgtk2/disable-tooltips.patch
   trunk/buildroot/package/libgtk2/gdk-pixbuf.loaders
   trunk/buildroot/package/libgtk2/gtk+-handhelds.patch
   trunk/buildroot/package/libgtk2/gtk.immodules
   trunk/buildroot/package/libgtk2/gtklabel-resize.patch
   trunk/buildroot/package/libgtk2/libdir-la.patch
   trunk/buildroot/package/libgtk2/menu-deactivate.patch
   trunk/buildroot/package/libgtk2/no-demos.patch
   trunk/buildroot/package/libgtk2/no-xwc.patch
   trunk/buildroot/package/libgtk2/odd-include-problem.patch
   trunk/buildroot/package/libgtk2/run-iconcache.patch
   trunk/buildroot/package/libgtk2/scroll-timings.patch
   trunk/buildroot/package/libgtk2/single-click.patch
   trunk/buildroot/package/libgtk2/small-gtkfilesel.patch
   trunk/buildroot/package/libgtk2/spinbutton.patch
   trunk/buildroot/package/libgtk2/xsettings.patch

Modified:
   trunk/buildroot/package/libgtk2/Config.in
   trunk/buildroot/package/libgtk2/libgtk2.mk


Changeset:

Sorry, the patch is too large to include (3497 lines).
Please use ViewCVS to see it!

http://uclibc.org/cgi-bin/viewcvs.cgi?view=rev&root=svn&rev=21206
