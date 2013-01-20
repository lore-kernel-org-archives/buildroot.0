From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 20 Jan 2013 20:51:17 +0100
Subject: [Buildroot] [git commit] packages: remove the last remaining
	copyright notices
Message-ID: <20130120202431.E053D82750@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=26f16d0fcf778562966dfa82b5a768007266d716
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

There is no real reason to keep copyright notices in just four
packages, while none of the other packages have such copyright
notices.

The license is already clearly announced by the COPYING file in the
top Buildroot source directory. The authors are clearly credited
through the Git history of the project.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libsysfs/libsysfs.mk |   17 -----------------
 package/lrzsz/lrzsz.mk       |   18 +-----------------
 package/ncurses/ncurses.mk   |   18 ------------------
 package/tcpdump/tcpdump.mk   |    2 --
 4 files changed, 1 insertions(+), 54 deletions(-)

diff --git a/package/libsysfs/libsysfs.mk b/package/libsysfs/libsysfs.mk
index 04ad695..da4db6f 100644
--- a/package/libsysfs/libsysfs.mk
+++ b/package/libsysfs/libsysfs.mk
@@ -3,23 +3,6 @@
 # libsysfs
 #
 #############################################################
-# Copyright (C) 2001-2003 by Erik Andersen <andersen@codepoet.org>
-# Copyright (C) 2002 by Tim Riker <Tim@Rikers.org>
-#
-# This program is free software; you can redistribute it and/or modify
-# it under the terms of the GNU Library General Public License as
-# published by the Free Software Foundation; either version 2 of the
-# License, or (at your option) any later version.
-#
-# This program is distributed in the hope that it will be useful, but
-# WITHOUT ANY WARRANTY; without even the implied warranty of
-# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
-# Library General Public License for more details.
-#
-# You should have received a copy of the GNU Library General Public
-# License along with this program; if not, write to the Free Software
-# Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307
-# USA
 
 LIBSYSFS_VERSION = 2.1.0
 LIBSYSFS_SITE = http://downloads.sourceforge.net/project/linux-diag/sysfsutils/$(LIBSYSFS_VERSION)
diff --git a/package/lrzsz/lrzsz.mk b/package/lrzsz/lrzsz.mk
index 1f58e63..14545d1 100644
--- a/package/lrzsz/lrzsz.mk
+++ b/package/lrzsz/lrzsz.mk
@@ -3,23 +3,7 @@
 # lrzsz (provides zmodem)
 #
 #############################################################
-# Copyright (C) 2001-2005 by Erik Andersen <andersen@codepoet.org>
-# Copyright (C) 2002 by Tim Riker <Tim@Rikers.org>
-#
-# This program is free software; you can redistribute it and/or modify
-# it under the terms of the GNU Library General Public License as
-# published by the Free Software Foundation; either version 2 of the
-# License, or (at your option) any later version.
-#
-# This program is distributed in the hope that it will be useful, but
-# WITHOUT ANY WARRANTY; without even the implied warranty of
-# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
-# Library General Public License for more details.
-#
-# You should have received a copy of the GNU Library General Public
-# License along with this program; if not, write to the Free Software
-# Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307
-# USA
+
 LRZSZ_VERSION = 0.12.20
 LRZSZ_SITE = http://www.ohse.de/uwe/releases
 LRZSZ_SOURCE = lrzsz-$(LRZSZ_VERSION).tar.gz
diff --git a/package/ncurses/ncurses.mk b/package/ncurses/ncurses.mk
index 4c48e8d..2cfd332 100644
--- a/package/ncurses/ncurses.mk
+++ b/package/ncurses/ncurses.mk
@@ -4,25 +4,7 @@
 # this installs only a few vital termcap entries
 #
 #############################################################
-# Copyright (C) 2002 by Ken Restivo <ken@246gt.com>
-# $Id: ncurses.mk,v 1.7 2005/01/03 04:38:13 andersen Exp $
-#
-# This program is free software; you can redistribute it and/or modify
-# it under the terms of the GNU Library General Public License as
-# published by the Free Software Foundation; either version 2 of the
-# License, or (at your option) any later version.
-#
-# This program is distributed in the hope that it will be useful, but
-# WITHOUT ANY WARRANTY; without even the implied warranty of
-# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
-# Library General Public License for more details.
-#
-# You should have received a copy of the GNU Library General Public
-# License along with this program; if not, write to the Free Software
-# Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307
-# USA
 
-# TARGETS
 NCURSES_VERSION = 5.9
 NCURSES_SITE = $(BR2_GNU_MIRROR)/ncurses
 NCURSES_INSTALL_STAGING = YES
diff --git a/package/tcpdump/tcpdump.mk b/package/tcpdump/tcpdump.mk
index 96414ef..7ca3770 100644
--- a/package/tcpdump/tcpdump.mk
+++ b/package/tcpdump/tcpdump.mk
@@ -3,8 +3,6 @@
 # tcpdump
 #
 #############################################################
-# Copyright (C) 2001-2003 by Erik Andersen <andersen@codepoet.org>
-# Copyright (C) 2002 by Tim Riker <Tim@Rikers.org>
 
 TCPDUMP_VERSION = 4.3.0
 TCPDUMP_SITE = http://www.tcpdump.org/release
