From: =?UTF-8?q?Fatih=20A=C5=9F=C4=B1c=C4=B1?= <fatih.asici@gmail.com>
Date: Fri, 26 Sep 2014 14:36:57 +0300
Subject: [Buildroot] [PATCH] qt5: add hashes
Message-ID: <1411731417-9099-1-git-send-email-fatih.asici@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fatih A??c? <fatih.asici@gmail.com>
---
 package/qt5/qt5base/qt5base.hash                         | 4 ++++
 package/qt5/qt5connectivity/qt5connectivity.hash         | 4 ++++
 package/qt5/qt5declarative/qt5declarative.hash           | 4 ++++
 package/qt5/qt5enginio/qt5enginio.hash                   | 4 ++++
 package/qt5/qt5graphicaleffects/qt5graphicaleffects.hash | 4 ++++
 package/qt5/qt5imageformats/qt5imageformats.hash         | 4 ++++
 package/qt5/qt5location/qt5location.hash                 | 4 ++++
 package/qt5/qt5multimedia/qt5multimedia.hash             | 4 ++++
 package/qt5/qt5quick1/qt5quick1.hash                     | 4 ++++
 package/qt5/qt5quickcontrols/qt5quickcontrols.hash       | 4 ++++
 package/qt5/qt5script/qt5script.hash                     | 4 ++++
 package/qt5/qt5sensors/qt5sensors.hash                   | 4 ++++
 package/qt5/qt5serialport/qt5serialport.hash             | 4 ++++
 package/qt5/qt5svg/qt5svg.hash                           | 4 ++++
 package/qt5/qt5webkit-examples/qt5webkit-examples.hash   | 4 ++++
 package/qt5/qt5webkit/qt5webkit.hash                     | 4 ++++
 package/qt5/qt5websockets/qt5websockets.hash             | 4 ++++
 package/qt5/qt5x11extras/qt5x11extras.hash               | 4 ++++
 package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash           | 4 ++++
 19 files changed, 76 insertions(+)
 create mode 100644 package/qt5/qt5base/qt5base.hash
 create mode 100644 package/qt5/qt5connectivity/qt5connectivity.hash
 create mode 100644 package/qt5/qt5declarative/qt5declarative.hash
 create mode 100644 package/qt5/qt5enginio/qt5enginio.hash
 create mode 100644 package/qt5/qt5graphicaleffects/qt5graphicaleffects.hash
 create mode 100644 package/qt5/qt5imageformats/qt5imageformats.hash
 create mode 100644 package/qt5/qt5location/qt5location.hash
 create mode 100644 package/qt5/qt5multimedia/qt5multimedia.hash
 create mode 100644 package/qt5/qt5quick1/qt5quick1.hash
 create mode 100644 package/qt5/qt5quickcontrols/qt5quickcontrols.hash
 create mode 100644 package/qt5/qt5script/qt5script.hash
 create mode 100644 package/qt5/qt5sensors/qt5sensors.hash
 create mode 100644 package/qt5/qt5serialport/qt5serialport.hash
 create mode 100644 package/qt5/qt5svg/qt5svg.hash
 create mode 100644 package/qt5/qt5webkit-examples/qt5webkit-examples.hash
 create mode 100644 package/qt5/qt5webkit/qt5webkit.hash
 create mode 100644 package/qt5/qt5websockets/qt5websockets.hash
 create mode 100644 package/qt5/qt5x11extras/qt5x11extras.hash
 create mode 100644 package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash

