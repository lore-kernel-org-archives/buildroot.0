From: Mike Frysinger <vapier@gentoo.org>
Date: Wed, 17 Nov 2010 01:41:33 -0500
Subject: [Buildroot] [PATCH] toolchain-external: fix indentation in Kconfig
Message-ID: <1289976093-22148-1-git-send-email-vapier@gentoo.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
---
 toolchain/toolchain-external/Config.in |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index efc8378..a340de6 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -14,9 +14,9 @@ config BR2_TOOLCHAIN_EXTERNAL_GLIBC
 endchoice
 
 config BR2_TOOLCHAIN_EXTERNAL_STRIP
-        bool
-        default y
-        prompt "Strip shared libraries"
+	bool
+	default y
+	prompt "Strip shared libraries"
 	help
 	  Strip shared libraries copied from the external toolchain.
 endif
-- 
1.7.3.2
