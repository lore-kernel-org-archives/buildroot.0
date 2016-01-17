From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Sun, 17 Jan 2016 20:16:58 +0100
Subject: [Buildroot] [PATCH 2/2] package/micropython-lib: bump to version 1.0
In-Reply-To: <1453058218-8701-1-git-send-email-joerg.krause@embedded.rocks>
References: <1453058218-8701-1-git-send-email-joerg.krause@embedded.rocks>
Message-ID: <1453058218-8701-2-git-send-email-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 package/micropython-lib/micropython-lib.hash | 2 +-
 package/micropython-lib/micropython-lib.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/micropython-lib/micropython-lib.hash b/package/micropython-lib/micropython-lib.hash
index 7ab22d5..30d0cf8 100644
--- a/package/micropython-lib/micropython-lib.hash
+++ b/package/micropython-lib/micropython-lib.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 f66bfe0e7d2d61119a5def989f74278f42bee7d04162913ea60d3f2955d65909  micropython-lib-v0.5.tar.gz
+sha256 e659444fadd755c1b5dbff091aa1b23a835e7361da3a32f38774bd39a15937ad  micropython-lib-v1.0.tar.gz
diff --git a/package/micropython-lib/micropython-lib.mk b/package/micropython-lib/micropython-lib.mk
index a4a6cf6..4ed2120 100644
--- a/package/micropython-lib/micropython-lib.mk
+++ b/package/micropython-lib/micropython-lib.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MICROPYTHON_LIB_VERSION = v0.5
+MICROPYTHON_LIB_VERSION = v1.0
 MICROPYTHON_LIB_SITE = $(call github,micropython,micropython-lib,$(MICROPYTHON_LIB_VERSION))
 MICROPYTHON_LIB_LICENSE = Python software foundation license v2 (some modules), MIT (everything else)
 MICROPYTHON_LIB_LICENSE_FILES = LICENSE
-- 
2.7.0
