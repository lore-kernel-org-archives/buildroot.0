From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 28 Jan 2013 16:42:41 +0100
Subject: [Buildroot] [git commit] qwt: fix project's URL
Message-ID: <20130128154828.480B29A853@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=93af90cfb670849931ffe3741baa630c00682fe5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
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
 
