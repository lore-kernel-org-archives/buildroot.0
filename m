From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Thu,  6 Jul 2017 08:50:34 +0200
Subject: [Buildroot] [PATCH] monit: bump to version 5.23.0
Message-ID: <20170706065034.7873-1-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 package/monit/monit.hash | 4 ++--
 package/monit/monit.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/monit/monit.hash b/package/monit/monit.hash
index 8eb02fce66..d20286c07c 100644
--- a/package/monit/monit.hash
+++ b/package/monit/monit.hash
@@ -1,2 +1,2 @@
-# From https://mmonit.com/monit/dist/monit-5.20.0.tar.gz.sha256:
-sha256  ebac395ec50c1ae64d568db1260bc049d0e0e624c00e79d7b1b9a59c2679b98d  monit-5.20.0.tar.gz
+# From https://mmonit.com/monit/dist/monit-5.23.0.tar.gz.sha256:
+sha256  dd39fe3a379c02402ba9c44c201b3ba925ebdc8f04225918820607b6c5d56713  monit-5.23.0.tar.gz
diff --git a/package/monit/monit.mk b/package/monit/monit.mk
index dc202fd4d0..32cef1e9c2 100644
--- a/package/monit/monit.mk
+++ b/package/monit/monit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MONIT_VERSION = 5.20.0
+MONIT_VERSION = 5.23.0
 MONIT_SITE = http://mmonit.com/monit/dist
 MONIT_LICENSE = AGPL-3.0 with OpenSSL exception
 MONIT_LICENSE_FILES = COPYING
-- 
2.13.1
