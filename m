From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 2 Apr 2015 21:51:50 +0200
Subject: [Buildroot] [git commit] qt5: update hashes for 5.4.1
Message-ID: <20150402200512.F39B27FEFA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=edd2ba9502c31c003c5c60652d72b63bb7ff1968
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When updating Qt to 5.4.1 the hash files were omitted

Signed-off-by: Will Wagner <will_wagner@carallon.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qt5/qt5base/qt5base.hash                   |    8 ++++----
 package/qt5/qt5connectivity/qt5connectivity.hash   |    8 ++++----
 package/qt5/qt5declarative/qt5declarative.hash     |    8 ++++----
 package/qt5/qt5enginio/qt5enginio.hash             |    8 ++++----
 .../qt5graphicaleffects/qt5graphicaleffects.hash   |    8 ++++----
 package/qt5/qt5imageformats/qt5imageformats.hash   |    8 ++++----
 package/qt5/qt5multimedia/qt5multimedia.hash       |    8 ++++----
 package/qt5/qt5quick1/qt5quick1.hash               |    8 ++++----
 package/qt5/qt5quickcontrols/qt5quickcontrols.hash |    8 ++++----
 package/qt5/qt5script/qt5script.hash               |    8 ++++----
 package/qt5/qt5sensors/qt5sensors.hash             |    8 ++++----
 package/qt5/qt5serialport/qt5serialport.hash       |    8 ++++----
 package/qt5/qt5svg/qt5svg.hash                     |    8 ++++----
 .../qt5/qt5webkit-examples/qt5webkit-examples.hash |    8 ++++----
 package/qt5/qt5webkit/qt5webkit.hash               |    8 ++++----
 package/qt5/qt5websockets/qt5websockets.hash       |    8 ++++----
 package/qt5/qt5x11extras/qt5x11extras.hash         |    8 ++++----
 package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash     |    8 ++++----
 18 files changed, 72 insertions(+), 72 deletions(-)

