From: Peter Seiderer <ps.report@gmx.net>
Date: Tue, 17 Oct 2017 21:16:54 +0200
Subject: [Buildroot] [PATCH v2 1/2] qt5: add license file hashes for all
	submodules
Message-ID: <20171017191655.17723-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Joshua Henderson <joshua.henderson@microchip.com>

Signed-off-by: Joshua Henderson <joshua.henderson@microchip.com>
Reviewed-by: Peter Seiderer <ps.report@gmx.net>
----
Changes:
  - add reviewed-by and minor commit title change (removed package prefix)
---
 package/qt5/qt53d/qt53d.hash                       |  9 +++++++
 package/qt5/qt5base/5.6.2/qt5base.hash             | 17 ++++++++++++
 package/qt5/qt5base/qt5base.hash                   | 18 +++++++++++++
 package/qt5/qt5canvas3d/qt5canvas3d.hash           |  9 +++++++
 package/qt5/qt5declarative/qt5declarative.hash     | 27 +++++++++++++++++++
 package/qt5/qt5enginio/qt5enginio.hash             | 15 +++++++++++
 .../qt5graphicaleffects/qt5graphicaleffects.hash   | 30 ++++++++++++++++++++++
 package/qt5/qt5imageformats/qt5imageformats.hash   | 21 +++++++++++++++
 package/qt5/qt5location/qt5location.hash           | 21 +++++++++++++++
 package/qt5/qt5multimedia/qt5multimedia.hash       | 27 +++++++++++++++++++
 package/qt5/qt5quickcontrols/qt5quickcontrols.hash | 12 +++++++++
 .../qt5quickcontrols2/5.6.2/qt5quickcontrols2.hash |  8 ++++++
 .../qt5/qt5quickcontrols2/qt5quickcontrols2.hash   |  9 +++++++
 package/qt5/qt5script/qt5script.hash               | 15 +++++++++++
 package/qt5/qt5sensors/qt5sensors.hash             | 30 ++++++++++++++++++++++
 package/qt5/qt5serialbus/qt5serialbus.hash         | 12 +++++++++
 package/qt5/qt5serialport/qt5serialport.hash       | 21 +++++++++++++++
 package/qt5/qt5svg/qt5svg.hash                     | 18 +++++++++++++
 package/qt5/qt5tools/qt5tools.hash                 | 27 +++++++++++++++++++
 .../qt5/qt5virtualkeyboard/qt5virtualkeyboard.hash |  6 +++++
 package/qt5/qt5wayland/qt5wayland.hash             | 27 +++++++++++++++++++
 package/qt5/qt5webchannel/qt5webchannel.hash       | 30 ++++++++++++++++++++++
 package/qt5/qt5webkit/qt5webkit.hash               |  9 +++++++
 package/qt5/qt5websockets/qt5websockets.hash       | 24 +++++++++++++++++
 package/qt5/qt5x11extras/qt5x11extras.hash         | 15 +++++++++++
 package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash     | 21 +++++++++++++++
 26 files changed, 478 insertions(+)
 create mode 100644 package/qt5/qt5base/5.6.2/qt5base.hash
 create mode 100644 package/qt5/qt5quickcontrols2/5.6.2/qt5quickcontrols2.hash

diff --git a/package/qt5/qt53d/qt53d.hash b/package/qt5/qt53d/qt53d.hash
index 5616dcba73..8d1324a08a 100644
--- a/package/qt5/qt53d/qt53d.hash
+++ b/package/qt5/qt53d/qt53d.hash
@@ -3,3 +3,12 @@ sha256 a21786db6e0f5c6c70213fe1a3530ed3d7f28f28401a0f793970e9bc860ce941 qt3d-ope
 
 # Hash from: http://download.qt.io/official_releases/qt/5.9/5.9.1/submodules/qt3d-opensource-src-5.9.1.tar.xz.mirrorlist
 sha256 4f1fe5b812d78987341b854e7f2907f0375dc188cfa6cf9db101b26e9dfd4996 qt3d-opensource-src-5.9.1.tar.xz
+
+# Hash for license file:
+sha256 edfe70e99be2a7c109d860b19204609e582720b211c50caedac729da372a1253  LICENSE.GPL
+
+# Hash for license file:
+sha256 245248009fd0af1725d183248380e476c1283383909358a13686606352bf2a17  LICENSE.GPLv3
+
+# Hash for license file:
+sha256 9ae1959e86bd49b9680f78e0b49d4e52ae88a3f234d497e175e42a7e8ed59216  LICENSE.LGPLv3
diff --git a/package/qt5/qt5base/5.6.2/qt5base.hash b/package/qt5/qt5base/5.6.2/qt5base.hash
new file mode 100644
index 0000000000..3f6cd80a8a
--- /dev/null
+++ b/package/qt5/qt5base/5.6.2/qt5base.hash
@@ -0,0 +1,17 @@
+# Hash for license file:
+sha256 245248009fd0af1725d183248380e476c1283383909358a13686606352bf2a17  LICENSE.GPLv3
+
+# Hash for license file:
+sha256 66f6bb53f6d985a4d651bf1ecfe8bbcbe32b0f744708d588f047580ee85d8ec8  LICENSE.LGPLv21
+
+# Hash for license file:
+sha256 438c1f9a2b256e47dac33249f2ad6d4a9df643f1ec5312216d528a2f7ad82084  LGPL_EXCEPTION.txt
+
+# Hash for license file:
+sha256 68afaf3392f8c04218fbf29db43cc0b18bf651c1db086556aa584046de9f3e35  LICENSE.LGPLv3
+
+# Hash for license file:
+sha256 ed8742a95cb9db653a09b050e27ccff5e67ba69c14aa2c3137f2a4e1892f6c0d  LICENSE.FDL
+
+# Hash for license file:
+sha256 1d05f2662f0be7544c4cc238d0957d1ed5d0edc45210e9108f905df354241a0e  header.BSD
diff --git a/package/qt5/qt5base/qt5base.hash b/package/qt5/qt5base/qt5base.hash
index 5d8670159a..68f53e4da2 100644
--- a/package/qt5/qt5base/qt5base.hash
+++ b/package/qt5/qt5base/qt5base.hash
@@ -3,3 +3,21 @@ sha256 2f6eae93c5d982fe0a387a01aeb3435571433e23e9d9d9246741faf51f1ee787 qtbase-o
 
 # Hash from: http://download.qt.io/official_releases/qt/5.9/5.9.1/submodules/qtbase-opensource-src-5.9.1.tar.xz.mirrorlist
 sha256 bc9a21e9f6fff9629019fdf9f989f064751d5073c3a28dc596def92f4d4275c6 qtbase-opensource-src-5.9.1.tar.xz
