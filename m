From: Frank Hunleth <fhunleth@troodon-software.com>
Date: Wed, 11 Feb 2015 08:14:49 -0500
Subject: [Buildroot] [PATCH] Makefile: update help text for savedefconfig
Message-ID: <1423660489-31375-1-git-send-email-fhunleth@troodon-software.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Updated text to say that the defconfig is written to the BR2_DEFCONFIG
location.

Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 338c992..f21f924 100644
--- a/Makefile
+++ b/Makefile
@@ -865,7 +865,7 @@ help:
 	@echo '  randconfig             - New config with random answer to all options'
 	@echo '  defconfig              - New config with default answer to all options'
 	@echo '                             BR2_DEFCONFIG, if set, is used as input'
-	@echo '  savedefconfig          - Save current config as ./defconfig (minimal config)'
+	@echo '  savedefconfig          - Save current config to BR2_DEFCONFIG (minimal config)'
 	@echo '  allyesconfig           - New config where all options are accepted with yes'
 	@echo '  allnoconfig            - New config where all options are answered with no'
 	@echo '  randpackageconfig      - New config with random answer to package options'
-- 
1.9.1
