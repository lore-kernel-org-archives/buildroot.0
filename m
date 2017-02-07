From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 7 Feb 2017 17:46:48 +0100
Subject: [Buildroot] [git commit] qt5enginio: move into legacy compatibility
Message-ID: <20170207164722.B66567FB44@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7adfb5bafca666c4fc8b1c300772f8fcfa47ba6c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

See https://wiki.qt.io/New_Features_in_Qt_5.7

Signed-off-by: Julien Corjon <corjon.j@ecagroup.com>
Signed-off-by: Andreas Naumann <anaumann@ultratronik.de>
Signed-off-by: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/qt5/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/qt5/Config.in b/package/qt5/Config.in
index 88b25d5..7afce74 100644
--- a/package/qt5/Config.in
+++ b/package/qt5/Config.in
@@ -56,7 +56,6 @@ source "package/qt5/qt5base/Config.in"
 source "package/qt5/qt5canvas3d/Config.in"
 source "package/qt5/qt5connectivity/Config.in"
 source "package/qt5/qt5declarative/Config.in"
-source "package/qt5/qt5enginio/Config.in"
 source "package/qt5/qt5graphicaleffects/Config.in"
 source "package/qt5/qt5imageformats/Config.in"
 source "package/qt5/qt5location/Config.in"
@@ -75,6 +74,7 @@ source "package/qt5/qt53d/Config.in"
 source "package/qt5/qt5quickcontrols2/Config.in"
 source "package/qt5/qt5serialbus/Config.in"
 comment "legacy compatibility"
+source "package/qt5/qt5enginio/Config.in"
 source "package/qt5/qt5script/Config.in"
 source "package/qt5/qt5webkit/Config.in"
 endif