+
+# Hash for license file:
+sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.GPL2
+
+# Hash for license file:
+sha256 245248009fd0af1725d183248380e476c1283383909358a13686606352bf2a17  LICENSE.GPLv3
+
+# Hash for license file:
+sha256 0dbe024961f6ab5c52689cbd036c977975d0d0f6a67ff97762d96cb819dd5652  LICENSE.GPL3-EXCEPT
+
+# Hash for license file:
+sha256 68afaf3392f8c04218fbf29db43cc0b18bf651c1db086556aa584046de9f3e35  LICENSE.LGPLv3
+
+# Hash for license file:
+sha256 ed8742a95cb9db653a09b050e27ccff5e67ba69c14aa2c3137f2a4e1892f6c0d  LICENSE.FDL
+
+# Hash for license file:
+sha256 8fdefa0b45d9f791f687da6c2c4c83c1b701aaee2c08008f55d522af214b88f0  header.BSD
diff --git a/package/qt5/qt5canvas3d/qt5canvas3d.hash b/package/qt5/qt5canvas3d/qt5canvas3d.hash
index 81386e0fdd..08e25c1cfb 100644
--- a/package/qt5/qt5canvas3d/qt5canvas3d.hash
+++ b/package/qt5/qt5canvas3d/qt5canvas3d.hash
@@ -3,3 +3,12 @@ sha256 d7584d006b03f99692ccabce922e755a6f12bb1ed1fbc99c2b84842b9e0aa0ad qtcanvas
 
 # Hash from: http://download.qt.io/official_releases/qt/5.9/5.9.1/submodules/qtcanvas3d-opensource-src-5.9.1.tar.xz.mirrorlist
 sha256 4b8bf09330f03d2b3998f5447991546704715478c54f4f8d82d00bee3047de81 qtcanvas3d-opensource-src-5.9.1.tar.xz
+
+# Hash for license file:
+sha256 edfe70e99be2a7c109d860b19204609e582720b211c50caedac729da372a1253  LICENSE.GPLv2
+
+# Hash for license file:
+sha256 245248009fd0af1725d183248380e476c1283383909358a13686606352bf2a17  LICENSE.GPLv3
+
+# Hash for license file:
+sha256 5ceb37d1c7c1d92878b82af3c0fd5558087f3d5a08a3a4d43850bad4ad265a52  LICENSE.LGPLv3
diff --git a/package/qt5/qt5declarative/qt5declarative.hash b/package/qt5/qt5declarative/qt5declarative.hash
index 76f3f0227c..21c90cd552 100644
--- a/package/qt5/qt5declarative/qt5declarative.hash
+++ b/package/qt5/qt5declarative/qt5declarative.hash
@@ -3,3 +3,30 @@ sha256 0086a986bc36b398ba518c404d08cdff0a0d7978c30aa3fa2ab73d71654209da qtdeclar
 
 # Hash from: http://download.qt.io/official_releases/qt/5.9/5.9.1/submodules/qtdeclarative-opensource-src-5.9.1.tar.xz.mirrorlist
 sha256 d2fe6c9c1a9f19af6e96553c6d75366ab8f397bc232acd67d31476955fee94ff qtdeclarative-opensource-src-5.9.1.tar.xz
+
+# Hash for license file:
+sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.GPL2
+
+# Hash for license file:
+sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSE.GPL3
+
+# Hash for license file:
+sha256 0dbe024961f6ab5c52689cbd036c977975d0d0f6a67ff97762d96cb819dd5652  LICENSE.GPL3-EXCEPT
+
+# Hash for license file:
+sha256 da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  LICENSE.LGPL3
+
+# Hash for license file:
+sha256 ed8742a95cb9db653a09b050e27ccff5e67ba69c14aa2c3137f2a4e1892f6c0d  LICENSE.FDL
+
+# Hash for license file:
+sha256 245248009fd0af1725d183248380e476c1283383909358a13686606352bf2a17  LICENSE.GPLv3
+
+# Hash for license file:
+sha256 1996a36160b2158c2be264d2ddfa6148ebe0f1ececff55aca8d754a1ddcc7bb8  LICENSE.LGPLv21
+
+# Hash for license file:
+sha256 438c1f9a2b256e47dac33249f2ad6d4a9df643f1ec5312216d528a2f7ad82084  LGPL_EXCEPTION.txt
+
+# Hash for license file:
+sha256 5ceb37d1c7c1d92878b82af3c0fd5558087f3d5a08a3a4d43850bad4ad265a52  LICENSE.LGPLv3
diff --git a/package/qt5/qt5enginio/qt5enginio.hash b/package/qt5/qt5enginio/qt5enginio.hash
index 995183484c..571cce5694 100644
--- a/package/qt5/qt5enginio/qt5enginio.hash
+++ b/package/qt5/qt5enginio/qt5enginio.hash
@@ -1,2 +1,17 @@
 # Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.2/submodules/qtenginio-opensource-src-1.6.2.tar.xz.mirrorlist
 sha256 90ffc38d214a75ab0ef90a4760843f12bc073ae49c17de24c677d1d403bddcc3 qtenginio-opensource-src-1.6.2.tar.xz
