From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 11 Jan 2020 11:49:22 +0100
Subject: [Buildroot] [git commit] package/{mesa3d,
 mesa3d-headers}: bump version to 19.3.2
Message-ID: <20200111104019.1BEDE8913A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d2401b8e0e88a7371424448855b17ac39f9f3008
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mesa3d-headers/mesa3d-headers.mk | 2 +-
 package/mesa3d/mesa3d.hash               | 6 +++---
 package/mesa3d/mesa3d.mk                 | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index ef2f81855f..752c9c3c16 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -12,7 +12,7 @@ endif
 
 # Not possible to directly refer to mesa3d variables, because of
 # first/second expansion trickery...
-MESA3D_HEADERS_VERSION = 19.3.1
+MESA3D_HEADERS_VERSION = 19.3.2
 MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
 MESA3D_HEADERS_SITE = https://mesa.freedesktop.org/archive
 MESA3D_HEADERS_DL_SUBDIR = mesa3d
diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
index 791877d210..45b38abf2b 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,6 +1,6 @@
-# From https://lists.freedesktop.org/archives/mesa-announce/2019-December/000564.html
-sha256 cd951db69c56a97ff0570a7ab2c0e39e6c5323f4cd8f4eb8274723e033beae59  mesa-19.3.1.tar.xz
-sha512 338d2e37122ef22cc4e27a2f3c39e23e419703a507ace99383c749a563936c5f0428cce9a68ac80d0bd2ff57be8a55f42aee0ed6d16bf6b77b4e59d428729568  mesa-19.3.1.tar.xz
+# From https://lists.freedesktop.org/archives/mesa-announce/2020-January/000566.html
+sha256 4e3aee324616352bbc7f58d47ab573e10f68cc7719fd045bd6d3abcdd97ee1c1  mesa-19.3.2.tar.xz
+sha512 fb69999fa7a15cd6f2c254fb6e8fe635e56dc49a5c2c762a96c77815cbad77060b8f81a02e67ac9ec58092ab866e080fb928086a5ac1e61c3efe882e5825cd28  mesa-19.3.2.tar.xz
 
 # License
 sha256 d8d662974fc86e2e640362015e42de3fcc161d435a9f2111ecd8561412feca73  docs/license.html
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 92816bf110..f6f276c92d 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update mesa3d-headers
-MESA3D_VERSION = 19.3.1
+MESA3D_VERSION = 19.3.2
 MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
 MESA3D_SITE = https://mesa.freedesktop.org/archive
 MESA3D_LICENSE = MIT, SGI, Khronos
