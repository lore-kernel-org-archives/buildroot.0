From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 20 Oct 2018 20:04:06 +0200
Subject: [Buildroot] [git commit] package: drop unversioned hash files
Message-ID: <20181020180239.6172F7FF87@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=56023b1ced8254e4705708d69b2d9f3cb8e94371
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The download infra now knows to look for per-version hash files, so we
can now drop the unversioned hash files.

Instead of removing them, add a comment that redirects the developper to
update the per-version hash files instead (so they do not re-add a
unversioned one in the future).

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Ga??l Portay <gael.portay@savoirfairelinux.com>
Cc: Peter Seiderer <ps.report@gmx.net>
Cc: Julien Corjon <corjon.j@ecagroup.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Luca Ceresoli <luca@lucaceresoli.net>
Cc: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/glibc/glibc.hash                               | 6 ++----
 package/qt5/qt5base/qt5base.hash                       | 7 ++-----
 package/qt5/qt5connectivity/qt5connectivity.hash       | 7 ++-----
 package/qt5/qt5quickcontrols2/qt5quickcontrols2.hash   | 7 ++-----
 package/qt5/qt5serialbus/qt5serialbus.hash             | 7 ++-----
 package/qt5/qt5serialport/qt5serialport.hash           | 7 ++-----
 package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.hash | 7 ++-----
 7 files changed, 14 insertions(+), 34 deletions(-)

