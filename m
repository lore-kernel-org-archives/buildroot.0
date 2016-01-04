From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 4 Jan 2016 21:59:20 +0100
Subject: [Buildroot] [git commit] strace: enable supported nios2 arch
Message-ID: <20160104210246.AD620826C4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=df903787f15b1e8f8da3879ef93fdfbdb9ecb203
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Support for Nios-II has been added in strace release 4.11.

Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Tested-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/strace/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/strace/Config.in b/package/strace/Config.in
index bdd7638..bbb582a 100644
--- a/package/strace/Config.in
+++ b/package/strace/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_STRACE
 	bool "strace"
-	depends on !BR2_nios2
 	help
 	  A useful diagnostic, instructional, and debugging tool.
 	  Allows you to track what system calls a program makes
