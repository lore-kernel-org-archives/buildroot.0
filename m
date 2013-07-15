From: Spenser Gilliland <spenser@gillilanding.com>
Date: Mon, 15 Jul 2013 14:46:56 -0500
Subject: [Buildroot] [PATCH 13/67] enlightenment: libglib2 requires threads
In-Reply-To: <1373917670-30006-1-git-send-email-spenser@gillilanding.com>
References: <1373917670-30006-1-git-send-email-spenser@gillilanding.com>
Message-ID: <1373917670-30006-14-git-send-email-spenser@gillilanding.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
---
 package/enlightenment/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/enlightenment/Config.in b/package/enlightenment/Config.in
index 357c72b..f86f271 100644
--- a/package/enlightenment/Config.in
+++ b/package/enlightenment/Config.in
@@ -21,6 +21,7 @@ config BR2_PACKAGE_ENLIGHTENMENT
 	depends on BR2_USE_WCHAR
 	depends on BR2_INSTALL_LIBSTDCPP
 	# libedbus -> dbus
+	# libedbus -> glib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	# libedbus -> dbus
 	depends on BR2_USE_MMU
-- 
1.8.1.2
