From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Sat,  5 Mar 2016 17:03:51 +0100
Subject: [Buildroot] [PATCH] package/upmpdcli: bump to version 1.1.2
Message-ID: <1457193831-11587-1-git-send-email-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 package/upmpdcli/upmpdcli.hash | 4 ++--
 package/upmpdcli/upmpdcli.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/upmpdcli/upmpdcli.hash b/package/upmpdcli/upmpdcli.hash
index 07324a7..fac3f66 100644
--- a/package/upmpdcli/upmpdcli.hash
+++ b/package/upmpdcli/upmpdcli.hash
@@ -1,2 +1,2 @@
-# Hashes from: http://www.lesbonscomptes.com/upmpdcli/downloads/upmpdcli-1.1.0.tar.gz.sha256
-sha256  7193488091a204ed691d1f3ce3354e183c8245428a4a7ca8bd032e1a6c48520f  upmpdcli-1.1.0.tar.gz
+# Hashes from: http://www.lesbonscomptes.com/upmpdcli/downloads/upmpdcli-1.1.2.tar.gz.sha256
+sha256  4866a4a5c54f8e3355ca7337860b998e1c8c562a7d26c4d8ae72eefdf9279982  upmpdcli-1.1.2.tar.gz
diff --git a/package/upmpdcli/upmpdcli.mk b/package/upmpdcli/upmpdcli.mk
index 6168595..3c51880 100644
--- a/package/upmpdcli/upmpdcli.mk
+++ b/package/upmpdcli/upmpdcli.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UPMPDCLI_VERSION = 1.1.0
+UPMPDCLI_VERSION = 1.1.2
 UPMPDCLI_SITE = http://www.lesbonscomptes.com/upmpdcli/downloads
 UPMPDCLI_LICENSE = GPLv2+
 UPMPDCLI_LICENSE_FILES = COPYING
-- 
2.7.2
