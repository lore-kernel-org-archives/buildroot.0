From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 30 Mar 2018 21:06:51 +0200
Subject: [Buildroot] [git commit branch/2018.02.x] linux: Config.in: correct
 typo in kernel compression format help text
Message-ID: <20180330193203.18B8B816A8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=36c973353e06ce2f90e628a62a7ea015ac9f1746
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

s/build/built/.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit d233cc72c4b901f1ea0ae4ce895ff665bd0b78d9)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux/Config.in b/linux/Config.in
index 9024f73f53..3447290a69 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -284,7 +284,7 @@ endchoice
 choice
 	prompt "Kernel compression format"
 	help
-	  This selection will just ensure that the correct host tools are build.
+	  This selection will just ensure that the correct host tools are built.
 	  The actual compression for the kernel should be selected in the
 	  kernel configuration menu.
 
