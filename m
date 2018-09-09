From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun,  9 Sep 2018 14:44:18 +0200
Subject: [Buildroot] [PATCH 1/1] e2fsprogs: bump to version 1.44.4
Message-ID: <20180909124418.10869-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/e2fsprogs/e2fsprogs.hash | 4 ++--
 package/e2fsprogs/e2fsprogs.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/e2fsprogs/e2fsprogs.hash b/package/e2fsprogs/e2fsprogs.hash
index 65a6e199c9..71653c933f 100644
--- a/package/e2fsprogs/e2fsprogs.hash
+++ b/package/e2fsprogs/e2fsprogs.hash
@@ -1,5 +1,5 @@
-# From https://www.kernel.org/pub/linux/kernel/people/tytso/e2fsprogs/v1.44.2/sha256sums.asc
-sha256 8324cf0b6e81805a741d94087b00e99f7e16144f1ee5a413709a1fa6948b126c  e2fsprogs-1.44.2.tar.xz
+# From https://www.kernel.org/pub/linux/kernel/people/tytso/e2fsprogs/v1.44.4/sha256sums.asc
+sha256 ee03b2f2180614c5ae5f6dd2666f8808de61c3d8b37d22ba86cc6daea25be55a  e2fsprogs-1.44.4.tar.xz
 # Locally calculated
 sha256 5da5ef153e559c1d990d4c3eedbedd4442db892d37eae1f35fff069de8ec9020  NOTICE
 sha256 032989b508f1a72ebee5b3417e55d06d473f9ee203e45ab11864a7e49cdec63d  lib/ss/mit-sipb-copyright.h
diff --git a/package/e2fsprogs/e2fsprogs.mk b/package/e2fsprogs/e2fsprogs.mk
index fecef118ac..2c5098883a 100644
--- a/package/e2fsprogs/e2fsprogs.mk
+++ b/package/e2fsprogs/e2fsprogs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-E2FSPROGS_VERSION = 1.44.2
+E2FSPROGS_VERSION = 1.44.4
 E2FSPROGS_SOURCE = e2fsprogs-$(E2FSPROGS_VERSION).tar.xz
 E2FSPROGS_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/people/tytso/e2fsprogs/v$(E2FSPROGS_VERSION)
 E2FSPROGS_LICENSE = GPL-2.0, MIT-like with advertising clause (libss and libet)
-- 
2.17.1
