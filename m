From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 7 Jul 2016 17:09:39 +0200
Subject: [Buildroot] [git commit] qt: fix typo in Config.in
Message-ID: <20160707150954.8AC66821D6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d652677f7971988e63669e6a68c59763d4fdfc7f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/qt/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/qt/Config.in b/package/qt/Config.in
index 99b00a0..0fa2424 100644
--- a/package/qt/Config.in
+++ b/package/qt/Config.in
@@ -265,7 +265,7 @@ config BR2_PACKAGE_QT_SYSTEMJPEG
 config BR2_PACKAGE_QT_QTJPEG
 	bool "Use Qt bundled libjpeg"
 	help
-	  Link against libjpeg proveded with Qt
+	  Link against libjpeg provided with Qt
 endchoice
 
 choice