+
+# Hash for license file:
+sha256 245248009fd0af1725d183248380e476c1283383909358a13686606352bf2a17  LICENSE.GPLv3
+
+# Hash for license file:
+sha256 1996a36160b2158c2be264d2ddfa6148ebe0f1ececff55aca8d754a1ddcc7bb8  LICENSE.LGPLv21
+
+# Hash for license file:
+sha256 438c1f9a2b256e47dac33249f2ad6d4a9df643f1ec5312216d528a2f7ad82084  LGPL_EXCEPTION.txt
+
+# Hash for license file:
+sha256 5ceb37d1c7c1d92878b82af3c0fd5558087f3d5a08a3a4d43850bad4ad265a52  LICENSE.LGPLv3
+
+# Hash for license file:
+sha256 f827ad079686ba92cc94811e35492d0e8966f704008b6da9eeda0b659fb58a8d  LICENSE.FDL
diff --git a/package/qt5/qt5graphicaleffects/qt5graphicaleffects.hash b/package/qt5/qt5graphicaleffects/qt5graphicaleffects.hash
index 816186ba5b..85a0f3c23a 100644
--- a/package/qt5/qt5graphicaleffects/qt5graphicaleffects.hash
+++ b/package/qt5/qt5graphicaleffects/qt5graphicaleffects.hash
@@ -3,3 +3,33 @@ sha256 1e9f0fac2c72a812d396db74b2d9d12f513d2ec9135d5982ca85aee7f00be75e qtgraphi
 
 # Hash from: http://download.qt.io/official_releases/qt/5.9/5.9.1/submodules/qtgraphicaleffects-opensource-src-5.9.1.tar.xz.mirrorlist
 sha256 5f86c38e36d9553049cfbe56d4869e73cf8ab920905402cbcafb56dd8a1a59ff qtgraphicaleffects-opensource-src-5.9.1.tar.xz
+
+# Hash for license file:
+sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.GPL2
+
+# Hash for license file:
+sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSE.GPL3
+
+# Hash for license file:
+sha256 0dbe024961f6ab5c52689cbd036c977975d0d0f6a67ff97762d96cb819dd5652  LICENSE.GPL3-EXCEPT
+
+# Hash for license file:
+sha256 da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  LICENSE.LGPL3
+
+# Hash for license file:
+sha256 ed8742a95cb9db653a09b050e27ccff5e67ba69c14aa2c3137f2a4e1892f6c0d  LICENSE.FDL
+
+# Hash for license file:
+sha256 edfe70e99be2a7c109d860b19204609e582720b211c50caedac729da372a1253  LICENSE.GPLv2
+
+# Hash for license file:
+sha256 245248009fd0af1725d183248380e476c1283383909358a13686606352bf2a17  LICENSE.GPLv3
+
+# Hash for license file:
+sha256 1996a36160b2158c2be264d2ddfa6148ebe0f1ececff55aca8d754a1ddcc7bb8  LICENSE.LGPLv21
+
+# Hash for license file:
+sha256 438c1f9a2b256e47dac33249f2ad6d4a9df643f1ec5312216d528a2f7ad82084  LGPL_EXCEPTION.txt
+
+# Hash for license file:
+sha256 5ceb37d1c7c1d92878b82af3c0fd5558087f3d5a08a3a4d43850bad4ad265a52  LICENSE.LGPLv3
diff --git a/package/qt5/qt5imageformats/qt5imageformats.hash b/package/qt5/qt5imageformats/qt5imageformats.hash
index 6e0448a425..71f358b004 100644
--- a/package/qt5/qt5imageformats/qt5imageformats.hash
+++ b/package/qt5/qt5imageformats/qt5imageformats.hash
@@ -3,3 +3,24 @@ sha256 4fb153be62dac393cbcebab65040b3b9d6edecd1ebbe5e543401b0e45bd147e4 qtimagef
 
 # Hash from: http://download.qt.io/official_releases/qt/5.9/5.9.1/submodules/qtimageformats-opensource-src-5.9.1.tar.xz.mirrorlist
 sha256 79fee307310a66100bd3d907ea69bd039dcd727c15f27e990167e7a27d1b8a47 qtimageformats-opensource-src-5.9.1.tar.xz
+
+# Hash for license file:
+sha256 edfe70e99be2a7c109d860b19204609e582720b211c50caedac729da372a1253  LICENSE.GPLv2
+
+# Hash for license file:
+sha256 245248009fd0af1725d183248380e476c1283383909358a13686606352bf2a17  LICENSE.GPLv3
+
+# Hash for license file:
+sha256 0dbe024961f6ab5c52689cbd036c977975d0d0f6a67ff97762d96cb819dd5652  LICENSE.GPL3-EXCEPT
+
+# Hash for license file:
+sha256 5ceb37d1c7c1d92878b82af3c0fd5558087f3d5a08a3a4d43850bad4ad265a52  LICENSE.LGPLv3
+
+# Hash for license file:
+sha256 ed8742a95cb9db653a09b050e27ccff5e67ba69c14aa2c3137f2a4e1892f6c0d  LICENSE.FDL
+
+# Hash for license file:
+sha256 1996a36160b2158c2be264d2ddfa6148ebe0f1ececff55aca8d754a1ddcc7bb8  LICENSE.LGPLv21
+
+# Hash for license file:
+sha256 438c1f9a2b256e47dac33249f2ad6d4a9df643f1ec5312216d528a2f7ad82084  LGPL_EXCEPTION.txt
diff --git a/package/qt5/qt5location/qt5location.hash b/package/qt5/qt5location/qt5location.hash
index 40460600b7..fb3bed39b0 100644
--- a/package/qt5/qt5location/qt5location.hash
+++ b/package/qt5/qt5location/qt5location.hash
@@ -3,3 +3,24 @@ sha256 7a8995206ed0220f943a33c037527a1a8243d5386f5ca77bf88152675c28d23a qtlocati
 
 # Hash from: http://download.qt.io/official_releases/qt/5.9/5.9.1/submodules/qtlocation-opensource-src-5.9.1.tar.xz.mirrorlist
 sha256 4bc43c1df69c5322f982588711d4a65f8408b71a36e43ba19b39d1aae87e1515 qtlocation-opensource-src-5.9.1.tar.xz
