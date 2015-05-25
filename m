From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Mon, 25 May 2015 14:12:05 +0200
Subject: [Buildroot] [PATCH 1/1] package/musl: bump to version 1.1.9
Message-ID: <1432555925-23325-1-git-send-email-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 package/musl/musl.hash | 2 +-
 package/musl/musl.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/musl/musl.hash b/package/musl/musl.hash
index 20bb2f8..d6b28e2 100644
--- a/package/musl/musl.hash
+++ b/package/musl/musl.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	fa928506415b9c555977daaf874c190eaf7fbbd16028cc5c5f33a00a83227813	musl-1.1.8.tar.gz
+sha256	00bf7173caf972c88cd07cb0d420c082a2f35efcccc1a81f8909bec2d030283e  musl-1.1.9.tar.gz
diff --git a/package/musl/musl.mk b/package/musl/musl.mk
index 6cba5bb..a089327 100644
--- a/package/musl/musl.mk
+++ b/package/musl/musl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MUSL_VERSION = 1.1.8
+MUSL_VERSION = 1.1.9
 MUSL_SITE = http://www.musl-libc.org/releases
 MUSL_LICENSE = MIT
 MUSL_LICENSE_FILES = COPYRIGHT
-- 
2.4.1
