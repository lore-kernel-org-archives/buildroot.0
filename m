From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 9 Sep 2017 22:17:11 +0200
Subject: [Buildroot] [git commit] strace: update homepage link
Message-ID: <20170909200950.6C1E280FFB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9cf784657a0a33553814c1ed586898c060ddfffd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

strace moved to a new homepage as upstream commit 2bba131575878 (Update
homepage URL) indicates.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/strace/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/strace/Config.in b/package/strace/Config.in
index 501c964..b84b3fd 100644
--- a/package/strace/Config.in
+++ b/package/strace/Config.in
@@ -7,7 +7,7 @@ config BR2_PACKAGE_STRACE
 	  Allows you to track what system calls a program makes
 	  while it is running.
 
-	  http://sourceforge.net/projects/strace/
+	  https://strace.io
 
 comment "strace needs a toolchain w/ headers >= 4.0 on nios2"
 	depends on BR2_nios2
