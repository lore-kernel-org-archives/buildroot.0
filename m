From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sun, 11 Jan 2009 19:58:52 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/sudo
Message-ID: <20090111195852.CC5BB76736@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2009-01-11 19:58:51 +0000 (Sun, 11 Jan 2009)
New Revision: 24752

Log:
Move SUDO_SITE to ATMEL_MIRROR, No cross-compiler patches for later versions which does not build without, fix installation

Added:
   trunk/buildroot/package/sudo/sudo-1.6.8p12-001-ubuntu6.patch
   trunk/buildroot/package/sudo/sudo-1.6.8p12-002-no-cxx-configcheck.patch
   trunk/buildroot/package/sudo/sudo-1.6.8p12-003-cross-compile.patch

Removed:
   trunk/buildroot/package/sudo/sudo-crosscompile.patch
   trunk/buildroot/package/sudo/sudo_1.6.8p12-1ubuntu6.patch
   trunk/buildroot/package/sudo/sudo_1.6.8p12-2-no-cxx-configcheck.patch

Modified:
   trunk/buildroot/package/sudo/sudo.mk


Changeset:

Sorry, the patch is too large to include (28579 lines).
Please use ViewCVS to see it!

http://uclibc.org/cgi-bin/viewcvs.cgi?view=rev&root=svn&rev=24752