diff --git a/package/qt5/qt5base/qt5base.hash b/package/qt5/qt5base/qt5base.hash
index 0097942..7dcf28d 100644
--- a/package/qt5/qt5base/qt5base.hash
+++ b/package/qt5/qt5base/qt5base.hash
@@ -1,4 +1,4 @@
-# Hashes from: http://download.qt.io/official_releases/qt/5.4/5.4.0/submodules/qtbase-opensource-src-5.4.0.tar.xz.mirrorlist
-sha256 daea240ba5e77bc2d78ec21a2cb664eed83b3d4ad409b6277a6f7d4c0c8e91d1 qtbase-opensource-src-5.4.0.tar.xz
-sha1   2e3d32f32e36a92782ca66c260940824746900bd                         qtbase-opensource-src-5.4.0.tar.xz
-md5    eaaa72a5cb25713ca8d17f3a8d149765                                 qtbase-opensource-src-5.4.0.tar.xz
+# Hashes from: http://download.qt.io/official_releases/qt/5.4/5.4.1/submodules/qtbase-opensource-src-5.4.1.tar.xz.mirrorlist
+sha256 8574a593830959c0f7e5430fe77a43832ea7f5299e14a397a74576b3df7fb1b7 qtbase-opensource-src-5.4.1.tar.xz
+sha1   134ec03371722cc31e2041a82c255cec708ca848                         qtbase-opensource-src-5.4.1.tar.xz
+md5    9507825e558c980fed602de1f16ec7ae                                 qtbase-opensource-src-5.4.1.tar.xz
diff --git a/package/qt5/qt5connectivity/qt5connectivity.hash b/package/qt5/qt5connectivity/qt5connectivity.hash
index 8039851..32836c9 100644
--- a/package/qt5/qt5connectivity/qt5connectivity.hash
+++ b/package/qt5/qt5connectivity/qt5connectivity.hash
@@ -1,4 +1,4 @@
-# Hashes from: http://download.qt.io/official_releases/qt/5.4/5.4.0/submodules/qtconnectivity-opensource-src-5.4.0.tar.xz.mirrorlist
-sha256 636685bbcccac28f6c8c2d1bee7c9b06a74bc5c11d9c87a424d80093f19b1038 qtconnectivity-opensource-src-5.4.0.tar.xz
-sha1   08b1e365195cf0ed2d35d5f7fb3d6bda9a9e1dbe                         qtconnectivity-opensource-src-5.4.0.tar.xz
-md5    c1fc247771a2fd1d238db8ffc4e65bbf                                 qtconnectivity-opensource-src-5.4.0.tar.xz
+# Hashes from: http://download.qt.io/official_releases/qt/5.4/5.4.1/submodules/qtconnectivity-opensource-src-5.4.1.tar.xz.mirrorlist
+sha256 82c4ffb590f6716672da271ad41c51499b888b46140f40b06367b9eace7b2360 qtconnectivity-opensource-src-5.4.1.tar.xz
+sha1   b49f34507f2ebebd400391a48244828d4ff89fa3                         qtconnectivity-opensource-src-5.4.1.tar.xz
+md5    056c7eba6a396bbd82d265feca1fe47b                                 qtconnectivity-opensource-src-5.4.1.tar.xz
diff --git a/package/qt5/qt5declarative/qt5declarative.hash b/package/qt5/qt5declarative/qt5declarative.hash
index d9f7547..6c31859 100644
--- a/package/qt5/qt5declarative/qt5declarative.hash
+++ b/package/qt5/qt5declarative/qt5declarative.hash
@@ -1,4 +1,4 @@
-# Hashes from: http://download.qt.io/official_releases/qt/5.4/5.4.0/submodules/qtdeclarative-opensource-src-5.4.0.tar.xz.mirrorlist
-sha256 e67c9275b0f6869a7c1e8023ad7c0a23fb19f8a8d2f350371e954ead0cfad7b6 qtdeclarative-opensource-src-5.4.0.tar.xz
-sha1   12c12d50c71cfb1f18c7fabfabe4ad4b364b09fe                         qtdeclarative-opensource-src-5.4.0.tar.xz
-md5    4f928e52e72b5e867b50b4d409d5e99b                                 qtdeclarative-opensource-src-5.4.0.tar.xz
+# Hashes from: http://download.qt.io/official_releases/qt/5.4/5.4.1/submodules/qtdeclarative-opensource-src-5.4.1.tar.xz.mirrorlist
+sha256 15124e242a8a4a8fc5bedd32910b3b0b372b6c2b63f99572c4a2427e668d4417 qtdeclarative-opensource-src-5.4.1.tar.xz
+sha1   fb345784035caafef2d848bb29ad6bfce8ec2f8f                         qtdeclarative-opensource-src-5.4.1.tar.xz
+md5    86dfe5c41e14a142c72fdaa6a64f933c                                 qtdeclarative-opensource-src-5.4.1.tar.xz
diff --git a/package/qt5/qt5enginio/qt5enginio.hash b/package/qt5/qt5enginio/qt5enginio.hash
index 921a0e6..f5124fa 100644
--- a/package/qt5/qt5enginio/qt5enginio.hash
+++ b/package/qt5/qt5enginio/qt5enginio.hash
@@ -1,4 +1,4 @@
-# Hashes from: http://download.qt.io/official_releases/qt/5.4/5.4.0/submodules/qtenginio-opensource-src-5.4.0.tar.xz.mirrorlist
-sha256 fa0954e5f100d38291fd3b3c8c92ade11710b25ae48018af7451c631982d924c qtenginio-opensource-src-5.4.0.tar.xz
-sha1   ec754e21ee461f9a41d66343fb24dcaa358a4a05                         qtenginio-opensource-src-5.4.0.tar.xz
-md5    959a9ebac4faa0464368a318fa677ab6                                 qtenginio-opensource-src-5.4.0.tar.xz
+# Hashes from: http://download.qt.io/official_releases/qt/5.4/5.4.1/submodules/qtenginio-opensource-src-5.4.1.tar.xz.mirrorlist
+sha256 aedb131c29180c7dbc41f888d6a078378a2dd3337766461734cc1b8f07e9577a qtenginio-opensource-src-5.4.1.tar.xz
+sha1   35da0343762a6aa7ded2c62aa4b36e77152a9240                         qtenginio-opensource-src-5.4.1.tar.xz
+md5    c80b967b159c513350fcfca223f435d4                                 qtenginio-opensource-src-5.4.1.tar.xz
diff --git a/package/qt5/qt5graphicaleffects/qt5graphicaleffects.hash b/package/qt5/qt5graphicaleffects/qt5graphicaleffects.hash
index 771e823..deb4c38 100644
--- a/package/qt5/qt5graphicaleffects/qt5graphicaleffects.hash
+++ b/package/qt5/qt5graphicaleffects/qt5graphicaleffects.hash
@@ -1,4 +1,4 @@
-# Hashes from: http://download.qt.io/official_releases/qt/5.4/5.4.0/submodules/qtgraphicaleffects-opensource-src-5.4.0.tar.xz.mirrorlist
-sha256 a43f10e532180eb8400fec65752b36c1adaa9aaf672146035ef630d324a38b19 qtgraphicaleffects-opensource-src-5.4.0.tar.xz
-sha1   b83755ae9457d7a43691e6668a7f7330ff373bdf                         qtgraphicaleffects-opensource-src-5.4.0.tar.xz
-md5    4d26d56c55b0117c37d96e85755da6a4                                 qtgraphicaleffects-opensource-src-5.4.0.tar.xz
+# Hashes from: http://download.qt.io/official_releases/qt/5.4/5.4.1/submodules/qtgraphicaleffects-opensource-src-5.4.1.tar.xz.mirrorlist
+sha256 bae2f0e8120f0b4e6e1b56a486713821615d0af7c69fb4ecdcbabc22b8f8351c qtgraphicaleffects-opensource-src-5.4.1.tar.xz
+sha1   9d0637176c9ce0006917dc52e6d20c975f0fb9a8                         qtgraphicaleffects-opensource-src-5.4.1.tar.xz
+md5    02bec01c2af9a7d08582fbffbfa4976a                                 qtgraphicaleffects-opensource-src-5.4.1.tar.xz
diff --git a/package/qt5/qt5imageformats/qt5imageformats.hash b/package/qt5/qt5imageformats/qt5imageformats.hash
index 829f94b..6534a69 100644
--- a/package/qt5/qt5imageformats/qt5imageformats.hash
+++ b/package/qt5/qt5imageformats/qt5imageformats.hash
@@ -1,4 +1,4 @@
-# Hashes from: http://download.qt.io/official_releases/qt/5.4/5.4.0/submodules/qtimageformats-opensource-src-5.4.0.tar.xz.mirrorlist
-sha256 c89b678df71e44f8cff7b5f8362b7d61430a7aa7cd70147be1267d87ac8fe046 qtimageformats-opensource-src-5.4.0.tar.xz
-sha1   6590b61c51a186837c3d2058d8192886d970f92a                         qtimageformats-opensource-src-5.4.0.tar.xz
-md5    608dbe53d5d3a0872eb20025b681d1dc                                 qtimageformats-opensource-src-5.4.0.tar.xz
+# Hashes from: http://download.qt.io/official_releases/qt/5.4/5.4.1/submodules/qtimageformats-opensource-src-5.4.1.tar.xz.mirrorlist
+sha256 3f6c5bb568ebbee24700c439a60b2e512026dfee5be896c846e4f289cc5b846f qtimageformats-opensource-src-5.4.1.tar.xz
+sha1   6fb124e2f8c644c97b56d023fcd90cf70dd5b1ba                         qtimageformats-opensource-src-5.4.1.tar.xz
+md5    1436680e00ea3e211fd0abdb7c18014a                                 qtimageformats-opensource-src-5.4.1.tar.xz
diff --git a/package/qt5/qt5multimedia/qt5multimedia.hash b/package/qt5/qt5multimedia/qt5multimedia.hash
index 438bcb3..546ce8c 100644
--- a/package/qt5/qt5multimedia/qt5multimedia.hash
+++ b/package/qt5/qt5multimedia/qt5multimedia.hash
@@ -1,4 +1,4 @@
-# Hashes from: http://download.qt.io/official_releases/qt/5.4/5.4.0/submodules/qtmultimedia-opensource-src-5.4.0.tar.xz.mirrorlist
-sha256 5ab9dba27ae64123f2d0124b6884da276d8982aa959d65aa44125f758ef9af51 qtmultimedia-opensource-src-5.4.0.tar.xz
-sha1   a66fe5538f554957f60fc160121a3b0e7e72753b                         qtmultimedia-opensource-src-5.4.0.tar.xz
-md5    3a6a415813b54a54cf283a5e2906e012                                 qtmultimedia-opensource-src-5.4.0.tar.xz
+# Hashes from: http://download.qt.io/official_releases/qt/5.4/5.4.1/submodules/qtmultimedia-opensource-src-5.4.1.tar.xz.mirrorlist
+sha256 3830dd4a11727cc4a3ab32dc10e4cd016739d0b1b0c59685512853e10f1e534e qtmultimedia-opensource-src-5.4.1.tar.xz
+sha1   5e9f06cccc86608ab185fc31a338b7b215342288                         qtmultimedia-opensource-src-5.4.1.tar.xz
+md5    7412a5c62da71b44b9f29e29fdc6af4d                                 qtmultimedia-opensource-src-5.4.1.tar.xz
diff --git a/package/qt5/qt5quick1/qt5quick1.hash b/package/qt5/qt5quick1/qt5quick1.hash
index aae2b26..53fb31f 100644
--- a/package/qt5/qt5quick1/qt5quick1.hash
+++ b/package/qt5/qt5quick1/qt5quick1.hash
@@ -1,4 +1,4 @@
-# Hashes from: http://download.qt.io/official_releases/qt/5.4/5.4.0/submodules/qtquick1-opensource-src-5.4.0.tar.xz.mirrorlist
-sha256 d5a8b77c1c4832383f3c5a39c6dc60e992e61e684e7fbbdf9a208c31d9d032dc qtquick1-opensource-src-5.4.0.tar.xz
-sha1   d4af107f1227f111b7a65924d2ce5e3c08c7ee20                         qtquick1-opensource-src-5.4.0.tar.xz
-md5    c1c5b1072137773d308c8b498cf35d05                                 qtquick1-opensource-src-5.4.0.tar.xz
+# Hashes from: http://download.qt.io/official_releases/qt/5.4/5.4.1/submodules/qtquick1-opensource-src-5.4.1.tar.xz.mirrorlist
+sha256 eb5324c784eef15b3d0f7e2fc2265b0f2e823a31330e88e09379972313ca432d qtquick1-opensource-src-5.4.1.tar.xz
+sha1   f89cccdeac4c31157ac8b97fa96d426b5bb18630                         qtquick1-opensource-src-5.4.1.tar.xz
+md5    16d711d20238e3220fc4030dab608f0b                                 qtquick1-opensource-src-5.4.1.tar.xz
diff --git a/package/qt5/qt5quickcontrols/qt5quickcontrols.hash b/package/qt5/qt5quickcontrols/qt5quickcontrols.hash
index 3fe4e18..b8e8baf 100644
--- a/package/qt5/qt5quickcontrols/qt5quickcontrols.hash
+++ b/package/qt5/qt5quickcontrols/qt5quickcontrols.hash
@@ -1,4 +1,4 @@
-# Hashes from: http://download.qt.io/official_releases/qt/5.4/5.4.0/submodules/qtquickcontrols-opensource-src-5.4.0.tar.xz.mirrorlist
-sha256 b59f43333291c3e73f9a9f92706a4c98d4d810b4efd6803a4edd3f1658fae61e qtquickcontrols-opensource-src-5.4.0.tar.xz
-sha1   1d8dd4a0b1c69e14805c59d4676c8406c65a4114                         qtquickcontrols-opensource-src-5.4.0.tar.xz
-md5    6d2b408526b6197ff2edc32ac3238252                                 qtquickcontrols-opensource-src-5.4.0.tar.xz
+# Hashes from: http://download.qt.io/official_releases/qt/5.4/5.4.1/submodules/qtquickcontrols-opensource-src-5.4.1.tar.xz.mirrorlist
+sha256 fe0852c510b7ab9111310d6880d1b1f34908274099aefa5a14316173b25cfbc2 qtquickcontrols-opensource-src-5.4.1.tar.xz
+sha1   696ddb887bba366cb8132e53a94d571ac94666b8                         qtquickcontrols-opensource-src-5.4.1.tar.xz
+md5    2950c8df9da1e3d418a1e209d24f503a                                 qtquickcontrols-opensource-src-5.4.1.tar.xz
diff --git a/package/qt5/qt5script/qt5script.hash b/package/qt5/qt5script/qt5script.hash
index 19068d3..6c7c3f5 100644
--- a/package/qt5/qt5script/qt5script.hash
+++ b/package/qt5/qt5script/qt5script.hash
@@ -1,4 +1,4 @@
-# Hashes from: http://download.qt.io/official_releases/qt/5.4/5.4.0/submodules/qtscript-opensource-src-5.4.0.tar.xz.mirrorlist
-sha256 f5f35702ec36f24b17878348af1aa1ecf93056a9ddf475097b3fdd52c3330ed0 qtscript-opensource-src-5.4.0.tar.xz
-sha1   7ca8d6ccbc97fb24a9e76b69eeaa5e7e9c321955                         qtscript-opensource-src-5.4.0.tar.xz
-md5    b38b35643d85aea25ff1cbea84f76a82                                 qtscript-opensource-src-5.4.0.tar.xz
+# Hashes from: http://download.qt.io/official_releases/qt/5.4/5.4.1/submodules/qtscript-opensource-src-5.4.1.tar.xz.mirrorlist
+sha256 f432acc8376b86279faee273ff4e26226059d0cffbaced35e05a559d2efbcbaf qtscript-opensource-src-5.4.1.tar.xz
+sha1   1b9ede97f3120c95c2dce322b6140eeb20416044                         qtscript-opensource-src-5.4.1.tar.xz
+md5    70165fd13fa0ba5b1f577f849f0c4f12                                 qtscript-opensource-src-5.4.1.tar.xz
diff --git a/package/qt5/qt5sensors/qt5sensors.hash b/package/qt5/qt5sensors/qt5sensors.hash
index 65dd262..8de2164 100644
--- a/package/qt5/qt5sensors/qt5sensors.hash
+++ b/package/qt5/qt5sensors/qt5sensors.hash
@@ -1,4 +1,4 @@
-# Hashes from: http://download.qt.io/official_releases/qt/5.4/5.4.0/submodules/qtsensors-opensource-src-5.4.0.tar.xz.mirrorlist
-sha256 8a0f33ccf572b9fbcdc46fca602d75270979a2f851b6a1f399d039b1f7aae159 qtsensors-opensource-src-5.4.0.tar.xz
-sha1   5fe798541707acfe7a4955076a0d27d8d58f4d15                         qtsensors-opensource-src-5.4.0.tar.xz
-md5    044f7d3f92c45dd76072077826ca4a07                                 qtsensors-opensource-src-5.4.0.tar.xz
+# Hashes from: http://download.qt.io/official_releases/qt/5.4/5.4.1/submodules/qtsensors-opensource-src-5.4.1.tar.xz.mirrorlist
+sha256 ac4b8e2ef7520e674eb53848ec3d459d8ae92735093106b93104dec7f65edbf8 qtsensors-opensource-src-5.4.1.tar.xz
+sha1   b02811264b6d6fd790d4f3b68f42d6162e73fc4f                         qtsensors-opensource-src-5.4.1.tar.xz
+md5    0787b72a67d1e38a3a47b54b84a6dc42                                 qtsensors-opensource-src-5.4.1.tar.xz
diff --git a/package/qt5/qt5serialport/qt5serialport.hash b/package/qt5/qt5serialport/qt5serialport.hash
index 0259ec4..ba922bb 100644
--- a/package/qt5/qt5serialport/qt5serialport.hash
+++ b/package/qt5/qt5serialport/qt5serialport.hash
@@ -1,4 +1,4 @@
-# Hashes from: http://download.qt.io/official_releases/qt/5.4/5.4.0/submodules/qtserialport-opensource-src-5.4.0.tar.xz.mirrorlist
-sha256 0fc619ef714f5b920ff19ec811b6459c849fafcc697ef4091dbb74e45bd058c3 qtserialport-opensource-src-5.4.0.tar.xz
-sha1   ccfc39045d803405ec36bcfdbf281417dd96663a                         qtserialport-opensource-src-5.4.0.tar.xz
-md5    691b0b71e4ad791a37e288b41979662c                                 qtserialport-opensource-src-5.4.0.tar.xz
+# Hashes from: http://download.qt.io/official_releases/qt/5.4/5.4.1/submodules/qtserialport-opensource-src-5.4.1.tar.xz.mirrorlist
+sha256 79d99e826bf49e469a651cdc2d499d8b54e52bb8aaa279719a3afa03eba5d0ff qtserialport-opensource-src-5.4.1.tar.xz
+sha1   c87b381d6a0b6445c7fab54ef2807a555bfbcb47                         qtserialport-opensource-src-5.4.1.tar.xz
+md5    2333d25916a74260ce39b8a77c7c4288                                 qtserialport-opensource-src-5.4.1.tar.xz
diff --git a/package/qt5/qt5svg/qt5svg.hash b/package/qt5/qt5svg/qt5svg.hash
index 82bb663..060bef4 100644
--- a/package/qt5/qt5svg/qt5svg.hash
+++ b/package/qt5/qt5svg/qt5svg.hash
@@ -1,4 +1,4 @@
-# Hashes from: http://download.qt.io/official_releases/qt/5.4/5.4.0/submodules/qtsvg-opensource-src-5.4.0.tar.xz.mirrorlist
-sha256 68ee762bacc7b63aea29f446549ee6daae46e6fe2120e2460f30d47accc2b789 qtsvg-opensource-src-5.4.0.tar.xz
-sha1   b49d9974dd83c82887a076f9093250cb9fcceea7                         qtsvg-opensource-src-5.4.0.tar.xz
-md5    1c9921a44060bd98096b105c97556e68                                 qtsvg-opensource-src-5.4.0.tar.xz
+# Hashes from: http://download.qt.io/official_releases/qt/5.4/5.4.1/submodules/qtsvg-opensource-src-5.4.1.tar.xz.mirrorlist
+sha256 be8a90ccce2e873d3489a416d1748089f46e329519acb990cf851d6c9f9de12c qtsvg-opensource-src-5.4.1.tar.xz
+sha1   f5bcaa91bd20ba7cdf27006a5553a6f182b62994                         qtsvg-opensource-src-5.4.1.tar.xz
+md5    b4a1e4f5dae26a7500f4f61a550f67eb                                 qtsvg-opensource-src-5.4.1.tar.xz
diff --git a/package/qt5/qt5webkit-examples/qt5webkit-examples.hash b/package/qt5/qt5webkit-examples/qt5webkit-examples.hash
index b0c3bad..6ca2297 100644
--- a/package/qt5/qt5webkit-examples/qt5webkit-examples.hash
+++ b/package/qt5/qt5webkit-examples/qt5webkit-examples.hash
@@ -1,4 +1,4 @@
-# Hashes from: http://download.qt.io/official_releases/qt/5.4/5.4.0/submodules/qtwebkit-examples-opensource-src-5.4.0.tar.xz.mirrorlist
-sha256 b02a2f3d381e66e83fbf972416ad376e2a03ccfa8b4371867c83970bf0f0e9f6 qtwebkit-examples-opensource-src-5.4.0.tar.xz
-sha1   5c03fb53826f22891739b8d537257070aef7e07a                         qtwebkit-examples-opensource-src-5.4.0.tar.xz
-md5    369617a40e64b93686cebd12a99916c0                                 qtwebkit-examples-opensource-src-5.4.0.tar.xz
+# Hashes from: http://download.qt.io/official_releases/qt/5.4/5.4.1/submodules/qtwebkit-examples-opensource-src-5.4.1.tar.xz.mirrorlist
+sha256 19187bb31c349c67f90c92df896f14f9167b982bdef5187e83fd68407826720a qtwebkit-examples-opensource-src-5.4.1.tar.xz
+sha1   7a150502661a3af7dde5c546cdd4a335068a0298                         qtwebkit-examples-opensource-src-5.4.1.tar.xz
+md5    783bfd27e79769f3ceeb206a4921400b                                 qtwebkit-examples-opensource-src-5.4.1.tar.xz
diff --git a/package/qt5/qt5webkit/qt5webkit.hash b/package/qt5/qt5webkit/qt5webkit.hash
index e234f8a..851296f 100644
--- a/package/qt5/qt5webkit/qt5webkit.hash
+++ b/package/qt5/qt5webkit/qt5webkit.hash
@@ -1,4 +1,4 @@
-# Hashes from: http://download.qt.io/official_releases/qt/5.4/5.4.0/submodules/qtwebkit-opensource-src-5.4.0.tar.xz.mirrorlist
-sha256 6c672207765d5d2e88aa14b72b3876ad7bce453397a02e1a3d6e4670a8d188c1 qtwebkit-opensource-src-5.4.0.tar.xz
-sha1   e5e92e126bb673dadc329bc726c21bf4f994d829                         qtwebkit-opensource-src-5.4.0.tar.xz
-md5    e62d72c410dffe5129043f80f624c896                                 qtwebkit-opensource-src-5.4.0.tar.xz
+# Hashes from: http://download.qt.io/official_releases/qt/5.4/5.4.1/submodules/qtwebkit-opensource-src-5.4.1.tar.xz.mirrorlist
+sha256 6607211ef8a913dc778617bf4ba0970e34cc71e1da3abb477eabe0035e7119bf qtwebkit-opensource-src-5.4.1.tar.xz
+sha1   6cfebb74d334e77e26ecbe7d6609578eb46ab276                         qtwebkit-opensource-src-5.4.1.tar.xz
+md5    186627b1ea5b614811fbd0cfa9b4d073                                 qtwebkit-opensource-src-5.4.1.tar.xz
diff --git a/package/qt5/qt5websockets/qt5websockets.hash b/package/qt5/qt5websockets/qt5websockets.hash
index 748c97d..c39b73b 100644
--- a/package/qt5/qt5websockets/qt5websockets.hash
+++ b/package/qt5/qt5websockets/qt5websockets.hash
@@ -1,4 +1,4 @@
-# Hashes from: http://download.qt.io/official_releases/qt/5.4/5.4.0/submodules/qtwebsockets-opensource-src-5.4.0.tar.xz.mirrorlist
-sha256 2acd274a4a983cdd2288678d9005429fded51b5277d0621c4a953fa4f4f4cbdf qtwebsockets-opensource-src-5.4.0.tar.xz
-sha1   d0b7e62bbdd634de01d5321f94a4bdff8b228cf5                         qtwebsockets-opensource-src-5.4.0.tar.xz
-md5    0c406bca48296d0d99cc93b00f40aca7                                 qtwebsockets-opensource-src-5.4.0.tar.xz
+# Hashes from: http://download.qt.io/official_releases/qt/5.4/5.4.1/submodules/qtwebsockets-opensource-src-5.4.1.tar.xz.mirrorlist
+sha256 daf56f98c5e267253bd2d2e421472fc02faa1703a9063cc14cf8afce6967ab44 qtwebsockets-opensource-src-5.4.1.tar.xz
+sha1   3fb9be047b67673f40d272faab5ba0c8055e7717                         qtwebsockets-opensource-src-5.4.1.tar.xz
+md5    308e1e9126e6fab8b06616db9810973e                                 qtwebsockets-opensource-src-5.4.1.tar.xz
diff --git a/package/qt5/qt5x11extras/qt5x11extras.hash b/package/qt5/qt5x11extras/qt5x11extras.hash
index 4a84232..bfa9099 100644
--- a/package/qt5/qt5x11extras/qt5x11extras.hash
+++ b/package/qt5/qt5x11extras/qt5x11extras.hash
@@ -1,4 +1,4 @@
-# Hashes from: http://download.qt.io/official_releases/qt/5.4/5.4.0/submodules/qtx11extras-opensource-src-5.4.0.tar.xz.mirrorlist
-sha256 a3c66bc9e2b877109073f27bbc7865489fa1ed548584f5fc87c371380dc1474c qtx11extras-opensource-src-5.4.0.tar.xz
-sha1   999026cf8389c66af22ffb29767b87b1a793595b                         qtx11extras-opensource-src-5.4.0.tar.xz
-md5    f3a7b9b20dd5f19fc5ed12ef030c59b7                                 qtx11extras-opensource-src-5.4.0.tar.xz
+# Hashes from: http://download.qt.io/official_releases/qt/5.4/5.4.1/submodules/qtx11extras-opensource-src-5.4.1.tar.xz.mirrorlist
+sha256 20a61cdb9f925e9ab959bed1e7aeb1855b721619d5dc5f3691b8c1ce186e8c2e qtx11extras-opensource-src-5.4.1.tar.xz
+sha1   7a75f936df70ac551cfc7b08914365cbb25b122d                         qtx11extras-opensource-src-5.4.1.tar.xz
+md5    87d555e0c7eccaa462a9bba85fb2d4de                                 qtx11extras-opensource-src-5.4.1.tar.xz
diff --git a/package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash b/package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash
index da769dc..5a2804e 100644
--- a/package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash
+++ b/package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash
@@ -1,4 +1,4 @@
-# Hashes from: http://download.qt.io/official_releases/qt/5.4/5.4.0/submodules/qtxmlpatterns-opensource-src-5.4.0.tar.xz.mirrorlist
-sha256 791c697b9bc7a5384e3d0dbec56af7f2194fe7dc91f8b1e0fd502089135e5425 qtxmlpatterns-opensource-src-5.4.0.tar.xz
-sha1   e6d08bca4186b8c10e669836e5f6133ad59c9cce                         qtxmlpatterns-opensource-src-5.4.0.tar.xz
-md5    5ad30d6b478d4e5d71e9c5bef3f3fbf7                                 qtxmlpatterns-opensource-src-5.4.0.tar.xz
+# Hashes from: http://download.qt.io/official_releases/qt/5.4/5.4.1/submodules/qtxmlpatterns-opensource-src-5.4.1.tar.xz.mirrorlist
+sha256 f5142ff4d3f1154550530eddf310d2ff149c6f0055d3d028ad48cb5491c65318 qtxmlpatterns-opensource-src-5.4.1.tar.xz
+sha1   b25c2ec875fa1cbe0de20fd39bdd444c703540b4                         qtxmlpatterns-opensource-src-5.4.1.tar.xz
+md5    ec2970e9e9c38f88be74f18101937c28                                 qtxmlpatterns-opensource-src-5.4.1.tar.xz