+
+# Hash for license file:
+sha256 edfe70e99be2a7c109d860b19204609e582720b211c50caedac729da372a1253  LICENSE.GPLv2
+
+# Hash for license file:
+sha256 245248009fd0af1725d183248380e476c1283383909358a13686606352bf2a17  LICENSE.GPLv3
+
+# Hash for license file:
+sha256 0dbe024961f6ab5c52689cbd036c977975d0d0f6a67ff97762d96cb819dd5652  LICENSE.GPL3-EXCEPT
+
+# Hash for license file:
+sha256 5ceb37d1c7c1d92878b82af3c0fd5558087f3d5a08a3a4d43850bad4ad265a52  LICENSE.LGPLv3
+
+# Hash for license file:
+sha256 ed8742a95cb9db653a09b050e27ccff5e67ba69c14aa2c3137f2a4e1892f6c0d  LICENSE.FDL
+
+# Hash for license file:
+sha256 1996a36160b2158c2be264d2ddfa6148ebe0f1ececff55aca8d754a1ddcc7bb8  LICENSE.LGPLv21
+
+# Hash for license file:
+sha256 438c1f9a2b256e47dac33249f2ad6d4a9df643f1ec5312216d528a2f7ad82084  LGPL_EXCEPTION.txt
diff --git a/package/qt5/qt5multimedia/qt5multimedia.hash b/package/qt5/qt5multimedia/qt5multimedia.hash
index 3e852726ab..3207a4c9da 100644
--- a/package/qt5/qt5multimedia/qt5multimedia.hash
+++ b/package/qt5/qt5multimedia/qt5multimedia.hash
@@ -3,3 +3,30 @@ sha256 cb9a70a7c6c0eb5be4a3fcaf9590863479e95a255308bbf07d5b7aa303bb8caf qtmultim
 
 # Hash from: http://download.qt.io/official_releases/qt/5.9/5.9.1/submodules/qtmultimedia-opensource-src-5.9.1.tar.xz.mirrorlist
 sha256 e48fbe71b4418eb7caba5ef5aa422483fb28d0e894cbc41f3d8b73b3d7fee6e4 qtmultimedia-opensource-src-5.9.1.tar.xz
+
+# Hash for license file:
+sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.GPL2
+
+# Hash for license file:
+sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSE.GPL3
+
+# Hash for license file:
+sha256 0dbe024961f6ab5c52689cbd036c977975d0d0f6a67ff97762d96cb819dd5652  LICENSE.GPL3-EXCEPT
+
+# Hash for license file:
+sha256 da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  LICENSE.LGPL3
+
+# Hash for license file:
+sha256 ed8742a95cb9db653a09b050e27ccff5e67ba69c14aa2c3137f2a4e1892f6c0d  LICENSE.FDL
+
+# Hash for license file:
+sha256 245248009fd0af1725d183248380e476c1283383909358a13686606352bf2a17  LICENSE.GPLv3
+
+# Hash for license file:
+sha256 1996a36160b2158c2be264d2ddfa6148ebe0f1ececff55aca8d754a1ddcc7bb8  LICENSE.LGPLv21
+
+# Hash for license file:
+sha256 438c1f9a2b256e47dac33249f2ad6d4a9df643f1ec5312216d528a2f7ad82084  LGPL_EXCEPTION.txt
+
+# Hash for license file:
+sha256 5ceb37d1c7c1d92878b82af3c0fd5558087f3d5a08a3a4d43850bad4ad265a52  LICENSE.LGPLv3
diff --git a/package/qt5/qt5quickcontrols/qt5quickcontrols.hash b/package/qt5/qt5quickcontrols/qt5quickcontrols.hash
index aecc142a99..09dfc6f738 100644
--- a/package/qt5/qt5quickcontrols/qt5quickcontrols.hash
+++ b/package/qt5/qt5quickcontrols/qt5quickcontrols.hash
@@ -3,3 +3,15 @@ sha256 5ed0f2292be10222dfb1b57a05472798fd759279f65455d91c02ef4fb746102c qtquickc
 
 # Hash from: http://download.qt.io/official_releases/qt/5.9/5.9.1/submodules/qtquickcontrols-opensource-src-5.9.1.tar.xz.mirrorlist
 sha256 520ed0e110f9d0977eb873ea0e05a3d205c9c1b1ad2dd606875708848b21ec2e qtquickcontrols-opensource-src-5.9.1.tar.xz
+
+# Hash for license file:
+sha256 edfe70e99be2a7c109d860b19204609e582720b211c50caedac729da372a1253  LICENSE.GPLv2
+
+# Hash for license file:
+sha256 245248009fd0af1725d183248380e476c1283383909358a13686606352bf2a17  LICENSE.GPLv3
+
+# Hash for license file:
+sha256 5ceb37d1c7c1d92878b82af3c0fd5558087f3d5a08a3a4d43850bad4ad265a52  LICENSE.LGPLv3
+
+# Hash for license file:
+sha256 ed8742a95cb9db653a09b050e27ccff5e67ba69c14aa2c3137f2a4e1892f6c0d  LICENSE.FDL
diff --git a/package/qt5/qt5quickcontrols2/5.6.2/qt5quickcontrols2.hash b/package/qt5/qt5quickcontrols2/5.6.2/qt5quickcontrols2.hash
new file mode 100644
index 0000000000..499efcc9f6
--- /dev/null
+++ b/package/qt5/qt5quickcontrols2/5.6.2/qt5quickcontrols2.hash
@@ -0,0 +1,8 @@
+# Hash for license file:
+sha256 ed8742a95cb9db653a09b050e27ccff5e67ba69c14aa2c3137f2a4e1892f6c0d  LICENSE.FDL
+
+# Hash for license file:
+sha256 245248009fd0af1725d183248380e476c1283383909358a13686606352bf2a17  LICENSE.GPLv3
+
+# Hash for license file:
+sha256 0ec5b37a28dd638c5c05c8cc940276e55c808353fe8d942c7f993c2c8b4cbe62  LICENSE.LGPLv3
diff --git a/package/qt5/qt5quickcontrols2/qt5quickcontrols2.hash b/package/qt5/qt5quickcontrols2/qt5quickcontrols2.hash
index fefaba807e..0446be9cf4 100644
--- a/package/qt5/qt5quickcontrols2/qt5quickcontrols2.hash
+++ b/package/qt5/qt5quickcontrols2/qt5quickcontrols2.hash
@@ -3,3 +3,12 @@ sha256 09dc1710aa4701aebe145829eb99bab94d0870cf578f7dddcec0af92286dfec1 qtquickc
 
 # Hash from: http://download.qt.io/official_releases/qt/5.9/5.9.1/submodules/qtquickcontrols2-opensource-src-5.9.1.tar.xz.mirrorlist
 sha256 203be0321112d1513b722fce463f9e30d7d00befb33349901d9517f4f13408ff qtquickcontrols2-opensource-src-5.9.1.tar.xz
