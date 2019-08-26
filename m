From: Nicolas Serafini <nicolas.serafini@sensefly.com>
Date: Mon, 26 Aug 2019 12:11:42 +0000
Subject: [Buildroot] [PATCH] package/exiv2: bump version to 0.27.2
Message-ID: <20190826120935.90923-1-nicolas.serafini@sensefly.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Release notes
https://www.exiv2.org/whatsnew.html

Signed-off-by: Nicolas Serafini <nicolas.serafini@sensefly.com>
---
 package/exiv2/exiv2.hash | 2 +-
 package/exiv2/exiv2.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/exiv2/exiv2.hash b/package/exiv2/exiv2.hash
index b753c03854..e308b51470 100644
--- a/package/exiv2/exiv2.hash
+++ b/package/exiv2/exiv2.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256 1b3766b2c203ce213a4195de14d61694017ec1a69d15d4575bccecef130990fe exiv2-0.27.1.tar.gz
+sha256 3dbcaf01fbc5b98d42f091d1ff0d4b6cd9750dc724de3d9c0d113948570b2934 exiv2-v0.27.2.tar.gz
 sha256 a7ba75cb966aca374711e2af49e5f3aea6a4443a803440f5d93e73a5a1222f66 COPYING
 sha256 46cde7dc11e64c78d650b4851b88f6704b4665ff60f22a1caf68ceb15e217e5b COPYING-CMAKE-SCRIPTS
diff --git a/package/exiv2/exiv2.mk b/package/exiv2/exiv2.mk
index 93af9382db..0f0de6b6dd 100644
--- a/package/exiv2/exiv2.mk
+++ b/package/exiv2/exiv2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EXIV2_VERSION = 0.27.1
+EXIV2_VERSION = v0.27.2
 EXIV2_SITE = $(call github,Exiv2,exiv2,$(EXIV2_VERSION))
 EXIV2_INSTALL_STAGING = YES
 EXIV2_LICENSE = GPL-2.0+, BSD-3-Clause
-- 
2.22.0
