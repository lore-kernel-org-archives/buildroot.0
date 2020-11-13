From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 13 Nov 2020 23:34:01 +0100
Subject: [Buildroot] [git commit branch/2020.08.x] linux: fix linux CIP
 description typo
Message-ID: <20201113222113.5C5AE82B63@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=45ceb0b0d9a7f8932bef110993e7abb6f07cbaa0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.08.x

Version is 4.19 and not 4.4.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 642f821ce51588bd69fa3ca5fcd2ae53097257cd)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux/Config.in b/linux/Config.in
index 7c2ede8ce2..3130995be6 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -43,7 +43,7 @@ config BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	  implementation of software building blocks that meet
 	  these requirements.
 
-	  The CIP community plans to maintain 4.4 for security and
+	  The CIP community plans to maintain 4.19 for security and
 	  bug fixes for more than 10 years.
 
 	  https://www.cip-project.org
