From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 16 Jun 2014 10:50:33 -0300
Subject: [Buildroot] [PATCH 3/6] tstools: switch homepage now that berlios
	is gone
In-Reply-To: <1402926636-3556-1-git-send-email-gustavo@zacarias.com.ar>
References: <1402926636-3556-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1402926636-3556-3-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/tstools/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/tstools/Config.in b/package/tstools/Config.in
index 6712b0f..c6c2696 100644
--- a/package/tstools/Config.in
+++ b/package/tstools/Config.in
@@ -15,7 +15,7 @@ config BR2_PACKAGE_TSTOOLS
 	  cable and satellite data. Program Stream (PS) is typically
 	  used to store data on DVDs.
 
-	  http://tstools.berlios.de/
+	  https://code.google.com/p/tstools/
 
 comment "tstools needs a toolchain w/ largefile"
 	depends on !BR2_LARGEFILE
-- 
1.8.5.5
