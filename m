From: Spenser Gilliland <spenser@gillilanding.com>
Date: Thu,  6 Jun 2013 11:47:22 -0500
Subject: [Buildroot] [PATCH 07/14] omap-u-boot-utils: fix github tarball to
	use commit id
In-Reply-To: <1370537249-15682-1-git-send-email-spenser@gillilanding.com>
References: <bug-6302-163@https.bugs.busybox.net/>
 <1370537249-15682-1-git-send-email-spenser@gillilanding.com>
Message-ID: <1370537249-15682-7-git-send-email-spenser@gillilanding.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
---
 package/omap-u-boot-utils/omap-u-boot-utils.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/omap-u-boot-utils/omap-u-boot-utils.mk b/package/omap-u-boot-utils/omap-u-boot-utils.mk
index 8615fdb..9dde813 100644
--- a/package/omap-u-boot-utils/omap-u-boot-utils.mk
+++ b/package/omap-u-boot-utils/omap-u-boot-utils.mk
@@ -5,7 +5,7 @@
 #############################################################
 
 OMAP_U_BOOT_UTILS_VERSION = 8aff852
-OMAP_U_BOOT_UTILS_SITE = http://github.com/nmenon/omap-u-boot-utils/tarball/master
+OMAP_U_BOOT_UTILS_SITE = http://github.com/nmenon/omap-u-boot-utils/tarball/$(OMAP_U_BOOT_UTILS_VERSION)
 OMAP_U_BOOT_UTILS_LICENSE = GPLv2, GPLv2+
 OMAP_U_BOOT_UTILS_LICENSE_FILES = COPYING
 
-- 
1.7.9.5
