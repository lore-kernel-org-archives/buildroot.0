From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 8 Nov 2014 23:12:27 +0100
Subject: [Buildroot] [git commit] package/upmpdcli: bump to version 0.8.6
Message-ID: <20141108230842.E2600B3815@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=130ca7d0c4bdca91774587a4b27a82c9ad33eccf
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: J??rg Krause <jkrause@posteo.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/upmpdcli/upmpdcli.hash |    4 ++--
 package/upmpdcli/upmpdcli.mk   |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/upmpdcli/upmpdcli.hash b/package/upmpdcli/upmpdcli.hash
index 8822aed..b3a793b 100644
--- a/package/upmpdcli/upmpdcli.hash
+++ b/package/upmpdcli/upmpdcli.hash
@@ -1,2 +1,2 @@
-# Hashes from: http://www.lesbonscomptes.com/upmpdcli/downloads/upmpdcli-0.8.5.tar.gz.sha256
-sha256 1903214a6170b1cc3a95d22ed23d0f9c78525721506f000bef846657e7517e4c  upmpdcli-0.8.5.tar.gz
+# Hashes from: http://www.lesbonscomptes.com/upmpdcli/downloads/upmpdcli-0.8.6.tar.gz.sha256
+sha256 118d30d7c8ca9f9e94cebdec5cf8c7c619b71252a0dbac2afe30d5c9ff5bda87  upmpdcli-0.8.6.tar.gz
diff --git a/package/upmpdcli/upmpdcli.mk b/package/upmpdcli/upmpdcli.mk
index a90e8bd..0be4d91 100644
--- a/package/upmpdcli/upmpdcli.mk
+++ b/package/upmpdcli/upmpdcli.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UPMPDCLI_VERSION = 0.8.5
+UPMPDCLI_VERSION = 0.8.6
 UPMPDCLI_SITE = http://www.lesbonscomptes.com/upmpdcli/downloads
 UPMPDCLI_LICENSE = GPLv2+
 UPMPDCLI_LICENSE_FILES = COPYING
