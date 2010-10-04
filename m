From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 4 Oct 2010 11:51:09 +0200
Subject: [Buildroot] [git commit master 1/1] jpeg: remove lgpl header
Message-ID: <20101004100653.0F54B8B8B5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=b808b60b89abf767063172a6c48fab3cc22008f7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Buildroot as a whole is under GPL, so lets not expand each .mk file with
legal matter. The git history nicely shows the origin of each file, and
after the conversion to autotargets there basically isn't anything
left of the original file anymore.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/jpeg/jpeg.mk |   17 -----------------
 1 files changed, 0 insertions(+), 17 deletions(-)

diff --git a/package/jpeg/jpeg.mk b/package/jpeg/jpeg.mk
index 1f408a0..6dd4334 100644
--- a/package/jpeg/jpeg.mk
+++ b/package/jpeg/jpeg.mk
@@ -3,23 +3,6 @@
 # jpeg (libraries needed by some apps)
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
 JPEG_VERSION = 8b
 JPEG_SITE = http://www.ijg.org/files/
 JPEG_SOURCE = jpegsrc.v$(JPEG_VERSION).tar.gz
-- 
1.7.1