diff --git a/package/glibc/glibc.hash b/package/glibc/glibc.hash
index 093392371a..5316f03b10 100644
--- a/package/glibc/glibc.hash
+++ b/package/glibc/glibc.hash
@@ -1,4 +1,2 @@
-# Locally calculated (fetched from Github)
-sha256  6e88cea4002efa7f78d86ea5e98eb92ed423d5a35068751517c4f00f56b8666c     glibc-glibc-2.28-18-g2339d6a55eb7a7e040ae888e906adc49eeb59eab.tar.gz
-# Locally calculated (fetched from Github)
-sha256  e08ab67b2db2d0f0e8f3311d23c54fb8f6d4c1ef6fa0b4047fd5da400e3ce9de     glibc-arc-2018.03-release.tar.gz
+# This hash file is not used; instead, update the
+# hash files in the per-version sub-directories.
diff --git a/package/qt5/qt5base/qt5base.hash b/package/qt5/qt5base/qt5base.hash
index b72e8c71f1..5316f03b10 100644
--- a/package/qt5/qt5base/qt5base.hash
+++ b/package/qt5/qt5base/qt5base.hash
@@ -1,5 +1,2 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtbase-opensource-src-5.6.3.tar.xz.mirrorlist
-sha256 fef48529a6fc2617a30d75d952cb327c6be341fd104154993922184b3b3b4da1 qtbase-opensource-src-5.6.3.tar.xz
-
-# Hash from: https://download.qt.io/official_releases/qt/5.11/5.11.2/submodules/qtbase-everywhere-src-5.11.2.tar.xz.mirrorlist
-sha256 6381e7c3468d5a1dcfe3683b29eeced192faa0f8a32434fec071a59b8bcd0107 qtbase-everywhere-src-5.11.2.tar.xz
+# This hash file is not used; instead, update the
+# hash files in the per-version sub-directories.
diff --git a/package/qt5/qt5connectivity/qt5connectivity.hash b/package/qt5/qt5connectivity/qt5connectivity.hash
index 96f22db60a..5316f03b10 100644
--- a/package/qt5/qt5connectivity/qt5connectivity.hash
+++ b/package/qt5/qt5connectivity/qt5connectivity.hash
@@ -1,5 +1,2 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtconnectivity-opensource-src-5.6.3.tar.xz.mirrorlist
-sha256 fa406e3d63fa4a2acc8ecae6d110f20c766f19a21c7061a12f3c167deb07ccde qtconnectivity-opensource-src-5.6.3.tar.xz
-
-# Hash from: https://download.qt.io/official_releases/qt/5.11/5.11.2/submodules/qtconnectivity-everywhere-src-5.11.2.tar.xz.mirrorlist
-sha256 58901bbd14d3bc472f27fe305fd8dc33cffbd10da83616e9691c04c3290d42c5 qtconnectivity-everywhere-src-5.11.2.tar.xz
+# This hash file is not used; instead, update the
+# hash files in the per-version sub-directories.
diff --git a/package/qt5/qt5quickcontrols2/qt5quickcontrols2.hash b/package/qt5/qt5quickcontrols2/qt5quickcontrols2.hash
index eb97371337..5316f03b10 100644
--- a/package/qt5/qt5quickcontrols2/qt5quickcontrols2.hash
+++ b/package/qt5/qt5quickcontrols2/qt5quickcontrols2.hash
@@ -1,5 +1,2 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtquickcontrols2-opensource-src-5.6.3.tar.xz.mirrorlist
-sha256 ec5078470abe2da888c2be5d1749b5961ef5132487c180ce4d4aa19ea7ff81cb qtquickcontrols2-opensource-src-5.6.3.tar.xz
-
-# Hash from: https://download.qt.io/official_releases/qt/5.11/5.11.2/submodules/qtquickcontrols2-everywhere-src-5.11.2.tar.xz.mirrorlist
-sha256 aa0549f9a4135f9d600b57f53347ebf344e60d21f90c6d844109755da12dcb84 qtquickcontrols2-everywhere-src-5.11.2.tar.xz
+# This hash file is not used; instead, update the
+# hash files in the per-version sub-directories.
diff --git a/package/qt5/qt5serialbus/qt5serialbus.hash b/package/qt5/qt5serialbus/qt5serialbus.hash
index ce66f22e93..5316f03b10 100644
--- a/package/qt5/qt5serialbus/qt5serialbus.hash
+++ b/package/qt5/qt5serialbus/qt5serialbus.hash
@@ -1,5 +1,2 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtserialbus-opensource-src-5.6.3.tar.xz.mirrorlist
-sha256 71c89be3879414e2a11cad93a4882758f9259b1c0aec980560309192c99f9a9e qtserialbus-opensource-src-5.6.3.tar.xz
-
-# Hash from: https://download.qt.io/official_releases/qt/5.11/5.11.2/submodules/qtserialbus-everywhere-src-5.11.2.tar.xz.mirrorlist
-sha256 1774c2c162f85f7cbcb2bdd2ef47507b110a01bc261627b46aa718e87079641e qtserialbus-everywhere-src-5.11.2.tar.xz
+# This hash file is not used; instead, update the
+# hash files in the per-version sub-directories.
diff --git a/package/qt5/qt5serialport/qt5serialport.hash b/package/qt5/qt5serialport/qt5serialport.hash
index 5f7115f669..5316f03b10 100644
--- a/package/qt5/qt5serialport/qt5serialport.hash
+++ b/package/qt5/qt5serialport/qt5serialport.hash
@@ -1,5 +1,2 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtserialport-opensource-src-5.6.3.tar.xz.mirrorlist
-sha256 082d1fee2703aed19f840c4e4031e37c9b929e5bd8ebef2ebac4b28c509bae1a qtserialport-opensource-src-5.6.3.tar.xz
-
-# Hash from: https://download.qt.io/official_releases/qt/5.11/5.11.2/submodules/qtserialport-everywhere-src-5.11.2.tar.xz.mirrorlist
-sha256 b01b69ce421d449402363c0cf617fcc8856e39d6d2c28aa3d06d1f5359dc6f6e qtserialport-everywhere-src-5.11.2.tar.xz
+# This hash file is not used; instead, update the
+# hash files in the per-version sub-directories.
diff --git a/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.hash b/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.hash
index 7a17677ec4..5316f03b10 100644
--- a/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.hash
+++ b/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.hash
@@ -1,5 +1,2 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtvirtualkeyboard-opensource-src-2.0.tar.xz.mirrorlist
-sha256 1d543a851e83fc3de40f48c2935f70278e842589b9a235c2b22f41733e561aec qtvirtualkeyboard-opensource-src-2.0.tar.xz
-
-# Hash from: https://download.qt.io/official_releases/qt/5.11/5.11.2/submodules/qtvirtualkeyboard-everywhere-src-5.11.2.tar.xz.mirrorlist
-sha256 2709500071e7e98ca6f6eecef0f5c80d19ae22aba562293352debd516633b197 qtvirtualkeyboard-everywhere-src-5.11.2.tar.xz
+# This hash file is not used; instead, update the
+# hash files in the per-version sub-directories.
