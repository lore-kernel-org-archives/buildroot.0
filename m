From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 18 Mar 2019 23:00:24 +0100
Subject: [Buildroot] [git commit] package/qt5: bump latest version to 5.12.2
Message-ID: <20190318220252.2CA2C83B8B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0af24710da70b04947229333c9450c86499b3108
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/qt5/qt5.mk                                                    | 2 +-
 package/qt5/qt53d/qt53d.hash                                          | 4 ++--
 .../0001-qtbase-Fix-build-error-when-using-EGL.patch                  | 0
 .../0004-double-conversion-enable-for-microblaze.patch                | 0
 package/qt5/qt5base/{5.12.1 => 5.12.2}/qt5base.hash                   | 4 ++--
 package/qt5/qt5canvas3d/qt5canvas3d.hash                              | 4 ++--
 package/qt5/qt5charts/qt5charts.hash                                  | 4 ++--
 package/qt5/qt5connectivity/{5.12.1 => 5.12.2}/qt5connectivity.hash   | 4 ++--
 .../0001-qsgtexture-fix-debug-build-with-uclibc.patch                 | 0
 package/qt5/qt5declarative/qt5declarative.hash                        | 4 ++--
 package/qt5/qt5graphicaleffects/qt5graphicaleffects.hash              | 4 ++--
 package/qt5/qt5imageformats/qt5imageformats.hash                      | 4 ++--
 package/qt5/qt5location/qt5location.hash                              | 4 ++--
 package/qt5/qt5multimedia/qt5multimedia.hash                          | 4 ++--
 package/qt5/qt5quickcontrols/qt5quickcontrols.hash                    | 4 ++--
 .../qt5/qt5quickcontrols2/{5.12.1 => 5.12.2}/qt5quickcontrols2.hash   | 4 ++--
 package/qt5/qt5script/qt5script.hash                                  | 4 ++--
 package/qt5/qt5scxml/qt5scxml.hash                                    | 4 ++--
 package/qt5/qt5sensors/qt5sensors.hash                                | 4 ++--
 package/qt5/qt5serialbus/{5.12.1 => 5.12.2}/qt5serialbus.hash         | 4 ++--
 package/qt5/qt5serialport/{5.12.1 => 5.12.2}/qt5serialport.hash       | 4 ++--
 package/qt5/qt5svg/qt5svg.hash                                        | 4 ++--
 package/qt5/qt5tools/qt5tools.hash                                    | 4 ++--
 .../qt5/qt5virtualkeyboard/{5.12.1 => 5.12.2}/qt5virtualkeyboard.hash | 4 ++--
 package/qt5/qt5wayland/qt5wayland.hash                                | 4 ++--
 package/qt5/qt5webchannel/qt5webchannel.hash                          | 4 ++--
 package/qt5/qt5webengine/{5.12.1 => 5.12.2}/qt5webengine.hash         | 4 ++--
 package/qt5/qt5websockets/qt5websockets.hash                          | 4 ++--
 package/qt5/qt5x11extras/{5.12.1 => 5.12.2}/qt5x11extras.hash         | 4 ++--
 package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash                        | 4 ++--
 30 files changed, 53 insertions(+), 53 deletions(-)

diff --git a/package/qt5/qt5.mk b/package/qt5/qt5.mk
index d8012a913d..6da898121d 100644
--- a/package/qt5/qt5.mk
+++ b/package/qt5/qt5.mk
@@ -6,7 +6,7 @@
 
 ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
 QT5_VERSION_MAJOR = 5.12
-QT5_VERSION = $(QT5_VERSION_MAJOR).1
+QT5_VERSION = $(QT5_VERSION_MAJOR).2
 QT5_SOURCE_TARBALL_PREFIX = everywhere-src
 else
 QT5_VERSION_MAJOR = 5.6
