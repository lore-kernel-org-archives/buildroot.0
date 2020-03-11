From: Francois Perrad <fperrad@gmail.com>
Date: Wed, 11 Mar 2020 11:36:00 +0100
Subject: [Buildroot] [PATCH v2 1/2] package/libtommath: bump to version 1.2.0
Message-ID: <20200311103601.6775-1-francois.perrad@gadz.org>
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
index 75aa7c7f1..fa1af5ec2 100644
--- a/package/libtommath/libtommath.hash
+++ b/package/libtommath/libtommath.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256 90466c88783d1fe9f5c2364a69f5479f10d73ed616011be6196f35f7f1537ead  ltm-1.1.0.tar.xz
+sha256 b7c75eecf680219484055fcedd686064409254ae44bc31a96c5032843c0e18b1  ltm-1.2.0.tar.xz
 
 # Hashes for license files:
 sha256 2fa64b163659f41965c9815882a8296d3d03ff546b76153e11445f9bdecf955a  LICENSE
diff --git a/package/libtommath/libtommath.mk b/package/libtommath/libtommath.mk
index 36e7a89e6..bd3957d6c 100644
--- a/package/libtommath/libtommath.mk
+++ b/package/libtommath/libtommath.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBTOMMATH_VERSION = 1.1.0
+LIBTOMMATH_VERSION = 1.2.0
 LIBTOMMATH_SITE = https://github.com/libtom/libtommath/releases/download/v$(LIBTOMMATH_VERSION)
 LIBTOMMATH_SOURCE = ltm-$(LIBTOMMATH_VERSION).tar.xz
 LIBTOMMATH_LICENSE = Unlicense
-- 
2.20.1
