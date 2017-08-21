From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 21 Aug 2017 23:26:52 +0200
Subject: [Buildroot] [git commit] package/{mesa3d,
	mesa3d-headers}: bump version to 17.1.7
Message-ID: <20170902130618.443C1818F3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7d952d1b050420bf3f1ec39fcb6e8c13ad116e41
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mesa3d-headers/mesa3d-headers.mk |  2 +-
 package/mesa3d/mesa3d.hash               | 10 +++++-----
 package/mesa3d/mesa3d.mk                 |  2 +-
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index 7b9e4b4..0ef08b6 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -12,7 +12,7 @@ endif
 
 # Not possible to directly refer to mesa3d variables, because of
 # first/second expansion trickery...
-MESA3D_HEADERS_VERSION = 17.1.6
+MESA3D_HEADERS_VERSION = 17.1.7
 MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
 MESA3D_HEADERS_SITE = https://mesa.freedesktop.org/archive
 MESA3D_HEADERS_LICENSE = MIT, SGI, Khronos
diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
index f2dda20..b04689b 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,5 +1,5 @@
-# From https://lists.freedesktop.org/archives/mesa-announce/2017-August/000346.html
-md5 54758bf842f9ea53c8b57cce4311b87e  mesa-17.1.6.tar.xz
-sha1 2acc201e24ea67c5231074d6746a42a747228ed6  mesa-17.1.6.tar.xz
-sha256 0686deadde1f126b20aa67e47e8c50502043eee4ecdf60d5009ffda3cebfee50  mesa-17.1.6.tar.xz
-sha512 cf57f29a21208f0a9bc84157f806bcaf6fd0583352449fcb986b05773eeefc99c4040dc41b242782dd5aa9ff7f9c5312b17a4db82d87f600acf165b6acdfc95a  mesa-17.1.6.tar.xz
+# From https://lists.freedesktop.org/archives/mesa-announce/2017-August/000349.html
+md5 e40bb428a263bd28cbf6478dae45b207  mesa-17.1.7.tar.xz
+sha1 dfc7decc37bbad96bb0af8fa6dedae59424a9370  mesa-17.1.7.tar.xz
+sha256 69f472a874b1122404fa0bd13e2d6bf87eb3b9ad9c21d2f39872a96d83d9e5f5  mesa-17.1.7.tar.xz
+sha512 a1cb22b78c74572bef720c132294a028413402520260afff3d46e79f8837dce35aafd8675a8d6834574a4a15ded3611f06dddd5a9fc5882a6dcedab63d0b3e35  mesa-17.1.7.tar.xz
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index e62dfff..71978f8 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update mesa3d-headers
-MESA3D_VERSION = 17.1.6
+MESA3D_VERSION = 17.1.7
 MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
 MESA3D_SITE = https://mesa.freedesktop.org/archive
 MESA3D_LICENSE = MIT, SGI, Khronos
