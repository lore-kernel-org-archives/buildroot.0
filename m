From: Angelo Compagnucci <angelo@amarulasolutions.com>
Date: Sun,  8 Nov 2020 22:33:13 +0100
Subject: [Buildroot] [PATCH] linux: fix linux CIP description typo
Message-ID: <20201108213313.1336774-1-angelo@amarulasolutions.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Version is 4.19 and not 4.4.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
 linux/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux/Config.in b/linux/Config.in
index b6648f0715..b6c5c02a5e 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -44,7 +44,7 @@ config BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	  implementation of software building blocks that meet
 	  these requirements.
 
-	  The CIP community plans to maintain 4.4 for security and
+	  The CIP community plans to maintain 4.19 for security and
 	  bug fixes for more than 10 years.
 
 	  https://www.cip-project.org
-- 
2.25.1
