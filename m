From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 19 Sep 2017 14:04:55 +0200
Subject: [Buildroot] [git commit] package/{mesa3d,
	mesa3d-headers}: bump version to 17.2.1
Message-ID: <20170919123102.241E180748@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e25705ffa9cd3d4daca6ba7b18a1feaeecf05357
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Added all hashes provided by upstream.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mesa3d-headers/mesa3d-headers.mk | 2 +-
 package/mesa3d/mesa3d.hash               | 7 +++++--
 package/mesa3d/mesa3d.mk                 | 2 +-
 3 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index cbea791..eeb4ba7 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -12,7 +12,7 @@ endif
 
 # Not possible to directly refer to mesa3d variables, because of
 # first/second expansion trickery...
-MESA3D_HEADERS_VERSION = 17.2.0
+MESA3D_HEADERS_VERSION = 17.2.1
 MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
 MESA3D_HEADERS_SITE = https://mesa.freedesktop.org/archive
 MESA3D_HEADERS_LICENSE = MIT, SGI, Khronos
diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
index cca595b..2e3f54a 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,2 +1,5 @@
-# From https://www.mesa3d.org/relnotes/17.2.0.html
-sha256 3123448f770eae58bc73e15480e78909defb892f10ab777e9116c9b218094943  mesa-17.2.0.tar.xz
+# From https://lists.freedesktop.org/archives/mesa-announce/2017-September/000359.html
+md5 f53ed38110237d9df5f9198c09ef0ab0  mesa-17.2.1.tar.xz
+sha1 7429e74a0ef12ea9d60b41b2b852898b3da0b238  mesa-17.2.1.tar.xz
+sha256 77385d17827cff24a3bae134342234f2efe7f7f990e778109682571dbbc9ba1e  mesa-17.2.1.tar.xz
+sha512 19a7d6c2e2d439b1c73199bffd4154b42017bccc138be954a893c3b70e885f07988de84dc8aa2aff36e06295e91f0181d5b95372152f6f0f80b7afe4b3846b6a  mesa-17.2.1.tar.xz
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 84ec70e..83c83f1 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update mesa3d-headers
-MESA3D_VERSION = 17.2.0
+MESA3D_VERSION = 17.2.1
 MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
 MESA3D_SITE = https://mesa.freedesktop.org/archive
 MESA3D_LICENSE = MIT, SGI, Khronos
