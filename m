From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue,  6 Mar 2018 16:46:51 +0100
Subject: [Buildroot] [PATCH] linux: Config.in: correct typo in kernel
 compression format help text
Message-ID: <20180306154651.30399-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

s/build/built/.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux/Config.in b/linux/Config.in
index e299af4008..dadfc88da4 100644
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
 
-- 
2.11.0
