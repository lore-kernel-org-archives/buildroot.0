From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 9 Oct 2018 09:44:53 +0200
Subject: [Buildroot] [git commit] qt5serialport: fix 5.6.3 license file
 hashes
Message-ID: <20181009074430.B708F8E56F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b1756953e2b53f35c19b1d2784f4bc66303bd5f4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes [1]:

  ERROR: LICENSE.FDL has wrong sha256 hash:
  ERROR: expected: ed8742a95cb9db653a09b050e27ccff5e67ba69c14aa2c3137f2a4e1892f6c0d
  ERROR: got     : e1251235ce9853eecfecfa905da9ee29e9b76e4db2a1c9c4a20699f460419b08

[1] http://autobuild.buildroot.net/results/320db38e94d68b2ea4451c3cc0bd7742c125cedb

We take this opportunity to split the license file hashes in
per-version hash files.

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
[Thomas: split in per-version hash files.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/qt5/qt5serialport/5.11.2/qt5serialport.hash |  6 ++++++
 package/qt5/qt5serialport/5.6.3/qt5serialport.hash  |  7 +++++++
 package/qt5/qt5serialport/qt5serialport.hash        | 12 ------------
 3 files changed, 13 insertions(+), 12 deletions(-)

diff --git a/package/qt5/qt5serialport/5.11.2/qt5serialport.hash b/package/qt5/qt5serialport/5.11.2/qt5serialport.hash
new file mode 100644
index 0000000000..6438065c62
--- /dev/null
+++ b/package/qt5/qt5serialport/5.11.2/qt5serialport.hash
@@ -0,0 +1,6 @@
+# Hashes for license files:
+sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
+sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903 LICENSE.GPL3
+sha256 0dbe024961f6ab5c52689cbd036c977975d0d0f6a67ff97762d96cb819dd5652 LICENSE.GPL3-EXCEPT
+sha256 da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768 LICENSE.LGPL3
+sha256 ed8742a95cb9db653a09b050e27ccff5e67ba69c14aa2c3137f2a4e1892f6c0d LICENSE.FDL
diff --git a/package/qt5/qt5serialport/5.6.3/qt5serialport.hash b/package/qt5/qt5serialport/5.6.3/qt5serialport.hash
new file mode 100644
index 0000000000..56f2f6e500
--- /dev/null
+++ b/package/qt5/qt5serialport/5.6.3/qt5serialport.hash
@@ -0,0 +1,7 @@
+# Hashes for license files:
+sha256 edfe70e99be2a7c109d860b19204609e582720b211c50caedac729da372a1253 LICENSE.GPLv2
+sha256 245248009fd0af1725d183248380e476c1283383909358a13686606352bf2a17 LICENSE.GPLv3
+sha256 1996a36160b2158c2be264d2ddfa6148ebe0f1ececff55aca8d754a1ddcc7bb8 LICENSE.LGPLv21
+sha256 79949ee74297883df6e4e7c4bfe1e75a6e7695376b4a87ffc013e27bda509cb2 LGPL_EXCEPTION.txt
+sha256 5ceb37d1c7c1d92878b82af3c0fd5558087f3d5a08a3a4d43850bad4ad265a52 LICENSE.LGPLv3
+sha256 e1251235ce9853eecfecfa905da9ee29e9b76e4db2a1c9c4a20699f460419b08 LICENSE.FDL
diff --git a/package/qt5/qt5serialport/qt5serialport.hash b/package/qt5/qt5serialport/qt5serialport.hash
index fd5c6642c2..5f7115f669 100644
--- a/package/qt5/qt5serialport/qt5serialport.hash
+++ b/package/qt5/qt5serialport/qt5serialport.hash
@@ -3,15 +3,3 @@ sha256 082d1fee2703aed19f840c4e4031e37c9b929e5bd8ebef2ebac4b28c509bae1a qtserial
 
 # Hash from: https://download.qt.io/official_releases/qt/5.11/5.11.2/submodules/qtserialport-everywhere-src-5.11.2.tar.xz.mirrorlist
 sha256 b01b69ce421d449402363c0cf617fcc8856e39d6d2c28aa3d06d1f5359dc6f6e qtserialport-everywhere-src-5.11.2.tar.xz
-
-# Hashes for license files:
-sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
-sha256 edfe70e99be2a7c109d860b19204609e582720b211c50caedac729da372a1253 LICENSE.GPLv2
-sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903 LICENSE.GPL3
-sha256 245248009fd0af1725d183248380e476c1283383909358a13686606352bf2a17 LICENSE.GPLv3
-sha256 0dbe024961f6ab5c52689cbd036c977975d0d0f6a67ff97762d96cb819dd5652 LICENSE.GPL3-EXCEPT
-sha256 da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768 LICENSE.LGPL3
-sha256 5ceb37d1c7c1d92878b82af3c0fd5558087f3d5a08a3a4d43850bad4ad265a52 LICENSE.LGPLv3
-sha256 ed8742a95cb9db653a09b050e27ccff5e67ba69c14aa2c3137f2a4e1892f6c0d LICENSE.FDL
-sha256 1996a36160b2158c2be264d2ddfa6148ebe0f1ececff55aca8d754a1ddcc7bb8 LICENSE.LGPLv21
-sha256 79949ee74297883df6e4e7c4bfe1e75a6e7695376b4a87ffc013e27bda509cb2 LGPL_EXCEPTION.txt
