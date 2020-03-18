From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Wed, 18 Mar 2020 09:16:30 +0100
Subject: [Buildroot] [PATCH 1/1] package/luvi: bump to version 2.11.0
Message-ID: <20200318081630.69722-1-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 package/luvi/luvi.hash | 2 +-
 package/luvi/luvi.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/luvi/luvi.hash b/package/luvi/luvi.hash
index 4627db5c5c..f08883c068 100644
--- a/package/luvi/luvi.hash
+++ b/package/luvi/luvi.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  a38e440d3f82d75f428bafc3f3cd51cb64f8a03c9e0eb297b0ff27c5209edebb  luvi-src-v2.9.3.tar.gz
+sha256  ec4eff7aaf2f36879a5fc8eb86706818a75faf07a18451a6fb44e05bbe00817f  luvi-src-v2.11.0.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE.txt
diff --git a/package/luvi/luvi.mk b/package/luvi/luvi.mk
index e311504e96..d6384cb484 100644
--- a/package/luvi/luvi.mk
+++ b/package/luvi/luvi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUVI_VERSION = 2.9.3
+LUVI_VERSION = 2.11.0
 LUVI_SOURCE = luvi-src-v$(LUVI_VERSION).tar.gz
 LUVI_SITE = https://github.com/luvit/luvi/releases/download/v$(LUVI_VERSION)
 LUVI_LICENSE = Apache-2.0
-- 
2.25.2
