From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Thu,  7 Feb 2013 22:02:34 +0100
Subject: [Buildroot] [PATCH v2 2/4] omap-u-boot-utils: define license
In-Reply-To: <1360270956-8896-1-git-send-email-luca@lucaceresoli.net>
References: <1360270956-8896-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <1360270956-8896-2-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
No change since v1.

 package/omap-u-boot-utils/omap-u-boot-utils.mk |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/omap-u-boot-utils/omap-u-boot-utils.mk b/package/omap-u-boot-utils/omap-u-boot-utils.mk
index bb894a5..8615fdb 100644
--- a/package/omap-u-boot-utils/omap-u-boot-utils.mk
+++ b/package/omap-u-boot-utils/omap-u-boot-utils.mk
@@ -6,6 +6,8 @@
 
 OMAP_U_BOOT_UTILS_VERSION = 8aff852
 OMAP_U_BOOT_UTILS_SITE = http://github.com/nmenon/omap-u-boot-utils/tarball/master
+OMAP_U_BOOT_UTILS_LICENSE = GPLv2, GPLv2+
+OMAP_U_BOOT_UTILS_LICENSE_FILES = COPYING
 
 define HOST_OMAP_U_BOOT_UTILS_BUILD_CMDS
 	$(MAKE) -C $(@D)
-- 
1.7.10.4
