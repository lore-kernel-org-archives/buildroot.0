From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 31 Jul 2016 18:02:47 +0200
Subject: [Buildroot] [PATCH 1/1] Config.in: fix typo
Message-ID: <1469980967-7267-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Config.in b/Config.in
index 7bb2a01..741a7ce 100644
--- a/Config.in
+++ b/Config.in
@@ -652,7 +652,7 @@ config BR2_STATIC_LIBS
 	bool "static only"
 	help
 	  Build and use only static libraries. No shared libraries will
-	  be instaled on the target. This potentially increases your
+	  be installed on the target. This potentially increases your
 	  code size and should only be used if you know what you are
 	  doing. Note that some packages may not be available when this
 	  option is enabled, due to their need for dynamic library
-- 
2.8.1
