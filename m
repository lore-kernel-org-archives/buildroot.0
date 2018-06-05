From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue,  5 Jun 2018 21:41:21 +0200
Subject: [Buildroot] [PATCH 1/1] libsoxr: bump to version 0.1.3
Message-ID: <20180605194121.32234-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add hash for license files

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libsoxr/libsoxr.hash | 8 +++++---
 package/libsoxr/libsoxr.mk   | 2 +-
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/libsoxr/libsoxr.hash b/package/libsoxr/libsoxr.hash
index 066b546e62..1ea0c3ace4 100644
--- a/package/libsoxr/libsoxr.hash
+++ b/package/libsoxr/libsoxr.hash
@@ -1,5 +1,7 @@
 # From http://sourceforge.net/projects/soxr/files/
-sha1  3b990f91dc8dc08e70626cd5fb90deda0239c211  soxr-0.1.2-Source.tar.xz
-md5  0866fc4320e26f47152798ac000de1c0  soxr-0.1.2-Source.tar.xz
+sha1  32ea46b1a8c0c15f835422892d02fce8286aec3c  soxr-0.1.3-Source.tar.xz
+md5  3f16f4dcb35b471682d4321eda6f6c08  soxr-0.1.3-Source.tar.xz
 # Locally calculated
-sha256  54e6f434f1c491388cd92f0e3c47f1ade082cc24327bdc43762f7d1eefe0c275  soxr-0.1.2-Source.tar.xz
+sha256  b111c15fdc8c029989330ff559184198c161100a59312f5dc19ddeb9b5a15889  soxr-0.1.3-Source.tar.xz
+sha256  dc98676341fdcd29d9f279c9679d6a75288785b174ded8d1b2e316c366166135  LICENCE
+sha256  f2f118b9029ec1871b953639ecc46651b2fc7b62e295e6cf3ef2ac4c9a058b33  COPYING.LGPL
diff --git a/package/libsoxr/libsoxr.mk b/package/libsoxr/libsoxr.mk
index c1dc4b0844..5291f9474b 100644
--- a/package/libsoxr/libsoxr.mk
+++ b/package/libsoxr/libsoxr.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBSOXR_VERSION = 0.1.2
+LIBSOXR_VERSION = 0.1.3
 LIBSOXR_SOURCE = soxr-$(LIBSOXR_VERSION)-Source.tar.xz
 LIBSOXR_SITE = http://downloads.sourceforge.net/project/soxr
 LIBSOXR_LICENSE = LGPL-2.1+
-- 
2.14.1
