From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Mon, 30 Aug 2010 16:12:50 +0200
Subject: [Buildroot] [PATCH] Add JFFS2 SREC format description
Message-ID: <AANLkTikFbBJR7sx-7cTXYKry-18PdNr2XAfECaExTTen@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add JFFS2 SREC format description

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>

Index: b/fs/jffs2/Config.in
===================================================================
--- a/fs/jffs2/Config.in	2010-08-27 05:35:03.000000000 -0400
+++ b/fs/jffs2/Config.in	2010-08-30 07:49:13.492634456 -0400
@@ -81,7 +81,9 @@
 	  the pagesize is not a power of 2

 config BR2_JFFS2_TARGET_SREC
-	bool "RootFS in SREC file formet"
+	bool "RootFS in SREC file format"
+	help
+	  The binary data will be encoded in Motorola's S-record format

 config BR2_TARGET_ROOTFS_JFFS2_PAD
 	bool "Pad output"
