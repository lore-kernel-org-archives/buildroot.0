From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Mon, 28 Jan 2013 16:35:11 +0100
Subject: [Buildroot] [PATCH] qwt: fix project's URL
Message-ID: <1359387311-5694-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/qwt/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/qwt/Config.in b/package/qwt/Config.in
index d72b30e..3dc6f22 100644
--- a/package/qwt/Config.in
+++ b/package/qwt/Config.in
@@ -5,7 +5,7 @@ config BR2_PACKAGE_QWT
 	  Qwt is a graphics extension to the Qt GUI application
 	  framework. It provides a 2D plotting widget and more.
 
-	  http://http://sourceforge.net/projects/qwt
+	  http://qwt.sourceforge.net/
 
 if BR2_PACKAGE_QWT
 
-- 
1.7.7
