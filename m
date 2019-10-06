From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  6 Oct 2019 17:53:28 +0200
Subject: [Buildroot] [PATCH 1/1] package/live555: bump version to 2019.09.30
Message-ID: <20191006155328.1198-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Added md5 hash provided by upstream, updated _SITE.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/live555/live555.hash | 4 +++-
 package/live555/live555.mk   | 4 ++--
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/live555/live555.hash b/package/live555/live555.hash
index f8e5b5e68c..f5df69f24f 100644
--- a/package/live555/live555.hash
+++ b/package/live555/live555.hash
@@ -1,3 +1,5 @@
+# From http://www.live555.com/liveMedia/public/live555-latest-md5.txt
+md5 12e105c8fef9d34658d68367dc26a3d9 live.2019.09.30.tar.gz
 # Locally generated
-sha256 0bd0c26d980425d9a419d835193e292a08a968f175da1902da4b495f126d5abd  live.2019.03.06.tar.gz
+sha256 ef44f48a84324525cebc2081dd2d0f1e908f2d0a79d9d30dd41967e142dfb06b  live.2019.09.30.tar.gz
 sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/live555/live555.mk b/package/live555/live555.mk
index 250eea236c..cbe1c1bc0d 100644
--- a/package/live555/live555.mk
+++ b/package/live555/live555.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-LIVE555_VERSION = 2019.03.06
+LIVE555_VERSION = 2019.09.30
 LIVE555_SOURCE = live.$(LIVE555_VERSION).tar.gz
-LIVE555_SITE = http://www.live555.com
+LIVE555_SITE = http://www.live555.com/liveMedia/public
 LIVE555_LICENSE = LGPL-2.1+
 LIVE555_LICENSE_FILES = COPYING
 LIVE555_INSTALL_STAGING = YES
-- 
2.20.1
