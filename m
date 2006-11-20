From: Goetz Bock <bock@blacknet.de>
Date: Mon, 20 Nov 2006 16:29:50 +0100
Subject: [Buildroot] patch: rsync
Message-ID: <20061120152949.GC3065@priv.blacknet.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear list,

the version of rsync used does no longer exist. Patch follows:

Index: package/rsync/rsync.mk
===================================================================
--- package/rsync/rsync.mk      (revision 16570)
+++ package/rsync/rsync.mk      (working copy)
@@ -3,7 +3,7 @@
 # rsync
 #
 #############################################################
-RSYNC_VER:=2.6.8
+RSYNC_VER:=2.6.9
 RSYNC_SOURCE:=rsync-$(RSYNC_VER).tar.gz
 RSYNC_SITE:=http://rsync.samba.org/ftp/rsync/
 RSYNC_DIR:=$(BUILD_DIR)/rsync-$(RSYNC_VER)


-- 
/"\ Goetz Bock at blacknet dot de  --  secure mobile Linux everNETting
\ /       (c) 2006 Creative Commons, Attribution-ShareAlike 2.0 de
 X   [ 1. Use descriptive subjects - 2. Edit a reply for brevity -  ]
/ \  [ 3. Reply to the list - 4. Read the archive *before* you post ]
