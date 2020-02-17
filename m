From: Aleksander Morgado <aleksander@aleksander.es>
Date: Mon, 17 Feb 2020 12:34:40 +0100
Subject: [Buildroot] [PATCH] package/libmbim: bump to version 1.22.0
Message-ID: <20200217113440.826677-1-aleksander@aleksander.es>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://lists.freedesktop.org/archives/libmbim-devel/2020-January/001102.html

Signed-off-by: Aleksander Morgado <aleksander@aleksander.es>
---
 package/libmbim/libmbim.hash | 2 +-
 package/libmbim/libmbim.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libmbim/libmbim.hash b/package/libmbim/libmbim.hash
index bbf2c63afc..828bea0f92 100644
--- a/package/libmbim/libmbim.hash
+++ b/package/libmbim/libmbim.hash
@@ -1,4 +1,4 @@
 # Locally computed:
-sha256  ac2708a409b09f1f6f1786a8a9e39c36619aa8d6f285ea943daa7a48ea36d3e8  libmbim-1.20.4.tar.xz
+sha256  5c0778eb1cd12c3604523134e55183f5147b0cae71150e875b583768f7aa1f38  libmbim-1.22.0.tar.xz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
diff --git a/package/libmbim/libmbim.mk b/package/libmbim/libmbim.mk
index dc5c9a59de..67cfd2bc0b 100644
--- a/package/libmbim/libmbim.mk
+++ b/package/libmbim/libmbim.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBMBIM_VERSION = 1.20.4
+LIBMBIM_VERSION = 1.22.0
 LIBMBIM_SITE = https://www.freedesktop.org/software/libmbim
 LIBMBIM_SOURCE = libmbim-$(LIBMBIM_VERSION).tar.xz
 LIBMBIM_LICENSE = LGPL-2.0+ (library), GPL-2.0+ (programs)
-- 
2.25.0
