From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 9 Nov 2020 17:05:09 +0100
Subject: [Buildroot] [git commit] package/{mesa3d,
 mesa3d-headers}: bump version to 20.2.2
Message-ID: <20201109155530.E529B8138E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=101878cd88f606f7e862d4c51a549025fa019119
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes of this bugfix release::
https://lists.freedesktop.org/archives/mesa-announce/2020-November/000604.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mesa3d-headers/mesa3d-headers.mk | 2 +-
 package/mesa3d/mesa3d.hash               | 6 +++---
 package/mesa3d/mesa3d.mk                 | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index afb2e799c4..12020e6551 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -12,7 +12,7 @@ endif
 
 # Not possible to directly refer to mesa3d variables, because of
 # first/second expansion trickery...
-MESA3D_HEADERS_VERSION = 20.2.1
+MESA3D_HEADERS_VERSION = 20.2.2
 MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
 MESA3D_HEADERS_SITE = https://mesa.freedesktop.org/archive
 MESA3D_HEADERS_DL_SUBDIR = mesa3d
diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
index 287ddc1c0e..7d3a928822 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,6 +1,6 @@
-# From https://lists.freedesktop.org/archives/mesa-announce/2020-October/000602.html
-sha256  d1a46d9a3f291bc0e0374600bdcb59844fa3eafaa50398e472a36fc65fd0244a  mesa-20.2.1.tar.xz
-sha512  5d609359754db3e3679bffd5306c1f1d1cf46a2ea98428a9451fe0d99bbf73da863c5d94e6561712cd2012ad13615666cf3d712e54f379b34c091fead39d4795  mesa-20.2.1.tar.xz
+# From https://lists.freedesktop.org/archives/mesa-announce/2020-November/000604.html
+sha256  1f93eb1090cf71490cd0e204e04f8427a82b6ed534b7f49ca50cea7dcc89b861  mesa-20.2.2.tar.xz
+sha512  36673a44fad8c6db3516b23b75825a52df520b9fe1387160301dd5051f420ebf0d1c7b4f8ff96a5547b79c2ba42fd782305ae23ac956f688b695c07b8fe73192  mesa-20.2.2.tar.xz
 
 # License
 sha256  1361129baa4519b6ed27a1bf4aeee33a58b060bf7bb9b6ea415ecede04e35e46  docs/license.rst
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 620a6eece3..a44d599b03 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update mesa3d-headers
-MESA3D_VERSION = 20.2.1
+MESA3D_VERSION = 20.2.2
 MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
 MESA3D_SITE = https://mesa.freedesktop.org/archive
 MESA3D_LICENSE = MIT, SGI, Khronos
