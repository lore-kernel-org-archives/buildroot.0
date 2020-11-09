From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 9 Nov 2020 21:09:26 +0100
Subject: [Buildroot] [git commit branch/next] linux: fix linux CIP
 description typo
Message-ID: <20201117203826.6F65086A87@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=642f821ce51588bd69fa3ca5fcd2ae53097257cd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Version is 4.19 and not 4.4.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux/Config.in b/linux/Config.in
index 5a29545d41..2c69b842f3 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -44,7 +44,7 @@ config BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	  implementation of software building blocks that meet
 	  these requirements.
 
-	  The CIP community plans to maintain 4.4 for security and
+	  The CIP community plans to maintain 4.19 for security and
 	  bug fixes for more than 10 years.
 
 	  https://www.cip-project.org
