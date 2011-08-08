From: Sven Neumann <s.neumann@raumfeld.com>
Date: Mon,  8 Aug 2011 13:58:09 +0200
Subject: [Buildroot] [PATCH 1/2] util-linux: fix
	BR2_PACKAGE_UTIL_LINUX_UUIDD option
In-Reply-To: <1312804690-21977-1-git-send-email-s.neumann@raumfeld.com>
References: <1312804690-21977-1-git-send-email-s.neumann@raumfeld.com>
Message-ID: <1312804690-21977-2-git-send-email-s.neumann@raumfeld.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Sven Neumann <s.neumann@raumfeld.com>
---
 package/util-linux/util-linux.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index 570a1d1..d34759b 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -35,7 +35,7 @@ UTIL_LINUX_CONF_OPT += \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_FSCK),,--disable-fsck) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_LIBMOUNT),,--disable-libmount) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_LIBUUID),,--disable-libuuid) \
-	$(if $(BR2_PACKAGE_UTIL_LINUX_UUID),,--disable-uuid) \
+	$(if $(BR2_PACKAGE_UTIL_LINUX_UUIDD),,--disable-uuidd) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_LIBBLKID),,--disable-libblkid) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_AGETTY),,--disable-agetty) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_CRAMFS),,--disable-cramfs) \
-- 
1.7.4.1
