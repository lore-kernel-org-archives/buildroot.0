From: Francois Perrad <fperrad@gmail.com>
Date: Wed, 30 Aug 2017 18:52:40 +0200
Subject: [Buildroot] [PATCH] libtommath: bump to version 1.0.1
Message-ID: <20170830165240.11426-1-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/libtommath/libtommath.hash | 2 +-
 package/libtommath/libtommath.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libtommath/libtommath.hash b/package/libtommath/libtommath.hash
index fcf2ddc9e..359dfeda3 100644
--- a/package/libtommath/libtommath.hash
+++ b/package/libtommath/libtommath.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256  993a7df9ee091fca430cdde3263df57d88ef62af8103903214da49fc51bbb56c  ltm-1.0.tar.xz
+sha256 47032fb39d698ce4cf9c9c462c198e6b08790ce8203ad1224086b9b978636c69  ltm-1.0.1.tar.xz
diff --git a/package/libtommath/libtommath.mk b/package/libtommath/libtommath.mk
index 2fc8c39c6..8e0b10ca2 100644
--- a/package/libtommath/libtommath.mk
+++ b/package/libtommath/libtommath.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBTOMMATH_VERSION = 1.0
+LIBTOMMATH_VERSION = 1.0.1
 LIBTOMMATH_SITE = https://github.com/libtom/libtommath/releases/download/v$(LIBTOMMATH_VERSION)
 LIBTOMMATH_SOURCE = ltm-$(LIBTOMMATH_VERSION).tar.xz
 LIBTOMMATH_LICENSE = WTFPL
-- 
2.11.0
