From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 21 Oct 2017 08:21:55 +0200
Subject: [Buildroot] [git commit] package/{mesa3d,
	mesa3d-headers}: bump version to 17.2.3
Message-ID: <20171021061456.629DF81060@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e749c770a7c58cd63c62df7f53de2fc1d7c0a30a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mesa3d-headers/mesa3d-headers.mk |  2 +-
 package/mesa3d/mesa3d.hash               | 10 +++++-----
 package/mesa3d/mesa3d.mk                 |  2 +-
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index 198f2fa..a978e64 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -12,7 +12,7 @@ endif
 
 # Not possible to directly refer to mesa3d variables, because of
 # first/second expansion trickery...
-MESA3D_HEADERS_VERSION = 17.2.2
+MESA3D_HEADERS_VERSION = 17.2.3
 MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
 MESA3D_HEADERS_SITE = https://mesa.freedesktop.org/archive
 MESA3D_HEADERS_LICENSE = MIT, SGI, Khronos
diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
index d223b11..e4bd8ab 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,5 +1,5 @@
-# From https://lists.freedesktop.org/archives/mesa-announce/2017-October/000363.html
-md5 1a157b5baefb5adf9f4fbb8a6632d74c  mesa-17.2.2.tar.xz
-sha1 d1038ed722031210ee7284a1c88fd6fa68fdb93f  mesa-17.2.2.tar.xz
-sha256 cf522244d6a5a1ecde3fc00e7c96935253fe22f808f064cab98be6f3faa65782  mesa-17.2.2.tar.xz
-sha512 641342c68989b8d801c37e668b012d3b7c4ad43d8ca01b74f8cbb3a1ec25b7390f69fe7ebc84b29dab1c6a4ac01c882ec9fd4a6b331505629461bdbbe6aa3f7e  mesa-17.2.2.tar.xz
+# From https://lists.freedesktop.org/archives/mesa-announce/2017-October/000367.html
+md5 a7dca71afbc7294cb7d505067fd44ef6  mesa-17.2.3.tar.xz
+sha1 c46b8c71fe44e3346323835dc9a44cdfe2bffac7  mesa-17.2.3.tar.xz
+sha256 a0b0ec8f7b24dd044d7ab30a8c7e6d3767521e245f88d4ed5dd93315dc56f837  mesa-17.2.3.tar.xz
+sha512 749a0a46b772974633e405804ace7f509afb79f47811dbbdd390333721d744f2ac64f985ff1fd6c5aa3019b700be70bc1f75f60745ed9f4c5b08a9a8f77dfc76  mesa-17.2.3.tar.xz
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 8769267..dca8d36 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update mesa3d-headers
-MESA3D_VERSION = 17.2.2
+MESA3D_VERSION = 17.2.3
 MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
 MESA3D_SITE = https://mesa.freedesktop.org/archive
 MESA3D_LICENSE = MIT, SGI, Khronos
