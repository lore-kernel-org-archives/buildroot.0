From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 9 Oct 2018 09:40:31 +0200
Subject: [Buildroot] [git commit] qt5serialbus: split 5.11.2 license file
 hashes into a separate file
Message-ID: <20181009074430.AE4CF8E56F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a225e451998e0dd5f2eb45fbf9f784f10a9d1602
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/qt5/qt5serialbus/5.11.2/qt5serialbus.hash | 5 +++++
 package/qt5/qt5serialbus/qt5serialbus.hash        | 6 ------
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/package/qt5/qt5serialbus/5.11.2/qt5serialbus.hash b/package/qt5/qt5serialbus/5.11.2/qt5serialbus.hash
new file mode 100644
index 0000000000..1dd9a56487
--- /dev/null
+++ b/package/qt5/qt5serialbus/5.11.2/qt5serialbus.hash
@@ -0,0 +1,5 @@
+# Hashes for license files:
+sha256 edfe70e99be2a7c109d860b19204609e582720b211c50caedac729da372a1253 LICENSE.GPLv2
+sha256 245248009fd0af1725d183248380e476c1283383909358a13686606352bf2a17 LICENSE.GPLv3
+sha256 5ceb37d1c7c1d92878b82af3c0fd5558087f3d5a08a3a4d43850bad4ad265a52 LICENSE.LGPLv3
+sha256 ed8742a95cb9db653a09b050e27ccff5e67ba69c14aa2c3137f2a4e1892f6c0d LICENSE.FDL
diff --git a/package/qt5/qt5serialbus/qt5serialbus.hash b/package/qt5/qt5serialbus/qt5serialbus.hash
index 03feb29993..ce66f22e93 100644
--- a/package/qt5/qt5serialbus/qt5serialbus.hash
+++ b/package/qt5/qt5serialbus/qt5serialbus.hash
@@ -3,9 +3,3 @@ sha256 71c89be3879414e2a11cad93a4882758f9259b1c0aec980560309192c99f9a9e qtserial
 
 # Hash from: https://download.qt.io/official_releases/qt/5.11/5.11.2/submodules/qtserialbus-everywhere-src-5.11.2.tar.xz.mirrorlist
 sha256 1774c2c162f85f7cbcb2bdd2ef47507b110a01bc261627b46aa718e87079641e qtserialbus-everywhere-src-5.11.2.tar.xz
-
-# Hashes for license files:
-sha256 edfe70e99be2a7c109d860b19204609e582720b211c50caedac729da372a1253 LICENSE.GPLv2
-sha256 245248009fd0af1725d183248380e476c1283383909358a13686606352bf2a17 LICENSE.GPLv3
-sha256 5ceb37d1c7c1d92878b82af3c0fd5558087f3d5a08a3a4d43850bad4ad265a52 LICENSE.LGPLv3
-sha256 ed8742a95cb9db653a09b050e27ccff5e67ba69c14aa2c3137f2a4e1892f6c0d LICENSE.FDL
