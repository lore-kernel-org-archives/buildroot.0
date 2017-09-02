From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 02 Sep 2017 13:13:43 -0000
Subject: [Buildroot] [git commit] package/{mesa3d,
	mesa3d-headers}: bump version to 17.1.6
Message-ID: <20170902130615.C722980332@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3b713c771cb6be041259f4ccd2e386ecef4906e5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/mesa3d-headers/mesa3d-headers.mk |  2 +-
 package/mesa3d/mesa3d.hash               | 10 +++++-----
 package/mesa3d/mesa3d.mk                 |  2 +-
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index 1356c38..7b9e4b4 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -12,7 +12,7 @@ endif
 
 # Not possible to directly refer to mesa3d variables, because of
 # first/second expansion trickery...
-MESA3D_HEADERS_VERSION = 17.1.5
+MESA3D_HEADERS_VERSION = 17.1.6
 MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
 MESA3D_HEADERS_SITE = https://mesa.freedesktop.org/archive
 MESA3D_HEADERS_LICENSE = MIT, SGI, Khronos
diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
index fb6427a..f2dda20 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,5 +1,5 @@
-# From https://lists.freedesktop.org/archives/mesa-announce/2017-July/000342.html
-md5 6cf936fbcaadd98924298a7009e8265d  mesa-17.1.5.tar.xz
-sha1 709a38eb9ecf54390c303071a016c23c1d4bd64b  mesa-17.1.5.tar.xz
-sha256 378516b171712687aace4c7ea8b37c85895231d7a6d61e1e27362cf6034fded9  mesa-17.1.5.tar.xz
-sha512 a12671afd812b304e1db690b123a9de16332608541f71cc3ee9128a3630c81416d46255e5bdbf19e14e85716b218f447987b555e3bc0081b8b6f392556fa21e2  mesa-17.1.5.tar.xz
+# From https://lists.freedesktop.org/archives/mesa-announce/2017-August/000346.html
+md5 54758bf842f9ea53c8b57cce4311b87e  mesa-17.1.6.tar.xz
+sha1 2acc201e24ea67c5231074d6746a42a747228ed6  mesa-17.1.6.tar.xz
+sha256 0686deadde1f126b20aa67e47e8c50502043eee4ecdf60d5009ffda3cebfee50  mesa-17.1.6.tar.xz
+sha512 cf57f29a21208f0a9bc84157f806bcaf6fd0583352449fcb986b05773eeefc99c4040dc41b242782dd5aa9ff7f9c5312b17a4db82d87f600acf165b6acdfc95a  mesa-17.1.6.tar.xz
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 1654046..e62dfff 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update mesa3d-headers
-MESA3D_VERSION = 17.1.5
+MESA3D_VERSION = 17.1.6
 MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
 MESA3D_SITE = https://mesa.freedesktop.org/archive
 MESA3D_LICENSE = MIT, SGI, Khronos
