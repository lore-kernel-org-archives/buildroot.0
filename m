From: Aleksander Morgado <aleksander@aleksander.es>
Date: Mon, 11 Nov 2019 10:20:19 +0100
Subject: [Buildroot] [PATCH] package/libmbim: bump to version 1.20.2
Message-ID: <20191111092019.84917-1-aleksander@aleksander.es>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Aleksander Morgado <aleksander@aleksander.es>
---
 package/libmbim/libmbim.hash | 2 +-
 package/libmbim/libmbim.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libmbim/libmbim.hash b/package/libmbim/libmbim.hash
index 0df4ddfc8d..94021c835a 100644
--- a/package/libmbim/libmbim.hash
+++ b/package/libmbim/libmbim.hash
@@ -1,4 +1,4 @@
 # Locally computed:
-sha256  2cf7c6c7aa9e962a589f61bff2766035b61792ef961131a21fcbbe043f91a866  libmbim-1.20.0.tar.xz
+sha256  550fb69e5e57f7646f8eb9ed8d24e44ea869ad846be9c162893f12e43528059b  libmbim-1.20.2.tar.xz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
diff --git a/package/libmbim/libmbim.mk b/package/libmbim/libmbim.mk
index 2df436bb9e..bd055df372 100644
--- a/package/libmbim/libmbim.mk
+++ b/package/libmbim/libmbim.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBMBIM_VERSION = 1.20.0
+LIBMBIM_VERSION = 1.20.2
 LIBMBIM_SITE = https://www.freedesktop.org/software/libmbim
 LIBMBIM_SOURCE = libmbim-$(LIBMBIM_VERSION).tar.xz
 LIBMBIM_LICENSE = LGPL-2.0+ (library), GPL-2.0+ (programs)
-- 
2.24.0
