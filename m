From: Tom Sparks <tom_a_sparks@yahoo.com.au>
Date: Sat,  8 Aug 2015 23:07:42 +1000
Subject: [Buildroot] [PATCH 4/4] ibrdtnd: new package
In-Reply-To: <1439039262-11803-1-git-send-email-tom_a_sparks@yahoo.com.au>
References: <1439039262-11803-1-git-send-email-tom_a_sparks@yahoo.com.au>
Message-ID: <1439039262-11803-2-git-send-email-tom_a_sparks@yahoo.com.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Tom Sparks <tom_a_sparks@yahoo.com.au>
---
 package/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/Config.in b/package/Config.in
index 47d14d7..c901774 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1221,6 +1221,7 @@ endif
 	source "package/hostapd/Config.in"
 	source "package/hplip/Config.in"
 	source "package/httping/Config.in"
+	source "package/ibrdtnd/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	source "package/ifplugd/Config.in"
 endif
-- 
1.9.1
