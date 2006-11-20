From: Goetz Bock <bock@blacknet.de>
Date: Mon, 20 Nov 2006 16:31:50 +0100
Subject: [Buildroot] patch: openvpn
Message-ID: <20061120153150.GE3065@priv.blacknet.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Use more recent version:

Index: package/openvpn/openvpn.mk
===================================================================
--- package/openvpn/openvpn.mk  (revision 16570)
+++ package/openvpn/openvpn.mk  (working copy)
@@ -6,9 +6,9 @@
 # to enable that within busybox
 #
 #############################################################
-OPENVPN_SOURCE:=openvpn-1.5.0.tar.gz
-OPENVPN_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/o
penvpn/
-OPENVPN_DIR:=$(BUILD_DIR)/openvpn-1.5.0
+OPENVPN_SOURCE:=openvpn-2.0.9.tar.gz
+OPENVPN_SITE:=http://openvpn.net/release/
+OPENVPN_DIR:=$(BUILD_DIR)/openvpn-2.0.9
 OPENVPN_CAT:=$(ZCAT)
 OPENVPN_BINARY:=openvpn
 OPENVPN_TARGET_BINARY:=usr/sbin/openvpn


-- 
/"\ Goetz Bock at blacknet dot de  --  secure mobile Linux everNETting
\ /       (c) 2006 Creative Commons, Attribution-ShareAlike 2.0 de
 X   [ 1. Use descriptive subjects - 2. Edit a reply for brevity -  ]
/ \  [ 3. Reply to the list - 4. Read the archive *before* you post ]
