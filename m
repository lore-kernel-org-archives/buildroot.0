From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 29 Nov 2015 14:07:49 +0100
Subject: [Buildroot] [PATCH 2/2] package/tovid: Fix typo
In-Reply-To: <1448802469-18096-1-git-send-email-bernd.kuhls@t-online.de>
References: <1448802469-18096-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1448802469-18096-2-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/tovid/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/tovid/Config.in b/package/tovid/Config.in
index 79eaec4..093bfdf 100644
--- a/package/tovid/Config.in
+++ b/package/tovid/Config.in
@@ -5,7 +5,7 @@ config BR2_PACKAGE_TOVID
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR
 	depends on BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3
-	depends on !nios2 # ffmpeg
+	depends on !BR2_nios2 # ffmpeg
 	depends on BR2_PACKAGE_MPLAYER_ARCH_SUPPORTS
 	# The below dependencies are runtime dependencies only
 	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS # procps_ng
-- 
2.6.2