diff --git a/package/qt5/qt53d/qt53d.hash b/package/qt5/qt53d/qt53d.hash
index f135173bb7..5c0eac7c34 100644
--- a/package/qt5/qt53d/qt53d.hash
+++ b/package/qt5/qt53d/qt53d.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qt3d-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 10d05a30e925fcad971126c7f47a5e32c39f007dab96b298b2094501f9607ffe qt3d-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.1/submodules/qt3d-everywhere-src-5.12.1.tar.xz.sha256
-sha256 ce51ed3fe403672db2c874cbaa60f3a139ec817abd1270dc5e4255d35fd64bf1 qt3d-everywhere-src-5.12.1.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.2/submodules/qt3d-everywhere-src-5.12.2.tar.xz.sha256
+sha256 d4036e7ac146ba78784dde0dd99e8182372b7c38e832e33b61fed4187de0ad06 qt3d-everywhere-src-5.12.2.tar.xz
 
 # Hashes for license files:
 sha256 edfe70e99be2a7c109d860b19204609e582720b211c50caedac729da372a1253 LICENSE.GPL
diff --git a/package/qt5/qt5base/5.12.1/0001-qtbase-Fix-build-error-when-using-EGL.patch b/package/qt5/qt5base/5.12.2/0001-qtbase-Fix-build-error-when-using-EGL.patch
similarity index 100%
rename from package/qt5/qt5base/5.12.1/0001-qtbase-Fix-build-error-when-using-EGL.patch
rename to package/qt5/qt5base/5.12.2/0001-qtbase-Fix-build-error-when-using-EGL.patch
diff --git a/package/qt5/qt5base/5.12.1/0004-double-conversion-enable-for-microblaze.patch b/package/qt5/qt5base/5.12.2/0004-double-conversion-enable-for-microblaze.patch
similarity index 100%
rename from package/qt5/qt5base/5.12.1/0004-double-conversion-enable-for-microblaze.patch
rename to package/qt5/qt5base/5.12.2/0004-double-conversion-enable-for-microblaze.patch
diff --git a/package/qt5/qt5base/5.12.1/qt5base.hash b/package/qt5/qt5base/5.12.2/qt5base.hash
similarity index 81%
rename from package/qt5/qt5base/5.12.1/qt5base.hash
rename to package/qt5/qt5base/5.12.2/qt5base.hash
index 29148fa080..c6758471f6 100644
--- a/package/qt5/qt5base/5.12.1/qt5base.hash
+++ b/package/qt5/qt5base/5.12.2/qt5base.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.1/submodules/qtbase-everywhere-src-5.12.1.tar.xz.sha256
-sha256 533078ce02678988576e224cb3844979907950cf83e0fda3364bc1d5701c9049 qtbase-everywhere-src-5.12.1.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.2/submodules/qtbase-everywhere-src-5.12.2.tar.xz.sha256
+sha256 562c095a59c95f393762ec53bc05c0d80fad1758fd5ff7a5231967d1a98d56c1 qtbase-everywhere-src-5.12.2.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5canvas3d/qt5canvas3d.hash b/package/qt5/qt5canvas3d/qt5canvas3d.hash
index fe31ba3867..fc36119164 100644
--- a/package/qt5/qt5canvas3d/qt5canvas3d.hash
+++ b/package/qt5/qt5canvas3d/qt5canvas3d.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtcanvas3d-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 e99e0e159f2fba539b7947a1921072f6807f20958d32809edbf12aac571f56ff qtcanvas3d-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.1/submodules/qtcanvas3d-everywhere-src-5.12.1.tar.xz.sha256
-sha256 c7c940a06062b1e5078fd697e1da0cdaeaa315b6fcea81de15308a9d3f8ac254 qtcanvas3d-everywhere-src-5.12.1.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.2/submodules/qtcanvas3d-everywhere-src-5.12.2.tar.xz.sha256
+sha256 5e74b083294956505945621f6f56a3d7a314502277a109d6fb6b25c74dea2dca qtcanvas3d-everywhere-src-5.12.2.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5charts/qt5charts.hash b/package/qt5/qt5charts/qt5charts.hash
index 02e01cac2a..5ec0c07790 100644
--- a/package/qt5/qt5charts/qt5charts.hash
+++ b/package/qt5/qt5charts/qt5charts.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtcharts-opensource-src-2.1.3.tar.xz.mirrorlist
 sha256 f636a9b1c255f678f11b36cd73abc807d16dae0c31ecbc75c09524703aae7d2f  qtcharts-opensource-src-2.1.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.1/submodules/qtcharts-everywhere-src-5.12.1.tar.xz.sha256
