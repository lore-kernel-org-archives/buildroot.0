From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Tue, 23 Mar 2021 09:33:12 +0100
Subject: [Buildroot] [PATCH 1/1] package/upmpdcli: bump to version 1.5.11
Message-ID: <20210323083312.286129-1-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From https://www.lesbonscomptes.com/upmpdcli/pages/releases.html:

2021-03-13 upmpdcli 1.5.11
 * Fix rare possible issue with Kazoo volume control

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 package/upmpdcli/upmpdcli.hash | 4 ++--
 package/upmpdcli/upmpdcli.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/upmpdcli/upmpdcli.hash b/package/upmpdcli/upmpdcli.hash
index 176713b89c..20166e44e3 100644
--- a/package/upmpdcli/upmpdcli.hash
+++ b/package/upmpdcli/upmpdcli.hash
@@ -1,5 +1,5 @@
-# From http://www.lesbonscomptes.com/upmpdcli/downloads/upmpdcli-1.5.10.tar.gz.sha256:
-sha256  8d864bf2eb2192a2f6a891f36016df413753247e3879e3553cc1693233604684  upmpdcli-1.5.10.tar.gz
+# From http://www.lesbonscomptes.com/upmpdcli/downloads/upmpdcli-1.5.11.tar.gz.sha256:
+sha256  7c8c6ab866114699405223c60457448dcce35fc13e1e374f68b60eefc55f4f04  upmpdcli-1.5.11.tar.gz
 
 # Hash for license file:
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/upmpdcli/upmpdcli.mk b/package/upmpdcli/upmpdcli.mk
index 867c1abb01..9d3e41881f 100644
--- a/package/upmpdcli/upmpdcli.mk
+++ b/package/upmpdcli/upmpdcli.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UPMPDCLI_VERSION = 1.5.10
+UPMPDCLI_VERSION = 1.5.11
 UPMPDCLI_SITE = http://www.lesbonscomptes.com/upmpdcli/downloads
 UPMPDCLI_LICENSE = LGPL-2.1+
 UPMPDCLI_LICENSE_FILES = COPYING
-- 
2.31.0
