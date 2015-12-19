From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 19 Dec 2015 17:53:34 +0100
Subject: [Buildroot] [PATCH 1/2] package/libdrm: Remove i386/x86_64
	dependency from Nouveau driver
Message-ID: <1450544015-17658-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libdrm/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/libdrm/Config.in b/package/libdrm/Config.in
index cf1c13b..445a85b 100644
--- a/package/libdrm/Config.in
+++ b/package/libdrm/Config.in
@@ -36,7 +36,6 @@ config BR2_PACKAGE_LIBDRM_AMDGPU
 
 config BR2_PACKAGE_LIBDRM_NOUVEAU
 	bool "nouveau"
-	depends on BR2_i386 || BR2_x86_64
 	help
 	  Install NVIDIA graphics driver.
 
-- 
2.6.4
