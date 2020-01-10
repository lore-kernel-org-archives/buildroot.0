From: Christian Stewart <christian@paral.in>
Date: Thu,  9 Jan 2020 20:32:36 -0800
Subject: [Buildroot] [PATCH 1/1] package/rtl8821au: update site url to
 correct repository
Message-ID: <20200110043236.1874260-1-christian@paral.in>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/rtl8821au/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/rtl8821au/Config.in b/package/rtl8821au/Config.in
index 9827ad5b94..87c191b22a 100644
--- a/package/rtl8821au/Config.in
+++ b/package/rtl8821au/Config.in
@@ -7,4 +7,4 @@ config BR2_PACKAGE_RTL8821AU
 	help
 	  rtl8821au wifi driver
 
-	  https://github.com/paralin/rtl8821au
+	  https://github.com/abperiasamy/rtl8812AU_8821AU_linux
-- 
2.24.1
