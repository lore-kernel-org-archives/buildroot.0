From: Petr Vorel <petr.vorel@gmail.com>
Date: Fri,  7 Dec 2018 17:59:12 +0100
Subject: [Buildroot] [PATCH 1/1] libmbim: Bump to version 1.16.2
Message-ID: <20181207165912.3675-1-petr.vorel@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

+ change website to https

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
 package/libmbim/libmbim.hash | 2 +-
 package/libmbim/libmbim.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libmbim/libmbim.hash b/package/libmbim/libmbim.hash
index 9734181a34..9364183080 100644
--- a/package/libmbim/libmbim.hash
+++ b/package/libmbim/libmbim.hash
@@ -1,4 +1,4 @@
 # Locally computed:
-sha256  c8ca50beeddd4b43309df5b698917268303bf176cea58fe4fe53d5bf0e93fac2  libmbim-1.16.0.tar.xz
+sha256  eb494fee2c200daf4f5cc8a40061d24a3dfafe8c59151c95c6a826fd96dcb262  libmbim-1.16.2.tar.xz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
diff --git a/package/libmbim/libmbim.mk b/package/libmbim/libmbim.mk
index 169cdc1dcd..9d74b108ca 100644
--- a/package/libmbim/libmbim.mk
+++ b/package/libmbim/libmbim.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBMBIM_VERSION = 1.16.0
-LIBMBIM_SITE = http://www.freedesktop.org/software/libmbim
+LIBMBIM_VERSION = 1.16.2
+LIBMBIM_SITE = https://www.freedesktop.org/software/libmbim
 LIBMBIM_SOURCE = libmbim-$(LIBMBIM_VERSION).tar.xz
 LIBMBIM_LICENSE = LGPL-2.0+ (library), GPL-2.0+ (programs)
 LIBMBIM_LICENSE_FILES = COPYING COPYING.LIB
-- 
2.19.2
