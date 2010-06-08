From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 8 Jun 2010 23:32:40 +0200
Subject: [Buildroot] [git commit master] Set correct GCC tune option for
	ARM926T(==ARM926EJ-S) core
Message-ID: <20100608220139.E964A909FC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=133a3f90ba01f76568a8b8dec39fd5cf158dd494
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Julien Boibessot <julien.boibessot@armadeus.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 target/Config.in.arch |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/target/Config.in.arch b/target/Config.in.arch
index 1de679f..62721c9 100644
--- a/target/Config.in.arch
+++ b/target/Config.in.arch
@@ -594,7 +594,7 @@ config BR2_GCC_TARGET_TUNE
 	default arm920		if BR2_arm920
 	default arm920t		if BR2_arm920t
 	default arm922t		if BR2_arm922t
-	default arm9tdmi	if BR2_arm926t
+	default arm926ej-s	if BR2_arm926t
 	default arm1136j-s	if BR2_arm1136j_s
 	default arm1136jf-s	if BR2_arm1136jf_s
 	default arm1176jz-s	if BR2_arm1176jz_s
-- 
1.6.3.3
