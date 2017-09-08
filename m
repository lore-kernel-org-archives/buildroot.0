From: Baruch Siach <baruch@tkos.co.il>
Date: Fri,  8 Sep 2017 12:23:49 +0300
Subject: [Buildroot] [PATCH 2/2] strace: update homepage link
In-Reply-To: <8423660704daf069a26cafd6fd43009796262e33.1504862629.git.baruch@tkos.co.il>
References: <8423660704daf069a26cafd6fd43009796262e33.1504862629.git.baruch@tkos.co.il>
Message-ID: <1fa4f0523a9b34911d8dfea8f688e8763408251a.1504862629.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

strace moved to a new homepage as upstream commit 2bba131575878 (Update
homepage URL) indicates.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/strace/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/strace/Config.in b/package/strace/Config.in
index 501c9646d6f0..b84b3fd179ea 100644
--- a/package/strace/Config.in
+++ b/package/strace/Config.in
@@ -7,7 +7,7 @@ config BR2_PACKAGE_STRACE
 	  Allows you to track what system calls a program makes
 	  while it is running.
 
-	  http://sourceforge.net/projects/strace/
+	  https://strace.io
 
 comment "strace needs a toolchain w/ headers >= 4.0 on nios2"
 	depends on BR2_nios2
-- 
2.14.1
