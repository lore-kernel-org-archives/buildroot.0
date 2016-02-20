From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 21 Feb 2016 00:12:04 +0100
Subject: [Buildroot] [PATCH 1/1] package/e2fsprogs: remove whitespace
Message-ID: <1456009925-11756-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/e2fsprogs/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/e2fsprogs/Config.in b/package/e2fsprogs/Config.in
index ac3eae7..e540337 100644
--- a/package/e2fsprogs/Config.in
+++ b/package/e2fsprogs/Config.in
@@ -1,4 +1,3 @@
-
 config BR2_PACKAGE_E2FSPROGS
 	bool "e2fsprogs"
 	depends on BR2_USE_WCHAR # util-linux
-- 
2.7.0
