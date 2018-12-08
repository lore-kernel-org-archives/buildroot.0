From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 9 Dec 2018 00:15:32 +0100
Subject: [Buildroot] [git commit] libmbim: Bump to version 1.16.2
Message-ID: <20181208231149.6C1E785434@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ef9f55a0cb3f9f99d27d37213eb8c49453d1cde7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

+ change website to https

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