+
+# Hash for license file:
+sha256 d2cfc059acb4abd8e513cd0a73cd8489f34cbafa7bc34d5d31fb3210821cf8ca  LICENSE.GPLv3
+
+# Hash for license file:
+sha256 9e63a04ce021b8bf811b30881fa51c8c3db88afeead942cd59322f2fb69c75bc  LICENSE.LGPLv3
+
+# Hash for license file:
+sha256 ed8742a95cb9db653a09b050e27ccff5e67ba69c14aa2c3137f2a4e1892f6c0d  LICENSE.FDL
diff --git a/package/qt5/qt5script/qt5script.hash b/package/qt5/qt5script/qt5script.hash
index 5177d68625..d95ae6f1ea 100644
--- a/package/qt5/qt5script/qt5script.hash
+++ b/package/qt5/qt5script/qt5script.hash
@@ -3,3 +3,18 @@ sha256 e06ef6b271cae2187b57cd4ffdd6759428fd47f94a060e2ed2af024a8c14110e qtscript
 
 # Hash from: http://download.qt.io/official_releases/qt/5.9/5.9.1/submodules/qtscript-opensource-src-5.9.1.tar.xz.mirrorlist
 sha256 176a08865d5f66437b0f279fc5d7f381f359f20bafbffcebdcac61e86415188f qtscript-opensource-src-5.9.1.tar.xz
+
+# Hash for license file:
+sha256 245248009fd0af1725d183248380e476c1283383909358a13686606352bf2a17  LICENSE.GPLv3
+
+# Hash for license file:
+sha256 1996a36160b2158c2be264d2ddfa6148ebe0f1ececff55aca8d754a1ddcc7bb8  LICENSE.LGPLv21
+
+# Hash for license file:
+sha256 438c1f9a2b256e47dac33249f2ad6d4a9df643f1ec5312216d528a2f7ad82084  LGPL_EXCEPTION.txt
+
+# Hash for license file:
+sha256 5ceb37d1c7c1d92878b82af3c0fd5558087f3d5a08a3a4d43850bad4ad265a52  LICENSE.LGPLv3
+
+# Hash for license file:
+sha256 ed8742a95cb9db653a09b050e27ccff5e67ba69c14aa2c3137f2a4e1892f6c0d  LICENSE.FDL
diff --git a/package/qt5/qt5sensors/qt5sensors.hash b/package/qt5/qt5sensors/qt5sensors.hash
index 4abf6310c8..32fdf4a296 100644
--- a/package/qt5/qt5sensors/qt5sensors.hash
+++ b/package/qt5/qt5sensors/qt5sensors.hash
@@ -3,3 +3,33 @@ sha256 a7809081aab4f2f0d7a4f40c3abb02e1690bb390d1dd410d7c6c5019a5053427 qtsensor
 
 # Hash from: http://download.qt.io/official_releases/qt/5.9/5.9.1/submodules/qtsensors-opensource-src-5.9.1.tar.xz.mirrorlist
 sha256 5af19397aa8ccd88c1fbb7cda4ee2a583f05bdf8ae090eb616bb276ff2e9e29c qtsensors-opensource-src-5.9.1.tar.xz
+
+# Hash for license file:
+sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.GPL2
+
+# Hash for license file:
+sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSE.GPL3
+
+# Hash for license file:
+sha256 0dbe024961f6ab5c52689cbd036c977975d0d0f6a67ff97762d96cb819dd5652  LICENSE.GPL3-EXCEPT
+
+# Hash for license file:
+sha256 da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  LICENSE.LGPL3
+
+# Hash for license file:
+sha256 ed8742a95cb9db653a09b050e27ccff5e67ba69c14aa2c3137f2a4e1892f6c0d  LICENSE.FDL
+
+# Hash for license file:
+sha256 edfe70e99be2a7c109d860b19204609e582720b211c50caedac729da372a1253  LICENSE.GPLv2
+
+# Hash for license file:
+sha256 245248009fd0af1725d183248380e476c1283383909358a13686606352bf2a17  LICENSE.GPLv3
+
+# Hash for license file:
+sha256 1996a36160b2158c2be264d2ddfa6148ebe0f1ececff55aca8d754a1ddcc7bb8  LICENSE.LGPLv21
+
+# Hash for license file:
+sha256 438c1f9a2b256e47dac33249f2ad6d4a9df643f1ec5312216d528a2f7ad82084  LGPL_EXCEPTION.txt
+
+# Hash for license file:
+sha256 5ceb37d1c7c1d92878b82af3c0fd5558087f3d5a08a3a4d43850bad4ad265a52  LICENSE.LGPLv3
diff --git a/package/qt5/qt5serialbus/qt5serialbus.hash b/package/qt5/qt5serialbus/qt5serialbus.hash
index c56cfb51d5..adab88e903 100644
--- a/package/qt5/qt5serialbus/qt5serialbus.hash
+++ b/package/qt5/qt5serialbus/qt5serialbus.hash
@@ -3,3 +3,15 @@ sha256 b39260091691532382935ed51de9ead8e66cfb5f7a6e5410c17cd0695ccaf826 qtserial
 
 # Hash from: http://download.qt.io/official_releases/qt/5.9/5.9.1/submodules/qtserialbus-opensource-src-5.9.1.tar.xz.mirrorlist
 sha256 caa9feefbf1d51b38d6bc923428009d524c0c5eb77f30e4b6d84fec1ce19f3c3 qtserialbus-opensource-src-5.9.1.tar.xz
