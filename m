From: Peter Seiderer <ps.report@gmx.net>
Date: Wed, 21 Mar 2018 21:23:12 +0100
Subject: [Buildroot] [PATCH v1 2/2] modem-manager: remove wrong gnutls
 dependency comment
In-Reply-To: <20180321202312.23021-1-ps.report@gmx.net>
References: <20180321202312.23021-1-ps.report@gmx.net>
Message-ID: <20180321202312.23021-2-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/modem-manager/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/modem-manager/Config.in b/package/modem-manager/Config.in
index 8e995b4175..215449a50e 100644
--- a/package/modem-manager/Config.in
+++ b/package/modem-manager/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_MODEM_MANAGER
 	bool "modemmanager"
 	depends on BR2_PACKAGE_HAS_UDEV
-	depends on BR2_USE_WCHAR # libglib2 and gnutls
+	depends on BR2_USE_WCHAR # libglib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus, libglib2
 	depends on BR2_USE_MMU # dbus
 	select BR2_PACKAGE_DBUS # runtime dependency
-- 
2.16.2