-sha256 142eb2b87a0bc2220a9f12e56bf390b846968c201d135b1a2a2338545692fdc0 qtcharts-everywhere-src-5.12.1.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.2/submodules/qtcharts-everywhere-src-5.12.2.tar.xz.sha256
+sha256 11d88d3e0ec86730219f7c2efa17f696ec8766415c488b208bfcb8f3c3a68a31 qtcharts-everywhere-src-5.12.2.tar.xz
 
 # Hashes for license files:
 sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903 LICENSE.GPL3
diff --git a/package/qt5/qt5connectivity/5.12.1/qt5connectivity.hash b/package/qt5/qt5connectivity/5.12.2/qt5connectivity.hash
similarity index 74%
rename from package/qt5/qt5connectivity/5.12.1/qt5connectivity.hash
rename to package/qt5/qt5connectivity/5.12.2/qt5connectivity.hash
index a46de7f3c6..180d18f016 100644
--- a/package/qt5/qt5connectivity/5.12.1/qt5connectivity.hash
+++ b/package/qt5/qt5connectivity/5.12.2/qt5connectivity.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.1/submodules/qtconnectivity-everywhere-src-5.12.1.tar.xz.sha256
-sha256 0edd0bd784a71809540dc23d24a842bd88dee2cdb5394b69c9e704f7e1ac8d6c qtconnectivity-everywhere-src-5.12.1.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.2/submodules/qtconnectivity-everywhere-src-5.12.2.tar.xz.sha256
+sha256 15eb21a1c102408e43c7204a82ad144e97ebe05dc4a15edb0900cd49762a226e qtconnectivity-everywhere-src-5.12.2.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5declarative/5.12.1/0001-qsgtexture-fix-debug-build-with-uclibc.patch b/package/qt5/qt5declarative/5.12.2/0001-qsgtexture-fix-debug-build-with-uclibc.patch
similarity index 100%
rename from package/qt5/qt5declarative/5.12.1/0001-qsgtexture-fix-debug-build-with-uclibc.patch
rename to package/qt5/qt5declarative/5.12.2/0001-qsgtexture-fix-debug-build-with-uclibc.patch
diff --git a/package/qt5/qt5declarative/qt5declarative.hash b/package/qt5/qt5declarative/qt5declarative.hash
index d583ab15d5..422b45249f 100644
--- a/package/qt5/qt5declarative/qt5declarative.hash
+++ b/package/qt5/qt5declarative/qt5declarative.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtdeclarative-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 f63fc053d0d16b8a9ca9308f8ead77874b470ae31b66057e2bd336bf648191fc qtdeclarative-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.1/submodules/qtdeclarative-everywhere-src-5.12.1.tar.xz.sha256
-sha256 a384a734d94f28a98aa74e076d50fa6b9724af83526feb6c371945545d8cb409 qtdeclarative-everywhere-src-5.12.1.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.2/submodules/qtdeclarative-everywhere-src-5.12.2.tar.xz.sha256
+sha256 470568745602e7fa21cdca42b1641162e4257cfeb7a2dcf8af24538c9516cc5b qtdeclarative-everywhere-src-5.12.2.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5graphicaleffects/qt5graphicaleffects.hash b/package/qt5/qt5graphicaleffects/qt5graphicaleffects.hash
index e570531629..b46c68542c 100644
--- a/package/qt5/qt5graphicaleffects/qt5graphicaleffects.hash
+++ b/package/qt5/qt5graphicaleffects/qt5graphicaleffects.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtgraphicaleffects-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 c742592d5e45b122b29df60b69be23ba7c817f2dc471db86e054f6ea24a999ed qtgraphicaleffects-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.1/submodules/qtgraphicaleffects-everywhere-src-5.12.1.tar.xz.sha256
-sha256 2e63abf6b02b86461b73b317eba00b6721601a9469c22da28e3f4ea1d5df68d7 qtgraphicaleffects-everywhere-src-5.12.1.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.2/submodules/qtgraphicaleffects-everywhere-src-5.12.2.tar.xz.sha256
+sha256 429398b6c661897b3c7cd62fb3657a2de60ad9152578edeeca0abde6e7ae5a86 qtgraphicaleffects-everywhere-src-5.12.2.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5imageformats/qt5imageformats.hash b/package/qt5/qt5imageformats/qt5imageformats.hash
index 3fd6ba46e5..da656554cb 100644
--- a/package/qt5/qt5imageformats/qt5imageformats.hash
+++ b/package/qt5/qt5imageformats/qt5imageformats.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtimageformats-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 efe4da3c90c976c9b9a2eb6b081d2b8e1435935695104456276ce98e8a5848c3 qtimageformats-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.1/submodules/qtimageformats-everywhere-src-5.12.1.tar.xz.sha256
-sha256 0425f35dbcc83cd5840e2d3a73ed4c57c426af9d6ac7b9fe3a40d23560653421 qtimageformats-everywhere-src-5.12.1.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.2/submodules/qtimageformats-everywhere-src-5.12.2.tar.xz.sha256
+sha256 1ea757728f205deb6b3f5873f5c7c3129cded5993077500a9fb249559bee7a9c qtimageformats-everywhere-src-5.12.2.tar.xz
 
 # Hashes for license files:
 sha256 edfe70e99be2a7c109d860b19204609e582720b211c50caedac729da372a1253 LICENSE.GPLv2
