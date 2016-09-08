From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 8 Sep 2016 20:28:56 +0200
Subject: [Buildroot] [git commit] binutils: bump default to version 2.26.x
Message-ID: <20160908183012.8C4787FC73@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=49d7c797f152685a7187acbcefd9636d112b33b6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/binutils/Config.in.host | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
index 6ef89a5..2333a6e 100644
--- a/package/binutils/Config.in.host
+++ b/package/binutils/Config.in.host
@@ -3,7 +3,7 @@ comment "Binutils Options"
 choice
 	prompt "Binutils Version"
 	depends on !BR2_arc
-	default BR2_BINUTILS_VERSION_2_25_X
+	default BR2_BINUTILS_VERSION_2_26_X
 	help
 	  Select the version of binutils you wish to use.
 
