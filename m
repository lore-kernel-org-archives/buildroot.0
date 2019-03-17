From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 17 Mar 2019 22:49:29 +0100
Subject: [Buildroot] [git commit branch/2018.11.x] package/devmem2: Fix
 DEVMEM2_SITE variable
Message-ID: <20190317214635.DC3158E0C8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=37c66342835db9a04bdebf977aaa2972f00a3f78
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.11.x

The old free-electrons.com URL does not seem to work anymore,
resulting in the package failing to build. Use bootlin.com instead.

Signed-off-by: Xavier Ruppen <xruppen@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 408b48b5c58e478a615e50f94989576c133ea8d1)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/devmem2/Config.in  | 2 +-
 package/devmem2/devmem2.mk | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/devmem2/Config.in b/package/devmem2/Config.in
index 64d6400bd8..1ccb0553b4 100644
--- a/package/devmem2/Config.in
+++ b/package/devmem2/Config.in
@@ -4,4 +4,4 @@ config BR2_PACKAGE_DEVMEM2
 	help
 	  Simple program to read/write from/to any location in memory.
 
-	  http://free-electrons.com/pub/mirror/devmem2.c
+	  http://bootlin.com/pub/mirror/devmem2.c
diff --git a/package/devmem2/devmem2.mk b/package/devmem2/devmem2.mk
index 044e6fa596..e1bbee3b78 100644
--- a/package/devmem2/devmem2.mk
+++ b/package/devmem2/devmem2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DEVMEM2_SITE = http://free-electrons.com/pub/mirror
+DEVMEM2_SITE = http://bootlin.com/pub/mirror
 DEVMEM2_SOURCE = devmem2.c
 DEVMEM2_VERSION = 1
 DEVMEM2_LICENSE = GPL-2.0+
