From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 29 Aug 2019 22:57:47 +0200
Subject: [Buildroot] [git commit branch/2019.05.x] package/mosquitto: fix
 typo in Config.in
Message-ID: <20190829205350.2CB4A88501@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4cc8a921ec525a3a472b9e11acfeae6bdfe33ac3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.05.x

Introduced in ea989ad2b2c2361c47e269dd89cb559edf561db4

Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 22f3c69149f98e18f390fe8f40bd1c9c1b5a24cd)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mosquitto/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/mosquitto/Config.in b/package/mosquitto/Config.in
index 11b6d7891b..c7373d9a84 100644
--- a/package/mosquitto/Config.in
+++ b/package/mosquitto/Config.in
@@ -21,7 +21,7 @@ config BR2_PACKAGE_MOSQUITTO_BROKER
 	  Build and install the mosquitto broker onto target.
 
 comment "mosquitto broker needs a system with MMU"
-	depends on BR2_PACKAGE_MOSQUTTO && !BR2_USE_MMU
+	depends on BR2_PACKAGE_MOSQUITTO && !BR2_USE_MMU
 
 comment "mosquitto needs a toolchain w/ dynamic library"
 	depends on BR2_STATIC_LIBS
