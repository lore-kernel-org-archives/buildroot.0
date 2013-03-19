From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 19 Mar 2013 20:15:38 +0100
Subject: [Buildroot] [PATCH] toolchain: update crosstool-NG project URL
Message-ID: <1363720538-12992-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/Config.in |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/toolchain/Config.in b/toolchain/Config.in
index 6311349..fa78cf4 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -26,7 +26,7 @@ config BR2_TOOLCHAIN_CTNG
 	select BR2_TOOLCHAIN_HAS_SHADOW_PASSWORDS
 	help
 	  Say 'y' if you want to generate the toolchain with crosstool-NG
-	  ( http://ymorin.is-a-geek.org/projects/crosstool )
+	  (http://crosstool-ng.org).
 
 	  This is considered experimental, and you can expect some breakage.
 
-- 
1.7.9.5
