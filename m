From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 4 Feb 2019 19:03:30 +0100
Subject: [Buildroot] [git commit] libtommath: bump to version 1.1.0
Message-ID: <20190204180231.E923D8077E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=855a8f057e63d2a888640ccfb2521d7c9ea8b7c2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The library was re-licensed to The Unlicense (https://unlicense.org/),
more details on https://www.libtom.net/news/LTM_1.1.0RC1/

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libtommath/libtommath.hash | 5 ++++-
 package/libtommath/libtommath.mk   | 4 ++--
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/package/libtommath/libtommath.hash b/package/libtommath/libtommath.hash
index 359dfeda3c..75aa7c7f18 100644
--- a/package/libtommath/libtommath.hash
+++ b/package/libtommath/libtommath.hash
@@ -1,2 +1,5 @@
 # Locally computed
-sha256 47032fb39d698ce4cf9c9c462c198e6b08790ce8203ad1224086b9b978636c69  ltm-1.0.1.tar.xz
+sha256 90466c88783d1fe9f5c2364a69f5479f10d73ed616011be6196f35f7f1537ead  ltm-1.1.0.tar.xz
+
+# Hashes for license files:
+sha256 2fa64b163659f41965c9815882a8296d3d03ff546b76153e11445f9bdecf955a  LICENSE
diff --git a/package/libtommath/libtommath.mk b/package/libtommath/libtommath.mk
index ceb2e6846c..36e7a89e6b 100644
--- a/package/libtommath/libtommath.mk
+++ b/package/libtommath/libtommath.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-LIBTOMMATH_VERSION = 1.0.1
+LIBTOMMATH_VERSION = 1.1.0
 LIBTOMMATH_SITE = https://github.com/libtom/libtommath/releases/download/v$(LIBTOMMATH_VERSION)
 LIBTOMMATH_SOURCE = ltm-$(LIBTOMMATH_VERSION).tar.xz
-LIBTOMMATH_LICENSE = WTFPL
+LIBTOMMATH_LICENSE = Unlicense
 LIBTOMMATH_LICENSE_FILES = LICENSE
 LIBTOMMATH_INSTALL_STAGING = YES
 LIBTOMMATH_INSTALL_TARGET = NO  # only static library