diff --git a/package/qt5/qt5location/qt5location.hash b/package/qt5/qt5location/qt5location.hash
index e79eb611b4..2a52e1f116 100644
--- a/package/qt5/qt5location/qt5location.hash
+++ b/package/qt5/qt5location/qt5location.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtlocation-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 b7a81c58cc331fb15bea8fba21d3c9a59f6dc6ad2e4855e30a14ce59a2af1466 qtlocation-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.1/submodules/qtlocation-everywhere-src-5.12.1.tar.xz.sha256
-sha256 8b922373e6eefd1b0e2a993dbf3d0b3f3df777bc720d40cad3ccb46e1936bc50 qtlocation-everywhere-src-5.12.1.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.2/submodules/qtlocation-everywhere-src-5.12.2.tar.xz.sha256
+sha256 a31f27f457ac57e7203ae808b95ba0053d182e22425de03840af761e343d8bef qtlocation-everywhere-src-5.12.2.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5multimedia/qt5multimedia.hash b/package/qt5/qt5multimedia/qt5multimedia.hash
index 5911c24c3d..8c150cce40 100644
--- a/package/qt5/qt5multimedia/qt5multimedia.hash
+++ b/package/qt5/qt5multimedia/qt5multimedia.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtmultimedia-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 ae36039ea8037742342f1615687e0ca2188f3ed0d700627a5e5be546c15e1b46 qtmultimedia-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.1/submodules/qtmultimedia-everywhere-src-5.12.1.tar.xz.sha256
-sha256 9c5ba11225f57d3a8124f109514443e290a9eb94e063a5b1f78e63edfb5f0b18 qtmultimedia-everywhere-src-5.12.1.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.2/submodules/qtmultimedia-everywhere-src-5.12.2.tar.xz.sha256
+sha256 5d3c90c546e64abf523432a3df5e7a3f1b5ad72e7d0b5ea6260729fbefeb30f5 qtmultimedia-everywhere-src-5.12.2.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5quickcontrols/qt5quickcontrols.hash b/package/qt5/qt5quickcontrols/qt5quickcontrols.hash
index 240f4b4c8c..c7944c89ba 100644
--- a/package/qt5/qt5quickcontrols/qt5quickcontrols.hash
+++ b/package/qt5/qt5quickcontrols/qt5quickcontrols.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtquickcontrols-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 31bb0fc8f21b855af6ff02c415be3246128b523d0ef7c05e248e92281ab0db8e qtquickcontrols-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.1/submodules/qtquickcontrols-everywhere-src-5.12.1.tar.xz.sha256
-sha256 15164b00921352b5145a4fc3be0015b8521138a0cb1ecfb9811f39fd35ecd62c qtquickcontrols-everywhere-src-5.12.1.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.2/submodules/qtquickcontrols-everywhere-src-5.12.2.tar.xz.sha256
+sha256 9b5c87605d08849927dd09bf9b03a939511461372b7e20004abe1116cf9fc73e qtquickcontrols-everywhere-src-5.12.2.tar.xz
 
 # Hashes for license files:
 sha256 edfe70e99be2a7c109d860b19204609e582720b211c50caedac729da372a1253 LICENSE.GPLv2
