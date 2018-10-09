From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 9 Oct 2018 09:19:17 +0200
Subject: [Buildroot] [git commit] qt5serialbus: fix 5.6.3 license file hashes
Message-ID: <20181009074430.A39828E56F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6b2dbd384c0b68f6fb6b479e5bb9d88459ddebfa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes [1]:

  ERROR: LICENSE.FDL has wrong sha256 hash:
  ERROR: expected: ed8742a95cb9db653a09b050e27ccff5e67ba69c14aa2c3137f2a4e1892f6c0d
  ERROR: got     : f827ad079686ba92cc94811e35492d0e8966f704008b6da9eeda0b659fb58a8d

[1] http://autobuild.buildroot.net/results/f8dba48bc1e71332f3983e78c40989e5f864abf3

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/qt5/qt5serialbus/5.6.3/qt5serialbus.hash | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/qt5/qt5serialbus/5.6.3/qt5serialbus.hash b/package/qt5/qt5serialbus/5.6.3/qt5serialbus.hash
new file mode 100644
index 0000000000..574fcc5294
--- /dev/null
+++ b/package/qt5/qt5serialbus/5.6.3/qt5serialbus.hash
@@ -0,0 +1,5 @@
+# Hashes for license files:
+sha256 edfe70e99be2a7c109d860b19204609e582720b211c50caedac729da372a1253 LICENSE.GPLv2
+sha256 245248009fd0af1725d183248380e476c1283383909358a13686606352bf2a17 LICENSE.GPLv3
+sha256 5ceb37d1c7c1d92878b82af3c0fd5558087f3d5a08a3a4d43850bad4ad265a52 LICENSE.LGPLv3
+sha256 f827ad079686ba92cc94811e35492d0e8966f704008b6da9eeda0b659fb58a8d LICENSE.FDL