+
+# Hash for license file:
+sha256 edfe70e99be2a7c109d860b19204609e582720b211c50caedac729da372a1253  LICENSE.GPLv2
+
+# Hash for license file:
+sha256 245248009fd0af1725d183248380e476c1283383909358a13686606352bf2a17  LICENSE.GPLv3
+
+# Hash for license file:
+sha256 5ceb37d1c7c1d92878b82af3c0fd5558087f3d5a08a3a4d43850bad4ad265a52  LICENSE.LGPLv3
+
+# Hash for license file:
+sha256 f827ad079686ba92cc94811e35492d0e8966f704008b6da9eeda0b659fb58a8d  LICENSE.FDL
diff --git a/package/qt5/qt5serialport/qt5serialport.hash b/package/qt5/qt5serialport/qt5serialport.hash
index 7851cd1a2e..b262ee1f70 100644
--- a/package/qt5/qt5serialport/qt5serialport.hash
+++ b/package/qt5/qt5serialport/qt5serialport.hash
@@ -3,3 +3,24 @@ sha256 af76281bad2c2bd283189635316b46091f6712134b845ae1b9e3016eec94f376 qtserial
 
 # Hash from: http://download.qt.io/official_releases/qt/5.9/5.9.1/submodules/qtserialport-opensource-src-5.9.1.tar.xz.mirrorlist
 sha256 e1fe85bf292929c3a62cb4d21efaaa4e89f70f48ea10914da07d0670ec617a69 qtserialport-opensource-src-5.9.1.tar.xz
+
+# Hash for license file:
+sha256 edfe70e99be2a7c109d860b19204609e582720b211c50caedac729da372a1253  LICENSE.GPLv2
+
+# Hash for license file:
+sha256 245248009fd0af1725d183248380e476c1283383909358a13686606352bf2a17  LICENSE.GPLv3
+
+# Hash for license file:
+sha256 0dbe024961f6ab5c52689cbd036c977975d0d0f6a67ff97762d96cb819dd5652  LICENSE.GPL3-EXCEPT
+
+# Hash for license file:
+sha256 5ceb37d1c7c1d92878b82af3c0fd5558087f3d5a08a3a4d43850bad4ad265a52  LICENSE.LGPLv3
+
+# Hash for license file:
+sha256 e1251235ce9853eecfecfa905da9ee29e9b76e4db2a1c9c4a20699f460419b08  LICENSE.FDL
+
+# Hash for license file:
+sha256 1996a36160b2158c2be264d2ddfa6148ebe0f1ececff55aca8d754a1ddcc7bb8  LICENSE.LGPLv21
+
+# Hash for license file:
+sha256 79949ee74297883df6e4e7c4bfe1e75a6e7695376b4a87ffc013e27bda509cb2  LGPL_EXCEPTION.txt
diff --git a/package/qt5/qt5svg/qt5svg.hash b/package/qt5/qt5svg/qt5svg.hash
index c954efde6c..6cc690444c 100644
--- a/package/qt5/qt5svg/qt5svg.hash
+++ b/package/qt5/qt5svg/qt5svg.hash
@@ -3,3 +3,21 @@ sha256 f7a361bf661b31ae7779513559dd0b774171911bc57f5cfb6bed6878ddc8bc4e qtsvg-op
 
 # Hash from: http://download.qt.io/official_releases/qt/5.9/5.9.1/submodules/qtsvg-opensource-src-5.9.1.tar.xz.mirrorlist
 sha256 99f294f874b13553e4ed49cd9465580ad0c9b92e29cdfa47b2e4096835c1e2e5 qtsvg-opensource-src-5.9.1.tar.xz
+
+# Hash for license file:
+sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.GPL2
+
+# Hash for license file:
+sha256 245248009fd0af1725d183248380e476c1283383909358a13686606352bf2a17  LICENSE.GPLv3
+
+# Hash for license file:
+sha256 5ceb37d1c7c1d92878b82af3c0fd5558087f3d5a08a3a4d43850bad4ad265a52  LICENSE.LGPLv3
+
+# Hash for license file:
+sha256 ed8742a95cb9db653a09b050e27ccff5e67ba69c14aa2c3137f2a4e1892f6c0d  LICENSE.FDL
+
+# Hash for license file:
+sha256 1996a36160b2158c2be264d2ddfa6148ebe0f1ececff55aca8d754a1ddcc7bb8  LICENSE.LGPLv21
+
+# Hash for license file:
+sha256 438c1f9a2b256e47dac33249f2ad6d4a9df643f1ec5312216d528a2f7ad82084  LGPL_EXCEPTION.txt
diff --git a/package/qt5/qt5tools/qt5tools.hash b/package/qt5/qt5tools/qt5tools.hash
index ae8513f065..c91e7446b6 100644
--- a/package/qt5/qt5tools/qt5tools.hash
+++ b/package/qt5/qt5tools/qt5tools.hash
@@ -3,3 +3,30 @@ sha256 db2bb4318786257a47172c377d9c456d5d5ec760d5d69240a4693dc87989e1b7 qttools-
 
 # Hash from: http://download.qt.io/official_releases/qt/5.9/5.9.1/submodules/qttools-opensource-src-5.9.1.tar.xz.mirrorlist
 sha256 c4eb56cf24a75661b8317b566be37396c90357b4f6730ef12b8c97a7079ca0e8 qttools-opensource-src-5.9.1.tar.xz
+
+# Hash for license file:
+sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.GPL2
+
+# Hash for license file:
+sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSE.GPL3
+
+# Hash for license file:
+sha256 0dbe024961f6ab5c52689cbd036c977975d0d0f6a67ff97762d96cb819dd5652  LICENSE.GPL3-EXCEPT
+
+# Hash for license file:
+sha256 da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  LICENSE.LGPL3
+
+# Hash for license file:
+sha256 ed8742a95cb9db653a09b050e27ccff5e67ba69c14aa2c3137f2a4e1892f6c0d  LICENSE.FDL
+
+# Hash for license file:
+sha256 8ab0b8fe7c8e580e8c571b8fa455baf307e9394d4b3ac53ce50d8e960a8934c5  LICENSE.GPLv3
+
+# Hash for license file:
+sha256 66f6bb53f6d985a4d651bf1ecfe8bbcbe32b0f744708d588f047580ee85d8ec8  LICENSE.LGPLv21
+
+# Hash for license file:
+sha256 438c1f9a2b256e47dac33249f2ad6d4a9df643f1ec5312216d528a2f7ad82084  LGPL_EXCEPTION.txt
+
+# Hash for license file:
+sha256 68afaf3392f8c04218fbf29db43cc0b18bf651c1db086556aa584046de9f3e35  LICENSE.LGPLv3
diff --git a/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.hash b/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.hash
index 4e66dc708f..fdfcef46ab 100644
--- a/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.hash
+++ b/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.hash
@@ -1,2 +1,8 @@
 # Hash from: http://download.qt.io/official_releases/qt/5.9/5.9.1/submodules/qtvirtualkeyboard-opensource-src-5.9.1.tar.xz.mirrorlist
 sha256 6b746a6dc3ab54edf3007d0f6a2f8f31281aed03629830f59acfbc8514d6e94c  qtvirtualkeyboard-opensource-src-5.9.1.tar.xz
