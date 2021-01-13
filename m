From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 13 Jan 2021 10:34:23 +0100
Subject: [Buildroot] [git commit] package/libdrm: bump version to 2.4.104
Message-ID: <20210113091840.E0A1F876B1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8c06403c7a9dee52aa91cf5cf0590282cdc831d7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libdrm/libdrm.hash | 6 +++---
 package/libdrm/libdrm.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libdrm/libdrm.hash b/package/libdrm/libdrm.hash
index b6a62d4c18..48f6b69481 100644
--- a/package/libdrm/libdrm.hash
+++ b/package/libdrm/libdrm.hash
@@ -1,6 +1,6 @@
-# From https://lists.freedesktop.org/archives/dri-devel/2020-November/285471.html
-sha256  3fe0affdba6460166a7323290c18cf68e9b59edcb520722826cb244e9cb50222  libdrm-2.4.103.tar.xz
-sha512  15b098b962008271400692b6b15ecb7e22676f8698e0220ad969735ac2315ccc737d19558afb6abda82bae15117e5f306c048184a2369f434b85ecaa670ca885  libdrm-2.4.103.tar.xz
+# From https://lists.freedesktop.org/archives/dri-devel/2021-January/293654.html
+sha256  d66ad8b5c2441015ac1333e40137bb803c3bde3612ff040286fcc12158ea1bcb  libdrm-2.4.104.tar.xz
+sha512  0fdbef53e0e7c441c805c95ac55ca2c94f11e8fa18e36b4dc7534c22e2b5bc8eca7283fdf41785da753f98d0b589023111abdba70db7e79837729b1540253d6e  libdrm-2.4.104.tar.xz
 
 # Hash for license file
 sha256  2ece103921b7b5619198b9572fb9242db7bbfa6d3b33f9f93f22e1fb738ed8ac  xf86drm.c
diff --git a/package/libdrm/libdrm.mk b/package/libdrm/libdrm.mk
index 0ff30ee53e..25f8484782 100644
--- a/package/libdrm/libdrm.mk
+++ b/package/libdrm/libdrm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBDRM_VERSION = 2.4.103
+LIBDRM_VERSION = 2.4.104
 LIBDRM_SOURCE = libdrm-$(LIBDRM_VERSION).tar.xz
 LIBDRM_SITE = https://dri.freedesktop.org/libdrm
 LIBDRM_LICENSE = MIT
