From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 1 Aug 2019 00:45:42 +0200
Subject: [Buildroot] [git commit] package/libmodbus: bump to version 3.1.6
Message-ID: <20190731224301.A377E88592@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ccacb5516f5c4ca0fbb289ec4047ae3dec817406
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Contains a fix for issue discovered post-3.1.5.
See changelog:

https://libmodbus.org/2019/urgent-fix-for-last-releases/

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libmodbus/libmodbus.hash | 2 +-
 package/libmodbus/libmodbus.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libmodbus/libmodbus.hash b/package/libmodbus/libmodbus.hash
index 7f9a6e223b..2931f3f3d7 100644
--- a/package/libmodbus/libmodbus.hash
+++ b/package/libmodbus/libmodbus.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  f7a9538f23a8786b1ee62a4b75879b5c0e194e728350de1b741ce7d595970f06  libmodbus-3.1.5.tar.gz
+sha256  d7d9fa94a16edb094e5fdf5d87ae17a0dc3f3e3d687fead81835d9572cf87c16  libmodbus-3.1.6.tar.gz
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LESSER
diff --git a/package/libmodbus/libmodbus.mk b/package/libmodbus/libmodbus.mk
index 8df3ca25bb..584ac75055 100644
--- a/package/libmodbus/libmodbus.mk
+++ b/package/libmodbus/libmodbus.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBMODBUS_VERSION = 3.1.5
+LIBMODBUS_VERSION = 3.1.6
 LIBMODBUS_SITE = http://libmodbus.org/releases
 LIBMODBUS_LICENSE = LGPL-2.1+
 LIBMODBUS_LICENSE_FILES = COPYING.LESSER