diff --git a/package/qt5/qt5quickcontrols2/5.12.1/qt5quickcontrols2.hash b/package/qt5/qt5quickcontrols2/5.12.2/qt5quickcontrols2.hash
similarity index 66%
rename from package/qt5/qt5quickcontrols2/5.12.1/qt5quickcontrols2.hash
rename to package/qt5/qt5quickcontrols2/5.12.2/qt5quickcontrols2.hash
index 73cb76b53f..25ae01a67d 100644
--- a/package/qt5/qt5quickcontrols2/5.12.1/qt5quickcontrols2.hash
+++ b/package/qt5/qt5quickcontrols2/5.12.2/qt5quickcontrols2.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.1/submodules/qtquickcontrols2-everywhere-src-5.12.1.tar.xz.sha256
-sha256 caa47b6d771b11c65d595fdd0f0942c3d78cda2884d318e3b1da8ec67155a8e7 qtquickcontrols2-everywhere-src-5.12.1.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.2/submodules/qtquickcontrols2-everywhere-src-5.12.2.tar.xz.sha256
+sha256 1fbd703612a2c0257861e07a2b709f6fbad00cb6df70a1c2c1fafa9de522e549 qtquickcontrols2-everywhere-src-5.12.2.tar.xz
 
 # Hashes for license files:
 sha256 d2cfc059acb4abd8e513cd0a73cd8489f34cbafa7bc34d5d31fb3210821cf8ca LICENSE.GPLv3
diff --git a/package/qt5/qt5script/qt5script.hash b/package/qt5/qt5script/qt5script.hash
index c5458b5517..4683dce90b 100644
--- a/package/qt5/qt5script/qt5script.hash
+++ b/package/qt5/qt5script/qt5script.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtscript-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 f08720dd0e3a70377c1cb7fa3b129e24f4cdedade279e51b67c9271ab470b389 qtscript-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.1/submodules/qtscript-everywhere-src-5.12.1.tar.xz.sha256
-sha256 e5c158fb85799404d20d1ec5dd33a25d5f5736807e1008ce626f666a52c80624 qtscript-everywhere-src-5.12.1.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.2/submodules/qtscript-everywhere-src-5.12.2.tar.xz.sha256
+sha256 f8717d51072b4d4455755ae081e45f23f3d0ce25602f96231dd7703bd818a2e6 qtscript-everywhere-src-5.12.2.tar.xz
 
 # Hashes for license files:
 sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903 LICENSE.GPL3
diff --git a/package/qt5/qt5scxml/qt5scxml.hash b/package/qt5/qt5scxml/qt5scxml.hash
index bd37c9ee8b..437d18891b 100644
--- a/package/qt5/qt5scxml/qt5scxml.hash
+++ b/package/qt5/qt5scxml/qt5scxml.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.1/submodules/qtscxml-everywhere-src-5.12.1.tar.xz.sha256
-sha256 59a2aa1000fe03b0a3eff6fddd21f782e305408fcdd7af1f564a382331cb20b7 qtscxml-everywhere-src-5.12.1.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.2/submodules/qtscxml-everywhere-src-5.12.2.tar.xz.sha256
+sha256 69592542fdf4b2efe6a6378ecb1bfdda9e7f48007e191d7f77a0009e213a8623 qtscxml-everywhere-src-5.12.2.tar.xz
 
 # Hashes for license files:
 