+
+# Hash for license file:
+sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSE.GPL3
+
+# Hash for license file:
+sha256 7a45a9769d19545480a241230e6ea520b5156fac00930dcd69b6886749743d10  src/virtualkeyboard/3rdparty/lipi-toolkit/MIT_LICENSE.txt
diff --git a/package/qt5/qt5wayland/qt5wayland.hash b/package/qt5/qt5wayland/qt5wayland.hash
index 95b88241b3..41d4da279c 100644
--- a/package/qt5/qt5wayland/qt5wayland.hash
+++ b/package/qt5/qt5wayland/qt5wayland.hash
@@ -3,3 +3,30 @@ sha256 035c3199f4719627b64b7020f0f4574da2b4cb78c6981aba75f27b872d8e6c86	qtwaylan
 
 # Hash from: http://download.qt.io/official_releases/qt/5.9/5.9.1/submodules/qtwayland-opensource-src-5.9.1.tar.xz.mirrorlist
 sha256 cf0cb1982a7b748bfec8c7834691f13072f104884c61809d0bbd1a01ebda3ffa	qtwayland-opensource-src-5.9.1.tar.xz
+
+# Hash for license file:
+sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.GPL2
+
+# Hash for license file:
+sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSE.GPL3
+
+# Hash for license file:
+sha256 0dbe024961f6ab5c52689cbd036c977975d0d0f6a67ff97762d96cb819dd5652  LICENSE.GPL3-EXCEPT
+
+# Hash for license file:
+sha256 da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  LICENSE.LGPL3
+
+# Hash for license file:
+sha256 ed8742a95cb9db653a09b050e27ccff5e67ba69c14aa2c3137f2a4e1892f6c0d  LICENSE.FDL
+
+# Hash for license file:
+sha256 245248009fd0af1725d183248380e476c1283383909358a13686606352bf2a17  LICENSE.GPLv3
+
+# Hash for license file:
+sha256 1996a36160b2158c2be264d2ddfa6148ebe0f1ececff55aca8d754a1ddcc7bb8  LICENSE.LGPLv21
+
+# Hash for license file:
+sha256 438c1f9a2b256e47dac33249f2ad6d4a9df643f1ec5312216d528a2f7ad82084  LGPL_EXCEPTION.txt
+
+# Hash for license file:
+sha256 5ceb37d1c7c1d92878b82af3c0fd5558087f3d5a08a3a4d43850bad4ad265a52  LICENSE.LGPLv3
diff --git a/package/qt5/qt5webchannel/qt5webchannel.hash b/package/qt5/qt5webchannel/qt5webchannel.hash
index 27c3b0a60a..8c8a5b5ae9 100644
--- a/package/qt5/qt5webchannel/qt5webchannel.hash
+++ b/package/qt5/qt5webchannel/qt5webchannel.hash
@@ -3,3 +3,33 @@ sha256 700efdef5f51bdb77093f4db212afe275ad35a710ea08ba0e9e9cbc8f09f1a52 qtwebcha
 
 # Hash from: http://download.qt.io/official_releases/qt/5.9/5.9.1/submodules/qtwebchannel-opensource-src-5.9.1.tar.xz.mirrorlist
 sha256 80425f5a6df8784f5221809ffd664486ed38427f514ab4ec174e20456b027000 qtwebchannel-opensource-src-5.9.1.tar.xz
+
+# Hash for license file:
+sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.GPL2
+
+# Hash for license file:
+sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSE.GPL3
+
+# Hash for license file:
+sha256 0dbe024961f6ab5c52689cbd036c977975d0d0f6a67ff97762d96cb819dd5652  LICENSE.GPL3-EXCEPT
+
+# Hash for license file:
+sha256 da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  LICENSE.LGPL3
+
+# Hash for license file:
+sha256 ed8742a95cb9db653a09b050e27ccff5e67ba69c14aa2c3137f2a4e1892f6c0d  LICENSE.FDL
+
+# Hash for license file:
+sha256 edfe70e99be2a7c109d860b19204609e582720b211c50caedac729da372a1253  LICENSE.GPLv2
+
+# Hash for license file:
+sha256 245248009fd0af1725d183248380e476c1283383909358a13686606352bf2a17  LICENSE.GPLv3
+
+# Hash for license file:
+sha256 1996a36160b2158c2be264d2ddfa6148ebe0f1ececff55aca8d754a1ddcc7bb8  LICENSE.LGPLv21
+
+# Hash for license file:
+sha256 438c1f9a2b256e47dac33249f2ad6d4a9df643f1ec5312216d528a2f7ad82084  LGPL_EXCEPTION.txt
+
+# Hash for license file:
+sha256 5ceb37d1c7c1d92878b82af3c0fd5558087f3d5a08a3a4d43850bad4ad265a52  LICENSE.LGPLv3
diff --git a/package/qt5/qt5webkit/qt5webkit.hash b/package/qt5/qt5webkit/qt5webkit.hash
index 93f0594f6c..872a9615ef 100644
--- a/package/qt5/qt5webkit/qt5webkit.hash
+++ b/package/qt5/qt5webkit/qt5webkit.hash
@@ -3,3 +3,12 @@ sha256 528a6b8b1c5095367b26e8ce4f3a46bb739e2e9913ff4dfc6ef58a04fcd73966 qtwebkit
 
 # hash from: http://download.qt.io/official_releases/qt/5.9/5.9.1/submodules/qtwebkit-opensource-src-5.9.1.tar.xz.mirrorlist
 sha256  28a560becd800a4229bfac317c2e5407cd3cc95308bc4c3ca90dba2577b052cf  qtwebkit-opensource-src-5.9.1.tar.xz
