From: =?UTF-8?q?J=C3=A9r=C3=A9my=20Rosen?= <jeremy.rosen@openwide.fr>
Date: Tue,  7 Jan 2014 11:51:09 +0100
Subject: [Buildroot] [PATCH] udev : mention dependancy on inotify
Message-ID: <1389091869-13609-1-git-send-email-jeremy.rosen@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: J?r?my Rosen <jeremy.rosen@openwide.fr>
---
 package/udev/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/udev/Config.in b/package/udev/Config.in
index 91dc7cf..d915d24 100644
--- a/package/udev/Config.in
+++ b/package/udev/Config.in
@@ -11,7 +11,7 @@ config BR2_PACKAGE_UDEV
 	help
 	  Userspace device daemon.
 
-	  udev requires a Linux kernel >= 2.6.34: it relies on devtmpfs.
+	  udev requires a Linux kernel >= 2.6.34: it relies on devtmpfs and inotify.
 
 	  ftp://ftp.kernel.org/pub/linux/utils/kernel/hotplug/
 
-- 
1.8.5.2
