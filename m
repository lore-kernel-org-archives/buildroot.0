From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Fri,  6 Apr 2018 22:07:21 +0200
Subject: [Buildroot] [PATCH] upmpdcli: bump to version 1.2.16
Message-ID: <20180406200721.31926-1-joerg.krause@embedded.rocks>
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
index e497352682..c59655c9fe 100644
--- a/package/upmpdcli/upmpdcli.hash
+++ b/package/upmpdcli/upmpdcli.hash
@@ -1,5 +1,5 @@
-# From http://www.lesbonscomptes.com/upmpdcli/downloads/upmpdcli-1.2.15.tar.gz.sha256:
-sha256  93d2b9cfd6cb8643c5a23d4115b44622d76c71abe15db9bb8d5b4d83f4d9b49c  upmpdcli-1.2.15.tar.gz
+# From http://www.lesbonscomptes.com/upmpdcli/downloads/upmpdcli-1.2.16.tar.gz.sha256:
+sha256  b0dfd33cd5c1c2e4f770660c12d7303b6d8b3fdca4f63530c6a235ce279a9d98  upmpdcli-1.2.16.tar.gz
 
 # Hash for license file:
 sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
diff --git a/package/upmpdcli/upmpdcli.mk b/package/upmpdcli/upmpdcli.mk
index ad41f85c8d..069b143998 100644
--- a/package/upmpdcli/upmpdcli.mk
+++ b/package/upmpdcli/upmpdcli.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UPMPDCLI_VERSION = 1.2.15
+UPMPDCLI_VERSION = 1.2.16
 UPMPDCLI_SITE = http://www.lesbonscomptes.com/upmpdcli/downloads
 UPMPDCLI_LICENSE = GPL-2.0+
 UPMPDCLI_LICENSE_FILES = COPYING
-- 
2.17.0
