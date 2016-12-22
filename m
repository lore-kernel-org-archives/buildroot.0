From: Andreas Naumann <anaumann@ultratronik.de>
Date: Thu, 22 Dec 2016 15:21:08 +0100
Subject: [Buildroot] [PATCH v4 02/10] qt5enginio : move into legacy
	compatibility
In-Reply-To: <1482416476-20306-1-git-send-email-anaumann@ultratronik.de>
References: <1482416476-20306-1-git-send-email-anaumann@ultratronik.de>
Message-ID: <1482416476-20306-3-git-send-email-anaumann@ultratronik.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Julien Corjon <corjon.j@ecagroup.com>

See https://wiki.qt.io/New_Features_in_Qt_5.7

Signed-off-by: Julien Corjon <corjon.j@ecagroup.com>
Signed-off-by: Andreas Naumann <anaumann@ultratronik.de>
---
 package/qt5/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/qt5/Config.in b/package/qt5/Config.in
index 77e7e09..7fe0bfc 100644
--- a/package/qt5/Config.in
+++ b/package/qt5/Config.in
@@ -35,7 +35,6 @@ source "package/qt5/qt5base/Config.in"
 source "package/qt5/qt5canvas3d/Config.in"
 source "package/qt5/qt5connectivity/Config.in"
 source "package/qt5/qt5declarative/Config.in"
-source "package/qt5/qt5enginio/Config.in"
 source "package/qt5/qt5graphicaleffects/Config.in"
 source "package/qt5/qt5imageformats/Config.in"
 source "package/qt5/qt5location/Config.in"
@@ -54,6 +53,7 @@ source "package/qt5/qt53d/Config.in"
 source "package/qt5/qt5quickcontrols2/Config.in"
 source "package/qt5/qt5serialbus/Config.in"
 comment "legacy compatibility"
+source "package/qt5/qt5enginio/Config.in"
 source "package/qt5/qt5script/Config.in"
 source "package/qt5/qt5webkit/Config.in"
 endif
-- 
1.9.1
