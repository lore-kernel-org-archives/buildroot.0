From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 13 Nov 2020 23:34:25 +0100
Subject: [Buildroot] [git commit branch/2020.02.x] linux: fix linux CIP
 description typo
Message-ID: <20201113222108.3216D8216C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3cca053d1bafc8913635bac0998a87bcb49ab67c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Version is 4.19 and not 4.4.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 642f821ce51588bd69fa3ca5fcd2ae53097257cd)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux/Config.in b/linux/Config.in
index f83474e1ee..1d08042110 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -43,7 +43,7 @@ config BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	  implementation of software building blocks that meet
 	  these requirements.
 
-	  The CIP community plans to maintain 4.4 for security and
+	  The CIP community plans to maintain 4.19 for security and
 	  bug fixes for more than 10 years.
 
 	  https://www.cip-project.org
