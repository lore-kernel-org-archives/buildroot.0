From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Fri,  2 Dec 2016 08:34:59 +0100
Subject: [Buildroot] [PATCH] package/upmpdcli: bump version to 1.2.10
Message-ID: <20161202073459.8001-1-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 package/upmpdcli/upmpdcli.hash | 2 +-
 package/upmpdcli/upmpdcli.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/upmpdcli/upmpdcli.hash b/package/upmpdcli/upmpdcli.hash
index 847cdc2..0f9e408 100644
--- a/package/upmpdcli/upmpdcli.hash
+++ b/package/upmpdcli/upmpdcli.hash
@@ -1,2 +1,2 @@
 # Manually calculated:
-sha256  a788796e634e243a5ac11db3b19ea872d2bff4d5fb673d058ab7a683ca029dae  upmpdcli-1.2.8.tar.gz
+sha256  a925dac1721fe002c16ed3c9e2de0370c2fe6c1e6f4f97a7551f20c6226cc0e2  upmpdcli-1.2.10.tar.gz
diff --git a/package/upmpdcli/upmpdcli.mk b/package/upmpdcli/upmpdcli.mk
index 84a8763..d1d6ab4 100644
--- a/package/upmpdcli/upmpdcli.mk
+++ b/package/upmpdcli/upmpdcli.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UPMPDCLI_VERSION = 1.2.8
+UPMPDCLI_VERSION = 1.2.10
 UPMPDCLI_SITE = http://www.lesbonscomptes.com/upmpdcli/downloads
 UPMPDCLI_LICENSE = GPLv2+
 UPMPDCLI_LICENSE_FILES = COPYING
-- 
2.10.2
