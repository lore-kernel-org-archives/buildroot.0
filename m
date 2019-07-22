From: Petr Vorel <petr.vorel@gmail.com>
Date: Mon, 22 Jul 2019 07:16:27 +0200
Subject: [Buildroot] [PATCH 2/2] system: Add XATTR abbreviation
In-Reply-To: <20190722051627.12993-1-petr.vorel@gmail.com>
References: <20190722051627.12993-1-petr.vorel@gmail.com>
Message-ID: <20190722051627.12993-2-petr.vorel@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

to BR2_ROOTFS_DEVICE_TABLE_SUPPORTS_EXTENDED_ATTRIBUTES

+ capitalize

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
Hi,

you can squash this commit into previous one.

Kind regards,
Petr

 system/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/system/Config.in b/system/Config.in
index 842e745cd3..39f8603639 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -195,7 +195,7 @@ config BR2_ROOTFS_STATIC_DEVICE_TABLE
 	  syntax of these files.
 
 config BR2_ROOTFS_DEVICE_TABLE_SUPPORTS_EXTENDED_ATTRIBUTES
-	bool "support extended attributes in device tables"
+	bool "Support extended attributes (XATTR) in device tables"
 	default y if !BR2_TARGET_ROOTFS_AXFS && !BR2_TARGET_ROOTFS_CRAMFS && !BR2_TARGET_ROOTFS_ISO9660 && !BR2_TARGET_ROOTFS_ROMFS && !BR2_TARGET_ROOTFS_YAFFS2
 	help
 	  Support extended attributes handling in device tables
-- 
2.20.1