diff --git a/package/qt5/qt5sensors/qt5sensors.hash b/package/qt5/qt5sensors/qt5sensors.hash
index 6f5d02033f..f297d2aa2a 100644
--- a/package/qt5/qt5sensors/qt5sensors.hash
+++ b/package/qt5/qt5sensors/qt5sensors.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtsensors-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 7502d4dc5571865a7eea2a4180c3be396dfb8ce22df4c4f3d7e9ff32ab334973 qtsensors-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.1/submodules/qtsensors-everywhere-src-5.12.1.tar.xz.sha256
-sha256 ebc8b4bcfacf10c3bea3f400da7bf3fc7f44f90fa9eb0320c3b87f17307a63e4 qtsensors-everywhere-src-5.12.1.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.2/submodules/qtsensors-everywhere-src-5.12.2.tar.xz.sha256
+sha256 758a131ad86c4b8b8364e48d659a680ed12d03c091c5ab2958d06b7b0aa2e50c qtsensors-everywhere-src-5.12.2.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5serialbus/5.12.1/qt5serialbus.hash b/package/qt5/qt5serialbus/5.12.2/qt5serialbus.hash
similarity index 71%
rename from package/qt5/qt5serialbus/5.12.1/qt5serialbus.hash
rename to package/qt5/qt5serialbus/5.12.2/qt5serialbus.hash
index 429232c45e..098f05f2bb 100644
--- a/package/qt5/qt5serialbus/5.12.1/qt5serialbus.hash
+++ b/package/qt5/qt5serialbus/5.12.2/qt5serialbus.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.1/submodules/qtserialbus-everywhere-src-5.12.1.tar.xz.sha256
-sha256 97f0c690c77b0e19a8c90e376ecc94d59b21adb20a90179700d1c514a4c50d74 qtserialbus-everywhere-src-5.12.1.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.2/submodules/qtserialbus-everywhere-src-5.12.2.tar.xz.sha256
+sha256 16bfee0be81805d82d4f9c04425b5bc2678ca01fa1617fc72613a893438aaa48 qtserialbus-everywhere-src-5.12.2.tar.xz
 
 # Hashes for license files:
 sha256 edfe70e99be2a7c109d860b19204609e582720b211c50caedac729da372a1253 LICENSE.GPLv2
diff --git a/package/qt5/qt5serialport/5.12.1/qt5serialport.hash b/package/qt5/qt5serialport/5.12.2/qt5serialport.hash
similarity index 74%
rename from package/qt5/qt5serialport/5.12.1/qt5serialport.hash
rename to package/qt5/qt5serialport/5.12.2/qt5serialport.hash
index 6adcaaff61..66ddf16f35 100644
--- a/package/qt5/qt5serialport/5.12.1/qt5serialport.hash
+++ b/package/qt5/qt5serialport/5.12.2/qt5serialport.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.1/submodules/qtserialport-everywhere-src-5.12.1.tar.xz.mirrorlist
-sha256 243b2502283c45f5163d68c3f23c787d46eb0e3ba58f3d9a0560dc7968a6ce19 qtserialport-everywhere-src-5.12.1.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.2/submodules/qtserialport-everywhere-src-5.12.2.tar.xz.mirrorlist
+sha256 72163cedda4c6fa787db8666bec6b5057272dc87bf8de6addba3440dd472bd7f qtserialport-everywhere-src-5.12.2.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5svg/qt5svg.hash b/package/qt5/qt5svg/qt5svg.hash
index ddc059aa99..4f06a21d86 100644
--- a/package/qt5/qt5svg/qt5svg.hash
+++ b/package/qt5/qt5svg/qt5svg.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtsvg-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 100f183517b46554079beabd8d2cabe3070a74dd0a2e64b6a304eac71cfadcec qtsvg-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.1/submodules/qtsvg-everywhere-src-5.12.1.tar.xz.sha256
-sha256 5bc1f744d32c06f5aa4eff33759568106a995ce21fa1326a247dfa5f783f63c8 qtsvg-everywhere-src-5.12.1.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.2/submodules/qtsvg-everywhere-src-5.12.2.tar.xz.sha256
+sha256 ed9f2118a6d33f53e5d9ed18dcd36f252a4fbaf68382a1c4a663ba75b25ae7bd qtsvg-everywhere-src-5.12.2.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5tools/qt5tools.hash b/package/qt5/qt5tools/qt5tools.hash
index 06e2127dba..41c98e733a 100644
--- a/package/qt5/qt5tools/qt5tools.hash
+++ b/package/qt5/qt5tools/qt5tools.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qttools-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 1a63ba838058d73cb540040589b235ded77f76402693decfd6d4d3c75ea67926 qttools-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.1/submodules/qttools-everywhere-src-5.12.1.tar.xz.sha256
-sha256 ab1da4fbd84a9d3873e4ed212a0ae614c6059b8e7dca2f0a599a6f7e61f6cbf3 qttools-everywhere-src-5.12.1.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.2/submodules/qttools-everywhere-src-5.12.2.tar.xz.sha256
+sha256 4aa3a089794ab1c629b666fffb5da4371351a9e85ea691d5d988c2ff63586005 qttools-everywhere-src-5.12.2.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5virtualkeyboard/5.12.1/qt5virtualkeyboard.hash b/package/qt5/qt5virtualkeyboard/5.12.2/qt5virtualkeyboard.hash
similarity index 78%
rename from package/qt5/qt5virtualkeyboard/5.12.1/qt5virtualkeyboard.hash
rename to package/qt5/qt5virtualkeyboard/5.12.2/qt5virtualkeyboard.hash
index 0e6860f3d6..69c947359a 100644
--- a/package/qt5/qt5virtualkeyboard/5.12.1/qt5virtualkeyboard.hash
+++ b/package/qt5/qt5virtualkeyboard/5.12.2/qt5virtualkeyboard.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.1/submodules/qtvirtualkeyboard-everywhere-src-5.12.1.tar.xz.sha256
-sha256 a9e3ed4786d603314144c7ad29a9fdeb6e5c3f2ea5a27f6545cc9777244cd683 qtvirtualkeyboard-everywhere-src-5.12.1.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.2/submodules/qtvirtualkeyboard-everywhere-src-5.12.2.tar.xz.sha256
+sha256 7111de5c78f8a0d29394409727647b90ae5906fd5105c843af98c3ae3804248d qtvirtualkeyboard-everywhere-src-5.12.2.tar.xz
 
 # Hashes for license files:
 sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903 LICENSE.GPL3
