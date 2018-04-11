From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 11 Apr 2018 16:07:38 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] linux: Config.in: correct
 typo in kernel compression format help text
Message-ID: <20180411154833.D2C7888454@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d1c1d929ebe4afa2b0ca5869140dd3fbec38e985
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

s/build/built/.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit d233cc72c4b901f1ea0ae4ce895ff665bd0b78d9)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux/Config.in b/linux/Config.in
index 1967dcca84..fe9445a093 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -267,7 +267,7 @@ endchoice
 choice
 	prompt "Kernel compression format"
 	help
-	  This selection will just ensure that the correct host tools are build.
+	  This selection will just ensure that the correct host tools are built.
 	  The actual compression for the kernel should be selected in the
 	  kernel configuration menu.
 
