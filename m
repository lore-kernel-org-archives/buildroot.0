From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 13 Nov 2020 21:51:28 +0100
Subject: [Buildroot] [PATCH v2, 1/1] package/qdecoder: bump to version 12.0.8
Message-ID: <20201113205128.615895-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update indentation in hash file (two spaces)

https://github.com/wolkykim/qdecoder/releases/tag/v12.0.8

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2:
 - Fix tarball hash

 package/qdecoder/qdecoder.hash | 4 ++--
 package/qdecoder/qdecoder.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/qdecoder/qdecoder.hash b/package/qdecoder/qdecoder.hash
index 0c95d2c27b..e3fb837597 100644
--- a/package/qdecoder/qdecoder.hash
+++ b/package/qdecoder/qdecoder.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 01d4852b9343757abe98bbdb9d4bf0dc142ccb602ec921906ddde32c16164376  qdecoder-12.0.7.tar.gz
-sha256 17e647523e5c5c75fd02861dcf3ea91a146d918ab303460ee58135c9dd70904e  COPYING
+sha256  3911576ad8766697a9c8c767458edc953ae686eb53cd31d21e38edd7831ed9aa  qdecoder-12.0.8.tar.gz
+sha256  17e647523e5c5c75fd02861dcf3ea91a146d918ab303460ee58135c9dd70904e  COPYING
diff --git a/package/qdecoder/qdecoder.mk b/package/qdecoder/qdecoder.mk
index ab95885c32..12784fc451 100644
--- a/package/qdecoder/qdecoder.mk
+++ b/package/qdecoder/qdecoder.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QDECODER_VERSION = 12.0.7
+QDECODER_VERSION = 12.0.8
 QDECODER_SITE = $(call github,wolkykim,qdecoder,v$(QDECODER_VERSION))
 QDECODER_LICENSE = BSD-2
 QDECODER_LICENSE_FILES = COPYING
-- 
2.28.0
