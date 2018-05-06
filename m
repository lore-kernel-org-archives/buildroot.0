From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 6 May 2018 09:02:35 +0200
Subject: [Buildroot] [git commit] libndp: bump to version 1.6
Message-ID: <20180506071548.1A8778641C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=71e1de6d5d5e613b550ec48bd05ecb150f161b5b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add hash for license file

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libndp/libndp.hash | 3 ++-
 package/libndp/libndp.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/libndp/libndp.hash b/package/libndp/libndp.hash
index 51e312dd79..1861e0b4dd 100644
--- a/package/libndp/libndp.hash
+++ b/package/libndp/libndp.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256 42c0a8938d4302c72a42e2d954deef7e4903bb3974da6804a929a3cd0b5b6aa7  libndp-v1.5.tar.gz
+sha256 565d6c4167f83ec697c762ea002f23e8f0b00828d0749b1ce928f068543e5aad  libndp-v1.6.tar.gz
+sha256 dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/libndp/libndp.mk b/package/libndp/libndp.mk
index 4fa1d3331d..3fd8ac7bf9 100644
--- a/package/libndp/libndp.mk
+++ b/package/libndp/libndp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNDP_VERSION = v1.5
+LIBNDP_VERSION = v1.6
 LIBNDP_SITE = $(call github,jpirko,libndp,$(LIBNDP_VERSION))
 LIBNDP_LICENSE = LGPL-2.1+
 LIBNDP_LICENSE_FILES = COPYING
