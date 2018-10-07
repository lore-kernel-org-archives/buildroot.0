From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  7 Oct 2018 13:57:42 +0200
Subject: [Buildroot] [PATCH 5/6] package/qt5: drop unversioned hash files
In-Reply-To: <cover.1538913431.git.yann.morin.1998@free.fr>
References: <cover.1538913431.git.yann.morin.1998@free.fr>
Message-ID: <36f31dd619e2ebef80334f935c9f2e9cc528de50.1538913431.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The download infra now knows to look for per-version hash files, so we
can now drop the unversioned hash files.

Instead of removing them, add a comment that redirect the developper to
update the per-version hash files instead (so they do not re-add a
unversioned hash file in the future).

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Ga?l Portay <gael.portay@savoirfairelinux.com>
Cc: Peter Seiderer <ps.report@gmx.net>
Cc: Julien Corjon <corjon.j@ecagroup.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Luca Ceresoli <luca@lucaceresoli.net>
Cc: Baruch Siach <baruch@tkos.co.il>
---
 package/qt5/qt5base/qt5base.hash                       | 16 ++--------------
 package/qt5/qt5quickcontrols2/qt5quickcontrols2.hash   |  7 ++-----
 package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.hash | 14 ++------------
 3 files changed, 6 insertions(+), 31 deletions(-)

diff --git a/package/qt5/qt5base/qt5base.hash b/package/qt5/qt5base/qt5base.hash
index daac4e06a3..5316f03b10 100644
--- a/package/qt5/qt5base/qt5base.hash
+++ b/package/qt5/qt5base/qt5base.hash
@@ -1,14 +1,2 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtbase-opensource-src-5.6.3.tar.xz.mirrorlist
-sha256 fef48529a6fc2617a30d75d952cb327c6be341fd104154993922184b3b3b4da1 qtbase-opensource-src-5.6.3.tar.xz
-
-# Hash from: https://download.qt.io/official_releases/qt/5.11/5.11.2/submodules/qtbase-everywhere-src-5.11.2.tar.xz.mirrorlist
-sha256 6381e7c3468d5a1dcfe3683b29eeced192faa0f8a32434fec071a59b8bcd0107 qtbase-everywhere-src-5.11.2.tar.xz
-
-# Hashes for license files:
-sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
-sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903 LICENSE.GPL3
-sha256 0dbe024961f6ab5c52689cbd036c977975d0d0f6a67ff97762d96cb819dd5652 LICENSE.GPL3-EXCEPT
-sha256 88ec689407cf2df9b2eb5c45952564d51ce73c129a3bdffb15c0d2d161ad7558 LICENSE.LGPLv3
-sha256 ed8742a95cb9db653a09b050e27ccff5e67ba69c14aa2c3137f2a4e1892f6c0d LICENSE.FDL
-sha256 1f4fa3d202198f5d836993748eac9d91157e2cec7fb8426f56000a02a677cdc5 header.BSD
-sha256 2a886915de4f296cdae5ed67064f86dba01d0c55286d86e8487f2a5caaf40216 src/3rdparty/harfbuzz-ng/COPYING
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
diff --git a/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.hash b/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.hash
index d4b7e58e38..5316f03b10 100644
--- a/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.hash
+++ b/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.hash
@@ -1,12 +1,2 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtvirtualkeyboard-opensource-src-2.0.tar.xz.mirrorlist
-sha256 1d543a851e83fc3de40f48c2935f70278e842589b9a235c2b22f41733e561aec qtvirtualkeyboard-opensource-src-2.0.tar.xz
-
-# Hash from: https://download.qt.io/official_releases/qt/5.11/5.11.2/submodules/qtvirtualkeyboard-everywhere-src-5.11.2.tar.xz.mirrorlist
-sha256 2709500071e7e98ca6f6eecef0f5c80d19ae22aba562293352debd516633b197 qtvirtualkeyboard-everywhere-src-5.11.2.tar.xz
-
-# Hashes for license files:
-sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903 LICENSE.GPL3
-sha256 7a45a9769d19545480a241230e6ea520b5156fac00930dcd69b6886749743d10 src/virtualkeyboard/3rdparty/lipi-toolkit/MIT_LICENSE.txt
-sha256 05cc719deafd0ab083b03296bb2911de10d116953b626a7629b9ca59938038b1 src/virtualkeyboard/3rdparty/openwnn/NOTICE
-sha256 b5830d96fb5a7e7e7ebcc295f352846b4b998e78fdc8f9aa68e134d2e4b39986 src/virtualkeyboard/3rdparty/pinyin/NOTICE
-sha256 9400a6128693d2f25653698e695f554660c71efccc8c21af28bf143e35199db6 src/virtualkeyboard/3rdparty/tcime/COPYING
+# This hash file is not used; instead, update the
+# hash files in the per-version sub-directories.
-- 
2.14.1