+
+# Hash for license file:
+sha256 7555fa34bc131a75ca56d65c40cc1ea8f9515d23e353d4c15d58573a042f7805  Source/WebCore/LICENSE-LGPL-2
+
+# Hash for license file:
+sha256 f2b3bd09663381deb99721109d22b47af1213bb43007a8b56a06c6375c8050ce  Source/WebCore/LICENSE-LGPL-2.1
+
+# Hash for license file:
+sha256 a3db6c7f3027aa27489c25a2fa259185cdee945780c32e01c60cbfabf4743b6c  LICENSE.LGPLv21
diff --git a/package/qt5/qt5websockets/qt5websockets.hash b/package/qt5/qt5websockets/qt5websockets.hash
index c95027b509..08a1b79292 100644
--- a/package/qt5/qt5websockets/qt5websockets.hash
+++ b/package/qt5/qt5websockets/qt5websockets.hash
@@ -3,3 +3,27 @@ sha256 3cd9d4bbff8e6be5e252f00fc9ecb9ac2d8a193020288c7d1e82583daeb5ba35 qtwebsoc
 
 # Hash from: http://download.qt.io/official_releases/qt/5.9/5.9.1/submodules/qtwebsockets-opensource-src-5.9.1.tar.xz.mirrorlist
 sha256 01277362430b5a75c19a16ded8cf4c53a3bccddcc0ba2f50648e0f2985f23464 qtwebsockets-opensource-src-5.9.1.tar.xz
+
+# Hash for license file:
+sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.GPL2
+
+# Hash for license file:
+sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSE.GPL3
+
+# Hash for license file:
+sha256 0dbe024961f6ab5c52689cbd036c977975d0d0f6a67ff97762d96cb819dd5652  LICENSE.GPL3-EXCEPT
+
+# Hash for license file:
+sha256 da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  LICENSE.LGPL3
+
+# Hash for license file:
+sha256 245248009fd0af1725d183248380e476c1283383909358a13686606352bf2a17  LICENSE.GPLv3
+
+# Hash for license file:
+sha256 1996a36160b2158c2be264d2ddfa6148ebe0f1ececff55aca8d754a1ddcc7bb8  LICENSE.LGPLv21
+
+# Hash for license file:
+sha256 79949ee74297883df6e4e7c4bfe1e75a6e7695376b4a87ffc013e27bda509cb2  LGPL_EXCEPTION.txt
+
+# Hash for license file:
+sha256 5ceb37d1c7c1d92878b82af3c0fd5558087f3d5a08a3a4d43850bad4ad265a52  LICENSE.LGPLv3
diff --git a/package/qt5/qt5x11extras/qt5x11extras.hash b/package/qt5/qt5x11extras/qt5x11extras.hash
index a1ac2b74b9..429c20aec3 100644
--- a/package/qt5/qt5x11extras/qt5x11extras.hash
+++ b/package/qt5/qt5x11extras/qt5x11extras.hash
@@ -3,3 +3,18 @@ sha256 71ffde1cfaeec310677b69ecd16cb5992e8885cf3e73b4cec7d6e7a115b40ced qtx11ext
 
 # Hash from: http://download.qt.io/official_releases/qt/5.9/5.9.1/submodules/qtx11extras-opensource-src-5.9.1.tar.xz.mirrorlist
 sha256 a63d0e28958331d672dbd0f8c554bdaddbc974a27be37601f7f221a2ef1ad601 qtx11extras-opensource-src-5.9.1.tar.xz
+
+# Hash for license file:
+sha256 edfe70e99be2a7c109d860b19204609e582720b211c50caedac729da372a1253  LICENSE.GPLv2
+
+# Hash for license file:
+sha256 245248009fd0af1725d183248380e476c1283383909358a13686606352bf2a17  LICENSE.GPLv3
+
+# Hash for license file:
+sha256 0dbe024961f6ab5c52689cbd036c977975d0d0f6a67ff97762d96cb819dd5652  LICENSE.GPL3-EXCEPT
+
+# Hash for license file:
+sha256 5ceb37d1c7c1d92878b82af3c0fd5558087f3d5a08a3a4d43850bad4ad265a52  LICENSE.LGPLv3
+
+# Hash for license file:
+sha256 ed8742a95cb9db653a09b050e27ccff5e67ba69c14aa2c3137f2a4e1892f6c0d  LICENSE.FDL
diff --git a/package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash b/package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash
index bf8c04af52..4cfa497596 100644
--- a/package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash
+++ b/package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash
@@ -3,3 +3,24 @@ sha256 7c6df3eebf188d8ce6822a22cebbc63da5ac27047cf1bd7236d5b988244782cc qtxmlpat
 
 # Hash from: http://download.qt.io/official_releases/qt/5.9/5.9.1/submodules/qtxmlpatterns-opensource-src-5.9.1.tar.xz.mirrorlist
 sha256 b584686496ad1b1b3426d642bd705cab3fc02313b067a33d1b826a27aee29c24 qtxmlpatterns-opensource-src-5.9.1.tar.xz
+
+# Hash for license file:
+sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.GPL2
+
+# Hash for license file:
+sha256 245248009fd0af1725d183248380e476c1283383909358a13686606352bf2a17  LICENSE.GPLv3
+
+# Hash for license file:
+sha256 0dbe024961f6ab5c52689cbd036c977975d0d0f6a67ff97762d96cb819dd5652  LICENSE.GPL3-EXCEPT
+
+# Hash for license file:
+sha256 5ceb37d1c7c1d92878b82af3c0fd5558087f3d5a08a3a4d43850bad4ad265a52  LICENSE.LGPLv3
+
+# Hash for license file:
+sha256 ed8742a95cb9db653a09b050e27ccff5e67ba69c14aa2c3137f2a4e1892f6c0d  LICENSE.FDL
+
+# Hash for license file:
+sha256 1996a36160b2158c2be264d2ddfa6148ebe0f1ececff55aca8d754a1ddcc7bb8  LICENSE.LGPLv21
+
+# Hash for license file:
+sha256 438c1f9a2b256e47dac33249f2ad6d4a9df643f1ec5312216d528a2f7ad82084  LGPL_EXCEPTION.txt
-- 
2.14.2
