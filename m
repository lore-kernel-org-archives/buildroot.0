From: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
Date: Tue, 31 Jan 2017 08:59:05 +0100
Subject: [Buildroot] [PATCH v6 3/9] qt53d/qt5quickcontrols2/qt5serialbus :
	move out of tech preview
In-Reply-To: <1485849551-20469-1-git-send-email-mr.zoltan.gyarmati@gmail.com>
References: <1485849551-20469-1-git-send-email-mr.zoltan.gyarmati@gmail.com>
Message-ID: <1485849551-20469-4-git-send-email-mr.zoltan.gyarmati@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Julien Corjon <corjon.j@ecagroup.com>

See http://blog.qt.io/blog/2016/06/16/qt-5-7-released/

Signed-off-by: Julien Corjon <corjon.j@ecagroup.com>
Signed-off-by: Andreas Naumann <anaumann@ultratronik.de>
Signed-off-by: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
---
 package/qt5/Config.in | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/qt5/Config.in b/package/qt5/Config.in
index faa58d8..cff118d 100644
--- a/package/qt5/Config.in
+++ b/package/qt5/Config.in
@@ -44,6 +44,7 @@ config BR2_QT5_VERSION_5_6
 
 endchoice
 
+source "package/qt5/qt53d/Config.in"
 source "package/qt5/qt5base/Config.in"
 source "package/qt5/qt5canvas3d/Config.in"
 source "package/qt5/qt5connectivity/Config.in"
@@ -53,7 +54,9 @@ source "package/qt5/qt5imageformats/Config.in"
 source "package/qt5/qt5location/Config.in"
 source "package/qt5/qt5multimedia/Config.in"
 source "package/qt5/qt5quickcontrols/Config.in"
+source "package/qt5/qt5quickcontrols2/Config.in"
 source "package/qt5/qt5sensors/Config.in"
+source "package/qt5/qt5serialbus/Config.in"
 source "package/qt5/qt5serialport/Config.in"
 source "package/qt5/qt5svg/Config.in"
 source "package/qt5/qt5tools/Config.in"
@@ -61,10 +64,6 @@ source "package/qt5/qt5webchannel/Config.in"
 source "package/qt5/qt5websockets/Config.in"
 source "package/qt5/qt5x11extras/Config.in"
 source "package/qt5/qt5xmlpatterns/Config.in"
-comment "technology preview"
-source "package/qt5/qt53d/Config.in"
-source "package/qt5/qt5quickcontrols2/Config.in"
-source "package/qt5/qt5serialbus/Config.in"
 comment "legacy compatibility"
 source "package/qt5/qt5enginio/Config.in"
 source "package/qt5/qt5script/Config.in"
-- 
2.7.4
