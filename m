From: Goetz Bock <bock@blacknet.de>
Date: Mon, 20 Nov 2006 16:30:45 +0100
Subject: [Buildroot] patch: device-mapper
Message-ID: <20061120153045.GD3065@priv.blacknet.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Use newer version of device mapper:

Index: package/dm/dm.mk
===================================================================
--- package/dm/dm.mk    (revision 16570)
+++ package/dm/dm.mk    (working copy)
@@ -24,7 +24,7 @@
 # USA
 
 DM_BASEVER=1.02
-DM_PATCH=10
+DM_PATCH=12
 DM_VERSION=$(DM_BASEVER).$(DM_PATCH)
 DM_SOURCE:=device-mapper.$(DM_VERSION).tgz
 DM_SITE:=ftp://sources.redhat.com/pub/dm


-- 
/"\ Goetz Bock at blacknet dot de  --  secure mobile Linux everNETting
\ /       (c) 2006 Creative Commons, Attribution-ShareAlike 2.0 de
 X   [ 1. Use descriptive subjects - 2. Edit a reply for brevity -  ]
/ \  [ 3. Reply to the list - 4. Read the archive *before* you post ]
