From: Francois Perrad <fperrad@gmail.com>
Date: Thu, 16 Nov 2017 18:41:15 +0100
Subject: [Buildroot] [PATCH] luasec: bump to version 0.6
Message-ID: <20171116174115.28916-1-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/luasec/luasec.hash | 2 +-
 package/luasec/luasec.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/luasec/luasec.hash b/package/luasec/luasec.hash
index 1e9f70ad6..9d721ed48 100644
--- a/package/luasec/luasec.hash
+++ b/package/luasec/luasec.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	d2198cc39b3fa55bd5020046742b34093b6efcb619cf4032948b8c8556202a32  luasec-0.5-2.src.rock
+sha256	1d04e2f70bc055348dda3cc3566d27d8408094bc944aa5c6a4ae18bffe5c0007  luasec-0.6-1.src.rock
diff --git a/package/luasec/luasec.mk b/package/luasec/luasec.mk
index b059e1c6e..28c4b2c64 100644
--- a/package/luasec/luasec.mk
+++ b/package/luasec/luasec.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUASEC_VERSION = 0.5-2
+LUASEC_VERSION = 0.6-1
 LUASEC_SUBDIR = luasec
 LUASEC_LICENSE = MIT
 LUASEC_LICENSE_FILES = $(LUASEC_SUBDIR)/LICENSE
-- 
2.11.0
