From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Tue, 12 Jan 2021 21:10:17 +0100
Subject: [Buildroot] [PATCH 1/1] package/upmpdcli: bump to version 1.5.8
Message-ID: <20210112201017.237858-1-joerg.krause@embedded.rocks>
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
index b24aec9834..fe8999d471 100644
--- a/package/upmpdcli/upmpdcli.hash
+++ b/package/upmpdcli/upmpdcli.hash
@@ -1,5 +1,5 @@
-# From http://www.lesbonscomptes.com/upmpdcli/downloads/upmpdcli-1.5.5.tar.gz.sha256:
-sha256  45fce9c71a45f1ec0d1cb2924bf7ece444c44a918a0c437c1c768baa3d4a345d  upmpdcli-1.5.5.tar.gz
+# From http://www.lesbonscomptes.com/upmpdcli/downloads/upmpdcli-1.5.8.tar.gz.sha256:
+sha256  802a2ab795841fbb9bfff5fd7951881022f5414ed893a1db704801b999e658a8  upmpdcli-1.5.8.tar.gz
 
 # Hash for license file:
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/upmpdcli/upmpdcli.mk b/package/upmpdcli/upmpdcli.mk
index a987806725..3dc79f8f44 100644
--- a/package/upmpdcli/upmpdcli.mk
+++ b/package/upmpdcli/upmpdcli.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UPMPDCLI_VERSION = 1.5.5
+UPMPDCLI_VERSION = 1.5.8
 UPMPDCLI_SITE = http://www.lesbonscomptes.com/upmpdcli/downloads
 UPMPDCLI_LICENSE = LGPL-2.1+
 UPMPDCLI_LICENSE_FILES = COPYING
-- 
2.30.0