diff --git a/package/qt5/qt5wayland/qt5wayland.hash b/package/qt5/qt5wayland/qt5wayland.hash
index 5b898bd3da..2fdcc34382 100644
--- a/package/qt5/qt5wayland/qt5wayland.hash
+++ b/package/qt5/qt5wayland/qt5wayland.hash
@@ -1,8 +1,8 @@
 # hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtwayland-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 5a475278b2db73aa7fa7f3ba6d98d8d72774f5c77e172495007d79f91d09daa3 qtwayland-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.1/submodules/qtwayland-everywhere-src-5.12.1.tar.xz.sha256
-sha256 88f0507628b3697b0d59349d27b5e60a313a3138927722d6cf981089fff02553 qtwayland-everywhere-src-5.12.1.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.2/submodules/qtwayland-everywhere-src-5.12.2.tar.xz.sha256
+sha256 b7840692420d106871433eb1b678277f09927d48ec6eb31a1851ee9c60d9df84 qtwayland-everywhere-src-5.12.2.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5webchannel/qt5webchannel.hash b/package/qt5/qt5webchannel/qt5webchannel.hash
index 1bbb8fbf20..e56c7907eb 100644
--- a/package/qt5/qt5webchannel/qt5webchannel.hash
+++ b/package/qt5/qt5webchannel/qt5webchannel.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtwebchannel-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 8eb1b0ac2286653c7932758c21e7760788a5d7cfd6162da09afa926d5be50713 qtwebchannel-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.1/submodules/qtwebchannel-everywhere-src-5.12.1.tar.xz.sha256
-sha256 40c3e74347c67a9864d0d54f14120555860e4ce529746407325b3cd6e9aeb5bf qtwebchannel-everywhere-src-5.12.1.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.2/submodules/qtwebchannel-everywhere-src-5.12.2.tar.xz.sha256
+sha256 8eb9cff9492937daa1bf5d001e39afec68c310ce5596807345e2a555dcc80b8e qtwebchannel-everywhere-src-5.12.2.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5webengine/5.12.1/qt5webengine.hash b/package/qt5/qt5webengine/5.12.2/qt5webengine.hash
similarity index 99%
rename from package/qt5/qt5webengine/5.12.1/qt5webengine.hash
rename to package/qt5/qt5webengine/5.12.2/qt5webengine.hash
index cf0152b06e..72e3cdbfd2 100644
--- a/package/qt5/qt5webengine/5.12.1/qt5webengine.hash
+++ b/package/qt5/qt5webengine/5.12.2/qt5webengine.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.1/submodules/qtwebengine-everywhere-src-5.12.1.tar.xz.sha256
-sha256 43e91e06bc4a60ef0f91d15ae06425cf9c6b4f7dafe960259a5b013c687c3bd0 qtwebengine-everywhere-src-5.12.1.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.2/submodules/qtwebengine-everywhere-src-5.12.2.tar.xz.sha256
+sha256 082b1d6e60c1be61881bc8533acc67d9688620d6b3a538417f62b27b34ead493 qtwebengine-everywhere-src-5.12.2.tar.xz
 
 # Locally calculated
 sha256 f34787ef0342c614b667186a6ec2f5d6b9d650e30142a2788a589a89743e88e9  LICENSE.Chromium
