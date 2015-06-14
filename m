From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Sun, 14 Jun 2015 15:07:03 +0200
Subject: [Buildroot] [PATCH 2/2] package/upmpdcli: bump to version 0.11.0
In-Reply-To: <1434287223-19653-1-git-send-email-joerg.krause@embedded.rocks>
References: <1434287223-19653-1-git-send-email-joerg.krause@embedded.rocks>
Message-ID: <1434287223-19653-2-git-send-email-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

upmpdcli 0.11.0 requires libupnpp 0.11.0 and does not build with the previous
version 0.8.6 of libupnpp.

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 package/upmpdcli/upmpdcli.hash | 4 ++--
 package/upmpdcli/upmpdcli.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/upmpdcli/upmpdcli.hash b/package/upmpdcli/upmpdcli.hash
index b3a793b..549945e 100644
--- a/package/upmpdcli/upmpdcli.hash
+++ b/package/upmpdcli/upmpdcli.hash
@@ -1,2 +1,2 @@
-# Hashes from: http://www.lesbonscomptes.com/upmpdcli/downloads/upmpdcli-0.8.6.tar.gz.sha256
-sha256 118d30d7c8ca9f9e94cebdec5cf8c7c619b71252a0dbac2afe30d5c9ff5bda87  upmpdcli-0.8.6.tar.gz
+# Hashes from: http://www.lesbonscomptes.com/upmpdcli/downloads/upmpdcli-0.11.0.tar.gz.sha256
+sha256 0f064b7fe498ee56879e606f48b7bafa42381d25fda6b91ef2cb3677effc85b9  upmpdcli-0.11.0.tar.gz
diff --git a/package/upmpdcli/upmpdcli.mk b/package/upmpdcli/upmpdcli.mk
index a5c6370..5e4d6a8 100644
--- a/package/upmpdcli/upmpdcli.mk
+++ b/package/upmpdcli/upmpdcli.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UPMPDCLI_VERSION = 0.8.6
+UPMPDCLI_VERSION = 0.11.0
 UPMPDCLI_SITE = http://www.lesbonscomptes.com/upmpdcli/downloads
 UPMPDCLI_LICENSE = GPLv2+
 UPMPDCLI_LICENSE_FILES = COPYING
-- 
2.4.3
