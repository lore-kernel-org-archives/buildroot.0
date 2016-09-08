From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed,  7 Sep 2016 22:17:24 -0300
Subject: [Buildroot] [PATCH 1/4] binutils: bump default to version 2.26.x
Message-ID: <1473297447-8804-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/binutils/Config.in.host | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
index 6ef89a5..2333a6e 100644
--- a/package/binutils/Config.in.host
+++ b/package/binutils/Config.in.host
@@ -3,7 +3,7 @@ comment "Binutils Options"
 choice
 	prompt "Binutils Version"
 	depends on !BR2_arc
-	default BR2_BINUTILS_VERSION_2_25_X
+	default BR2_BINUTILS_VERSION_2_26_X
 	help
 	  Select the version of binutils you wish to use.
 
-- 
2.7.3
