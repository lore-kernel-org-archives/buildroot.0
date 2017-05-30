From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Tue, 30 May 2017 19:01:26 +0200
Subject: [Buildroot] [PATCH 4/6] rtl8188eu: fix help text format
In-Reply-To: <1496163688-20870-1-git-send-email-luca@lucaceresoli.net>
References: <1496163688-20870-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <1496163688-20870-4-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Warning reported by check-package.

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 package/rtl8188eu/Config.in | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/rtl8188eu/Config.in b/package/rtl8188eu/Config.in
index 09cde24a0fe5..9263802e09a4 100644
--- a/package/rtl8188eu/Config.in
+++ b/package/rtl8188eu/Config.in
@@ -4,14 +4,14 @@ config BR2_PACKAGE_RTL8188EU
 	help
 	  A standalone driver for the RTL8188EU USB Wi-Fi adapter.
 	  This is needed only for Linux kernels before 3.12.
-	  Since 3.12, there is a (staging) driver in mainline, with a similar
-	  codebase.
+	  Since 3.12, there is a (staging) driver in mainline, with a
+	  similar codebase.
 
-	  Make sure your target kernel has the CONFIG_WIRELESS_EXT config
-	  option enabled.
+	  Make sure your target kernel has the CONFIG_WIRELESS_EXT
+	  config option enabled.
 
-	  Note: this package needs a firmware loading mechanism to load the
-	  binary blob for the chip to work.
+	  Note: this package needs a firmware loading mechanism to load
+	  the binary blob for the chip to work.
 
 	  https://github.com/lwfinger/rtl8188eu
 
-- 
2.7.4
