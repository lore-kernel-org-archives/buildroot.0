From: Petr Vorel <petr.vorel@gmail.com>
Date: Thu, 25 Mar 2021 19:00:23 +0100
Subject: [Buildroot] [PATCH 1/1] package/libmbim: bump version to 1.24.6
Message-ID: <20210325180023.20646-1-petr.vorel@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
 package/libmbim/libmbim.hash | 4 ++--
 package/libmbim/libmbim.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libmbim/libmbim.hash b/package/libmbim/libmbim.hash
index 7ce1a2e7ae..b6a82e367d 100644
--- a/package/libmbim/libmbim.hash
+++ b/package/libmbim/libmbim.hash
@@ -1,4 +1,4 @@
-# Locally computed:
-sha256  dd488ee6176243a6adb27a5872897336272ea7bea33a3ad501ba268e5a58b285  libmbim-1.24.4.tar.xz
+# Locally computed
+sha256  760465caaa1ccd699c14290e9791da456d5300dd11ebf4c1486151033e875dfd  libmbim-1.24.6.tar.xz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
diff --git a/package/libmbim/libmbim.mk b/package/libmbim/libmbim.mk
index 4ce3ca892e..175111381f 100644
--- a/package/libmbim/libmbim.mk
+++ b/package/libmbim/libmbim.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBMBIM_VERSION = 1.24.4
+LIBMBIM_VERSION = 1.24.6
 LIBMBIM_SITE = https://www.freedesktop.org/software/libmbim
 LIBMBIM_SOURCE = libmbim-$(LIBMBIM_VERSION).tar.xz
 LIBMBIM_LICENSE = LGPL-2.0+ (library), GPL-2.0+ (programs)
-- 
2.30.2
