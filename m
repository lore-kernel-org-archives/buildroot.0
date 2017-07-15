From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 15 Jul 2017 11:36:53 +0200
Subject: [Buildroot] [git commit] package/{mesa3d,
	mesa3d-headers}: bump version to 17.1.5
Message-ID: <20170715093253.356E481E55@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9a3e677548360c63ed55557f8d5e24f9887a700b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mesa3d-headers/mesa3d-headers.mk |  2 +-
 package/mesa3d/mesa3d.hash               | 10 +++++-----
 package/mesa3d/mesa3d.mk                 |  2 +-
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index 0cae180..1356c38 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -12,7 +12,7 @@ endif
 
 # Not possible to directly refer to mesa3d variables, because of
 # first/second expansion trickery...
-MESA3D_HEADERS_VERSION = 17.1.4
+MESA3D_HEADERS_VERSION = 17.1.5
 MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
 MESA3D_HEADERS_SITE = https://mesa.freedesktop.org/archive
 MESA3D_HEADERS_LICENSE = MIT, SGI, Khronos
diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
index 51cc300..fb6427a 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,5 +1,5 @@
-# From https://lists.freedesktop.org/archives/mesa-announce/2017-June/000339.html
-md5 be2ef7c9edec23b07f74f6512a6a6fa5  mesa-17.1.4.tar.xz
-sha1 70a6c971125f754b78e502ade668bd02e46074d6  mesa-17.1.4.tar.xz
-sha256 06f3b0e6a28f0d20b7f3391cf67fe89ae98ecd0a686cd545da76557b6cec9cad  mesa-17.1.4.tar.xz
-sha512 cb8369f0edd3e17b4eee8da159b9dc487f8144d69fe4b95901e9aa6a924759866f26f91fc2ead7036707eecea41582185e7ce73d54f97bf310f198b72ee0a8e4  mesa-17.1.4.tar.xz
+# From https://lists.freedesktop.org/archives/mesa-announce/2017-July/000342.html
+md5 6cf936fbcaadd98924298a7009e8265d  mesa-17.1.5.tar.xz
+sha1 709a38eb9ecf54390c303071a016c23c1d4bd64b  mesa-17.1.5.tar.xz
+sha256 378516b171712687aace4c7ea8b37c85895231d7a6d61e1e27362cf6034fded9  mesa-17.1.5.tar.xz
+sha512 a12671afd812b304e1db690b123a9de16332608541f71cc3ee9128a3630c81416d46255e5bdbf19e14e85716b218f447987b555e3bc0081b8b6f392556fa21e2  mesa-17.1.5.tar.xz
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 7b312e3..1654046 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update mesa3d-headers
-MESA3D_VERSION = 17.1.4
+MESA3D_VERSION = 17.1.5
 MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
 MESA3D_SITE = https://mesa.freedesktop.org/archive
 MESA3D_LICENSE = MIT, SGI, Khronos