diff --git a/package/qt5/qt5base/qt5base.hash b/package/qt5/qt5base/qt5base.hash
new file mode 100644
index 0000000..9aad1a9
--- /dev/null
+++ b/package/qt5/qt5base/qt5base.hash
@@ -0,0 +1,4 @@
+# Hashes from: http://download.qt-project.org/official_releases/qt/5.3/5.3.2/submodules/qtbase-opensource-src-5.3.2.tar.xz.mirrorlist
+sha256 9a16095ac46dae99d6ddab8bc07065fbe1c36501ed194a3191d07347d7826cb8 qtbase-opensource-src-5.3.2.tar.xz
+sha1   faf4f33aa7e8dabcdcdf5f10824263beebbccd96                         qtbase-opensource-src-5.3.2.tar.xz
+md5    563e2b10274171f1184b3fd7260b4991                                 qtbase-opensource-src-5.3.2.tar.xz
diff --git a/package/qt5/qt5connectivity/qt5connectivity.hash b/package/qt5/qt5connectivity/qt5connectivity.hash
new file mode 100644
index 0000000..652e92c
--- /dev/null
+++ b/package/qt5/qt5connectivity/qt5connectivity.hash
@@ -0,0 +1,4 @@
+# Hashes from: http://download.qt-project.org/official_releases/qt/5.3/5.3.2/submodules/qtconnectivity-opensource-src-5.3.2.tar.xz.mirrorlist
+sha256 2eb972b85697e9752ed2f2f7e194393650743737a9fe5f48177734c4dbd9096f qtconnectivity-opensource-src-5.3.2.tar.xz
+sha1   a8c4a48078fd0137a0d00c01e11eb356db20e1bb                         qtconnectivity-opensource-src-5.3.2.tar.xz
+md5    e496963407bb0c7b2e6c07133715a9cf                                 qtconnectivity-opensource-src-5.3.2.tar.xz
diff --git a/package/qt5/qt5declarative/qt5declarative.hash b/package/qt5/qt5declarative/qt5declarative.hash
new file mode 100644
index 0000000..38e1d51
--- /dev/null
+++ b/package/qt5/qt5declarative/qt5declarative.hash
@@ -0,0 +1,4 @@
+# Hashes from: http://download.qt-project.org/official_releases/qt/5.3/5.3.2/submodules/qtdeclarative-opensource-src-5.3.2.tar.xz.mirrorlist
+sha256 04108193b9642c0394c157e98b5c1d81f555f9f495289e07ebfb6f03448b2382 qtdeclarative-opensource-src-5.3.2.tar.xz
+sha1   595ce2eabd771ae2ead968220f9d8e1ff14fafa8                         qtdeclarative-opensource-src-5.3.2.tar.xz
+md5    72ae60527ebb15f4b85cfbadc4c174de                                 qtdeclarative-opensource-src-5.3.2.tar.xz
diff --git a/package/qt5/qt5enginio/qt5enginio.hash b/package/qt5/qt5enginio/qt5enginio.hash
new file mode 100644
index 0000000..fa0864e
--- /dev/null
+++ b/package/qt5/qt5enginio/qt5enginio.hash
@@ -0,0 +1,4 @@
+# Hashes from: http://download.qt-project.org/official_releases/qt/5.3/5.3.2/submodules/qtenginio-opensource-src-5.3.2.tar.xz.mirrorlist
+sha256 d5b84656dc6a349db380e42690a18137e562dbaba1930216bb3e3815df6af708 qtenginio-opensource-src-5.3.2.tar.xz
+sha1   78e9c8ea929365449364a613b06ad066d243b80b                         qtenginio-opensource-src-5.3.2.tar.xz
+md5    53b67cf5470dfa9bcfc59aa5b8bfd66d                                 qtenginio-opensource-src-5.3.2.tar.xz
diff --git a/package/qt5/qt5graphicaleffects/qt5graphicaleffects.hash b/package/qt5/qt5graphicaleffects/qt5graphicaleffects.hash
new file mode 100644
index 0000000..b37e6fc
--- /dev/null
+++ b/package/qt5/qt5graphicaleffects/qt5graphicaleffects.hash
@@ -0,0 +1,4 @@
+# Hashes from: http://download.qt-project.org/official_releases/qt/5.3/5.3.2/submodules/qtgraphicaleffects-opensource-src-5.3.2.tar.xz.mirrorlist
+sha256 688f2658a13d2919487d3f5acacb037364ee5c8fe0319f524a7d0a4987ba7ffc qtgraphicaleffects-opensource-src-5.3.2.tar.xz
+sha1   08929b31a8c70e465d7f10f80e6004b29c275cc0                         qtgraphicaleffects-opensource-src-5.3.2.tar.xz
+md5    6dd8dd6906bbfb52a292cd25927bb9a8                                 qtgraphicaleffects-opensource-src-5.3.2.tar.xz
diff --git a/package/qt5/qt5imageformats/qt5imageformats.hash b/package/qt5/qt5imageformats/qt5imageformats.hash
new file mode 100644
index 0000000..8465b6b
--- /dev/null
+++ b/package/qt5/qt5imageformats/qt5imageformats.hash
@@ -0,0 +1,4 @@
+# Hashes from: http://download.qt-project.org/official_releases/qt/5.3/5.3.2/submodules/qtimageformats-opensource-src-5.3.2.tar.xz.mirrorlist
+sha256 d303cbceb73774edc0cfdbde6b97b0e41077e242ff6520710890f81bea40e2d4 qtimageformats-opensource-src-5.3.2.tar.xz
+sha1   4b8068f4f958d0c637b86638219c006990ae0efa                         qtimageformats-opensource-src-5.3.2.tar.xz
+md5    255bb7f28c667ab91303e6af271753b5                                 qtimageformats-opensource-src-5.3.2.tar.xz
diff --git a/package/qt5/qt5location/qt5location.hash b/package/qt5/qt5location/qt5location.hash
new file mode 100644
index 0000000..9aad1a9
--- /dev/null
+++ b/package/qt5/qt5location/qt5location.hash
@@ -0,0 +1,4 @@
+# Hashes from: http://download.qt-project.org/official_releases/qt/5.3/5.3.2/submodules/qtbase-opensource-src-5.3.2.tar.xz.mirrorlist
+sha256 9a16095ac46dae99d6ddab8bc07065fbe1c36501ed194a3191d07347d7826cb8 qtbase-opensource-src-5.3.2.tar.xz
+sha1   faf4f33aa7e8dabcdcdf5f10824263beebbccd96                         qtbase-opensource-src-5.3.2.tar.xz
+md5    563e2b10274171f1184b3fd7260b4991                                 qtbase-opensource-src-5.3.2.tar.xz
diff --git a/package/qt5/qt5multimedia/qt5multimedia.hash b/package/qt5/qt5multimedia/qt5multimedia.hash
new file mode 100644
index 0000000..51fe0a0
--- /dev/null
+++ b/package/qt5/qt5multimedia/qt5multimedia.hash
@@ -0,0 +1,4 @@
+# Hashes from: http://download.qt-project.org/official_releases/qt/5.3/5.3.2/submodules/qtmultimedia-opensource-src-5.3.2.tar.xz.mirrorlist
+sha256 255fac66c93f33743c707da3d41d95c7c562924fe4eb829cbb7b21b2274a0e0b qtmultimedia-opensource-src-5.3.2.tar.xz
+sha1   9cd5936d1c0d6768bc0af1ad766f2aa02efe1865                         qtmultimedia-opensource-src-5.3.2.tar.xz
+md5    5ef68e85b9d32865a4bf7f491ff31f96                                 qtmultimedia-opensource-src-5.3.2.tar.xz
diff --git a/package/qt5/qt5quick1/qt5quick1.hash b/package/qt5/qt5quick1/qt5quick1.hash
new file mode 100644
index 0000000..d6c6e0c
--- /dev/null
+++ b/package/qt5/qt5quick1/qt5quick1.hash
@@ -0,0 +1,4 @@
+# Hashes from: http://download.qt-project.org/official_releases/qt/5.3/5.3.2/submodules/qtquick1-opensource-src-5.3.2.tar.xz.mirrorlist
+sha256 9b7b2e895180e4e3e1ed4e7b5ad049b7d021a05c96be6edc5fc433c6de6273fb qtquick1-opensource-src-5.3.2.tar.xz
+sha1   9da9b39fc391e52ab7061607f53e7b8cbc99050b                         qtquick1-opensource-src-5.3.2.tar.xz
+md5    3a57c52d6d4d6632d67a4ebd35abe0c5                                 qtquick1-opensource-src-5.3.2.tar.xz
diff --git a/package/qt5/qt5quickcontrols/qt5quickcontrols.hash b/package/qt5/qt5quickcontrols/qt5quickcontrols.hash
new file mode 100644
index 0000000..07f4e2b
--- /dev/null
+++ b/package/qt5/qt5quickcontrols/qt5quickcontrols.hash
@@ -0,0 +1,4 @@
+# Hashes from: http://download.qt-project.org/official_releases/qt/5.3/5.3.2/submodules/qtquickcontrols-opensource-src-5.3.2.tar.xz.mirrorlist
+sha256 5f890f014d087141b0aaa8954b21b1f85740233b60a556e0e9624227bff6d94e qtquickcontrols-opensource-src-5.3.2.tar.xz
+sha1   db761fa235253f4eac3d2c0fce734ffa667d739a                         qtquickcontrols-opensource-src-5.3.2.tar.xz
+md5    05f490fd6a7d3bca0c4d4a59989daef0                                 qtquickcontrols-opensource-src-5.3.2.tar.xz
diff --git a/package/qt5/qt5script/qt5script.hash b/package/qt5/qt5script/qt5script.hash
new file mode 100644
index 0000000..a98877c
--- /dev/null
+++ b/package/qt5/qt5script/qt5script.hash
@@ -0,0 +1,4 @@
+# Hashes from: http://download.qt-project.org/official_releases/qt/5.3/5.3.2/submodules/qtscript-opensource-src-5.3.2.tar.xz.mirrorlist
+sha256 6e18002c8c993402c7d28b3c0705092e41c18769b6d3ff741e9a3b3ce9d6d7be qtscript-opensource-src-5.3.2.tar.xz
+sha1   a5c8167a4de3b5765d75692755009839a9f0c218                         qtscript-opensource-src-5.3.2.tar.xz
+md5    d0e70adf7c993f33bad27290dae778d5                                 qtscript-opensource-src-5.3.2.tar.xz
diff --git a/package/qt5/qt5sensors/qt5sensors.hash b/package/qt5/qt5sensors/qt5sensors.hash
new file mode 100644
index 0000000..c8ea98b
--- /dev/null
+++ b/package/qt5/qt5sensors/qt5sensors.hash
@@ -0,0 +1,4 @@
+# Hashes from: http://download.qt-project.org/official_releases/qt/5.3/5.3.2/submodules/qtsensors-opensource-src-5.3.2.tar.xz.mirrorlist
+sha256 f9359dc42fbd7105eec7a1fb866e90aa772fd694075e5a5691d1a31d08953ae4 qtsensors-opensource-src-5.3.2.tar.xz
+sha1   de5099d494b6f898831f316eee90654f5e96ba22                         qtsensors-opensource-src-5.3.2.tar.xz
+md5    d0a8dc3173bfc9dc9f2632d509a76e6f                                 qtsensors-opensource-src-5.3.2.tar.xz
diff --git a/package/qt5/qt5serialport/qt5serialport.hash b/package/qt5/qt5serialport/qt5serialport.hash
new file mode 100644
index 0000000..1713b17
--- /dev/null
+++ b/package/qt5/qt5serialport/qt5serialport.hash
@@ -0,0 +1,4 @@
+# Hashes from: http://download.qt-project.org/official_releases/qt/5.3/5.3.2/submodules/qtserialport-opensource-src-5.3.2.tar.xz.mirrorlist
+sha256 a886e0cb08be60e57958676dc91c6f649468184a03c89c2aeabc904d36fd5a4b qtserialport-opensource-src-5.3.2.tar.xz
+sha1   f886713b9471846508680531d4bb9c392d21d317                         qtserialport-opensource-src-5.3.2.tar.xz
+md5    0a38cfe5c81364f2b93d0d38b94d375f                                 qtserialport-opensource-src-5.3.2.tar.xz
diff --git a/package/qt5/qt5svg/qt5svg.hash b/package/qt5/qt5svg/qt5svg.hash
new file mode 100644
index 0000000..e735ff4
--- /dev/null
+++ b/package/qt5/qt5svg/qt5svg.hash
@@ -0,0 +1,4 @@
+# Hashes from: http://download.qt-project.org/official_releases/qt/5.3/5.3.2/submodules/qtsvg-opensource-src-5.3.2.tar.xz.mirrorlist
+sha256 1ec5c2f307ee55740cc8c82dc2ca4037dbc0ca398b4e32abbd967535e71ae30f qtsvg-opensource-src-5.3.2.tar.xz
+sha1   11740b39d22842214c7b4c555faee5a7da84575e                         qtsvg-opensource-src-5.3.2.tar.xz
+md5    f7972e80970ff26a908c43defb3d10e6                                 qtsvg-opensource-src-5.3.2.tar.xz
diff --git a/package/qt5/qt5webkit-examples/qt5webkit-examples.hash b/package/qt5/qt5webkit-examples/qt5webkit-examples.hash
new file mode 100644
index 0000000..4f38903
--- /dev/null
+++ b/package/qt5/qt5webkit-examples/qt5webkit-examples.hash
@@ -0,0 +1,4 @@
+# Hashes from: http://download.qt-project.org/official_releases/qt/5.3/5.3.2/submodules/qtwebkit-examples-opensource-src-5.3.2.tar.xz.mirrorlist
+sha256 c8081a0863b7d8e2e39ec0e2fe288331ddab093a682959ba7378392512296482 qtwebkit-examples-opensource-src-5.3.2.tar.xz
+sha1   18272c83652dcadbce5b75999bbadc64cbad7691                         qtwebkit-examples-opensource-src-5.3.2.tar.xz
+md5    6f88c2a99002801a1943483331f8b4f0                                 qtwebkit-examples-opensource-src-5.3.2.tar.xz
diff --git a/package/qt5/qt5webkit/qt5webkit.hash b/package/qt5/qt5webkit/qt5webkit.hash
new file mode 100644
index 0000000..6aeda9e
--- /dev/null
+++ b/package/qt5/qt5webkit/qt5webkit.hash
@@ -0,0 +1,4 @@
+# Hashes from: http://download.qt-project.org/official_releases/qt/5.3/5.3.2/submodules/qtwebkit-opensource-src-5.3.2.tar.xz.mirrorlist
+sha256 e47122ed15e8e1cc32e11b3cd89bacc056437215134a204899f2fddb4fd92e5b qtwebkit-opensource-src-5.3.2.tar.xz
+sha1   5ac040cd1fbf953ff9abc0502489bff8f4aa5ac2                         qtwebkit-opensource-src-5.3.2.tar.xz
+md5    0497b5b46540848e0db6a9e219d756fb                                 qtwebkit-opensource-src-5.3.2.tar.xz
diff --git a/package/qt5/qt5websockets/qt5websockets.hash b/package/qt5/qt5websockets/qt5websockets.hash
new file mode 100644
index 0000000..6402567
--- /dev/null
+++ b/package/qt5/qt5websockets/qt5websockets.hash
@@ -0,0 +1,4 @@
+# Hashes from: http://download.qt-project.org/official_releases/qt/5.3/5.3.2/submodules/qtwebsockets-opensource-src-5.3.2.tar.xz.mirrorlist
+sha256 60533d413b0fa27b1e08642ae77bcaa76a845fa39ddc3d49af573a77e73a38c2 qtwebsockets-opensource-src-5.3.2.tar.xz
+sha1   8c043ee895a4f7bb1f3e6e35c3e835e803f8385f                         qtwebsockets-opensource-src-5.3.2.tar.xz
+md5    093ddc113952e47bd0e251986e03f1e4                                 qtwebsockets-opensource-src-5.3.2.tar.xz
diff --git a/package/qt5/qt5x11extras/qt5x11extras.hash b/package/qt5/qt5x11extras/qt5x11extras.hash
new file mode 100644
index 0000000..64f50e7
--- /dev/null
+++ b/package/qt5/qt5x11extras/qt5x11extras.hash
@@ -0,0 +1,4 @@
+# Hashes from: http://download.qt-project.org/official_releases/qt/5.3/5.3.2/submodules/qtx11extras-opensource-src-5.3.2.tar.xz.mirrorlist
+sha256 ca6a28c95be0bf18080b4a20ae9e2c24a77a45aaf557f06047e65b1280c17251 qtx11extras-opensource-src-5.3.2.tar.xz
+sha1   f019cc60b226a45f50d07bb7c3a753620d62e2b4                         qtx11extras-opensource-src-5.3.2.tar.xz
+md5    59f6cbbdf2ad48c6b95b65f8b333df2d                                 qtx11extras-opensource-src-5.3.2.tar.xz
diff --git a/package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash b/package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash
new file mode 100644
index 0000000..68cd9f7
--- /dev/null
+++ b/package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash
@@ -0,0 +1,4 @@
+# Hashes from: http://download.qt-project.org/official_releases/qt/5.3/5.3.2/submodules/qtxmlpatterns-opensource-src-5.3.2.tar.xz.mirrorlist
+sha256 acab0307039e117475caf2c95e425ead09ab5ee08ce15205fb3c0af7d7ec1abb qtxmlpatterns-opensource-src-5.3.2.tar.xz
+sha1   d7c5f3dee97d68ec7274ba349d0a9e531aaf111f                         qtxmlpatterns-opensource-src-5.3.2.tar.xz
+md5    857e8040b2bf45c114a7d75ec6ef94ee                                 qtxmlpatterns-opensource-src-5.3.2.tar.xz
-- 
1.9.1
