From: Spenser Gilliland <spenser@gillilanding.com>
Date: Mon, 15 Jul 2013 14:47:36 -0500
Subject: [Buildroot] [PATCH 53/67] ussp-push: libglib2 requires threads
In-Reply-To: <1373917670-30006-1-git-send-email-spenser@gillilanding.com>
References: <1373917670-30006-1-git-send-email-spenser@gillilanding.com>
Message-ID: <1373917670-30006-54-git-send-email-spenser@gillilanding.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
---
 package/ussp-push/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/ussp-push/Config.in b/package/ussp-push/Config.in
index 716ce34..27c5a43 100644
--- a/package/ussp-push/Config.in
+++ b/package/ussp-push/Config.in
@@ -3,7 +3,7 @@ config BR2_PACKAGE_USSP_PUSH
 	depends on BR2_INET_IPV6
 	depends on !BR2_avr32
 	depends on BR2_USE_WCHAR # libglib2
-	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus, alsa-lib
+	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus, alsa-lib, libglib2
 	depends on BR2_USE_MMU # dbus
 	select BR2_PACKAGE_OPENOBEX
 	select BR2_PACKAGE_OPENOBEX_BLUEZ
-- 
1.8.1.2