diff --git a/package/qt5/qt5websockets/qt5websockets.hash b/package/qt5/qt5websockets/qt5websockets.hash
index 3b2f4fa3c3..3f4f438a4d 100644
--- a/package/qt5/qt5websockets/qt5websockets.hash
+++ b/package/qt5/qt5websockets/qt5websockets.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtwebsockets-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 a2439045616c89dfe06333734ff4726075c92e01db6e6b6863bc138e39c028eb qtwebsockets-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.1/submodules/qtwebsockets-everywhere-src-5.12.1.tar.xz.sha256
-sha256 2fd0627916d817599c5f855a97156113ed3625b90b350603be6f668762abfc79 qtwebsockets-everywhere-src-5.12.1.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.2/submodules/qtwebsockets-everywhere-src-5.12.2.tar.xz.sha256
+sha256 ab9ce815b1466abe52910c9b50c0f61df8af74f9521574bb534f7f562d0e8c04 qtwebsockets-everywhere-src-5.12.2.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5x11extras/5.12.1/qt5x11extras.hash b/package/qt5/qt5x11extras/5.12.2/qt5x11extras.hash
similarity index 74%
rename from package/qt5/qt5x11extras/5.12.1/qt5x11extras.hash
rename to package/qt5/qt5x11extras/5.12.2/qt5x11extras.hash
index b065234f4c..1ab741d9e8 100644
--- a/package/qt5/qt5x11extras/5.12.1/qt5x11extras.hash
+++ b/package/qt5/qt5x11extras/5.12.2/qt5x11extras.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.1/submodules/qtx11extras-everywhere-src-5.12.1.tar.xz.mirrorlist
-sha256 08fb1c40e1562d43087368a5efa39569fa1ad52b72d2360f9fc1fe18b00da366 qtx11extras-everywhere-src-5.12.1.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.2/submodules/qtx11extras-everywhere-src-5.12.2.tar.xz.mirrorlist
+sha256 711f39ddc6237787a5522278be235fe3af547a4674bb265e6dff5c2892fe6084 qtx11extras-everywhere-src-5.12.2.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash b/package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash
index f22e4e54ff..1113860644 100644
--- a/package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash
+++ b/package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtxmlpatterns-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 a461ff9f0d7310de9b9904ff9cd34919e958bf4071a6fc7096450b8990ab51f6 qtxmlpatterns-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.1/submodules/qtxmlpatterns-everywhere-src-5.12.1.tar.xz.sha256
-sha256 76988ca9a7a184b9013b8a5864dad150e4603890c7eb7aecad4baad071802ecb qtxmlpatterns-everywhere-src-5.12.1.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.2/submodules/qtxmlpatterns-everywhere-src-5.12.2.tar.xz.sha256
+sha256 2e535ec17b542f2a0b87a9db93284666015cc07b6188894ace7e75104c6d860d qtxmlpatterns-everywhere-src-5.12.2.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
