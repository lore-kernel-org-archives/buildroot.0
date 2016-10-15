From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 15 Oct 2016 14:21:38 +0200
Subject: [Buildroot] [git commit] qt53d,
	qt5serialbus: move to technology preview section
Message-ID: <20161015122324.9B0F580AEC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=dad86ab515e07196fd18a28557f895dd49f93d4d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As explained in
https://wiki.qt.io/New_Features_in_Qt_5.6#Technology_Preview_Modules,
not only qt5quickcontrols2 is a technology preview component in Qt 5.6,
but also qt53d, qt5serialbus.

Signed-off-by: Matt Kraai <kraai@ftbfs.org>
[Thomas: improve commit log with a reference.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/qt5/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/qt5/Config.in b/package/qt5/Config.in
index 84cbb0f..234dfdd 100644
--- a/package/qt5/Config.in
+++ b/package/qt5/Config.in
@@ -31,7 +31,6 @@ menuconfig BR2_PACKAGE_QT5
 
 if BR2_PACKAGE_QT5
 source "package/qt5/qt5base/Config.in"
-source "package/qt5/qt53d/Config.in"
 source "package/qt5/qt5canvas3d/Config.in"
 source "package/qt5/qt5connectivity/Config.in"
 source "package/qt5/qt5declarative/Config.in"
@@ -42,7 +41,6 @@ source "package/qt5/qt5location/Config.in"
 source "package/qt5/qt5multimedia/Config.in"
 source "package/qt5/qt5quickcontrols/Config.in"
 source "package/qt5/qt5sensors/Config.in"
-source "package/qt5/qt5serialbus/Config.in"
 source "package/qt5/qt5serialport/Config.in"
 source "package/qt5/qt5svg/Config.in"
 source "package/qt5/qt5tools/Config.in"
@@ -51,7 +49,9 @@ source "package/qt5/qt5websockets/Config.in"
 source "package/qt5/qt5x11extras/Config.in"
 source "package/qt5/qt5xmlpatterns/Config.in"
 comment "technology preview"
+source "package/qt5/qt53d/Config.in"
 source "package/qt5/qt5quickcontrols2/Config.in"
+source "package/qt5/qt5serialbus/Config.in"
 comment "legacy compatibility"
 source "package/qt5/qt5script/Config.in"
 source "package/qt5/qt5webkit/Config.in"
