From: Adam Duskett <aduskett@gmail.com>
Date: Fri, 21 Apr 2017 11:24:49 -0400
Subject: [Buildroot] [PATCH 4/7] busybox.mk: fix unexpected indent with tabs.
In-Reply-To: <20170421152452.11236-1-aduskett@codeblue.com>
References: <20170421152452.11236-1-aduskett@codeblue.com>
Message-ID: <20170421152452.11236-4-aduskett@codeblue.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Adam Duskett <aduskett@codeblue.com>
---
 package/busybox/busybox.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 9d9fcc2..689830e 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -52,7 +52,7 @@ BUSYBOX_MAKE_OPTS = \
 	SKIP_STRIP=y
 
 ifndef BUSYBOX_CONFIG_FILE
-	BUSYBOX_CONFIG_FILE = $(call qstrip,$(BR2_PACKAGE_BUSYBOX_CONFIG))
+BUSYBOX_CONFIG_FILE = $(call qstrip,$(BR2_PACKAGE_BUSYBOX_CONFIG))
 endif
 
 BUSYBOX_KCONFIG_FILE = $(BUSYBOX_CONFIG_FILE)
-- 
2.9.3
