From: Goetz Bock <bock@blacknet.de>
Date: Mon, 20 Nov 2006 16:25:59 +0100
Subject: [Buildroot] patch for e2fsprogs
Message-ID: <20061120152559.GA3065@priv.blacknet.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear list, 

since buildroot is now it's own ML, i post my patches here:

use newer version of e2fsprogs

Index: package/e2fsprogs/e2fsprogs.mk
===================================================================
--- package/e2fsprogs/e2fsprogs.mk      (revision 16570)
+++ package/e2fsprogs/e2fsprogs.mk      (working copy)
@@ -3,7 +3,7 @@
 # e2fsprogs
 #
 #############################################################
-E2FSPROGS_VER:=1.38
+E2FSPROGS_VER:=1.39
 E2FSPROGS_SOURCE=e2fsprogs-$(E2FSPROGS_VER).tar.gz
 E2FSPROGS_SITE=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/
e2fsprogs
 E2FSPROGS_DIR=$(BUILD_DIR)/e2fsprogs-$(E2FSPROGS_VER)


-- 
/"\ Goetz Bock at blacknet dot de  --  secure mobile Linux everNETting
\ /       (c) 2006 Creative Commons, Attribution-ShareAlike 2.0 de
 X   [ 1. Use descriptive subjects - 2. Edit a reply for brevity -  ]
/ \  [ 3. Reply to the list - 4. Read the archive *before* you post ]
