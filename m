From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Sat, 19 Nov 2016 17:57:14 -0500
Subject: [Buildroot] [PATCH 1/1] dosfstools: update URL in Config.in.host
Message-ID: <1479596234-2516-1-git-send-email-danomimanchego123@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update URL in Config.in.host to match Config.in.

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
---
 package/dosfstools/Config.in.host | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/dosfstools/Config.in.host b/package/dosfstools/Config.in.host
index 6156c5a..fc488c0 100644
--- a/package/dosfstools/Config.in.host
+++ b/package/dosfstools/Config.in.host
@@ -3,4 +3,4 @@ config BR2_PACKAGE_HOST_DOSFSTOOLS
 	help
 	  Tools for creating and checking DOS FAT filesystems.
 
-	  http://www.daniel-baumann.ch/software/dosfstools/
+	  https://github.com/dosfstools/dosfstools
-- 
1.9.1
