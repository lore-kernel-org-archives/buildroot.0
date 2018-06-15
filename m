From: Petr Vorel <petr.vorel@gmail.com>
Date: Fri, 15 Jun 2018 23:21:25 +0200
Subject: [Buildroot] [PATCH 1/1] network-manager: Fix package prompt name
Message-ID: <20180615212125.22335-1-petr.vorel@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Rename the prompt string for consistency with the package directory
name.

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
 package/network-manager/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/network-manager/Config.in b/package/network-manager/Config.in
index 72658c1278..9602cc4a1a 100644
--- a/package/network-manager/Config.in
+++ b/package/network-manager/Config.in
@@ -1,5 +1,5 @@
 config BR2_PACKAGE_NETWORK_MANAGER
-	bool "networkmanager"
+	bool "network-manager"
 	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS # libgcrypt
 	depends on !BR2_STATIC_LIBS # gnutls
 	depends on BR2_USE_MMU # dbus
-- 
2.17.1
