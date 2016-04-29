From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 29 Apr 2016 10:19:13 -0300
Subject: [Buildroot] [PATCH buildroot-test] toolchains/config: remove
	sourcery powerpc toolchains
Message-ID: <1461935953-6011-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

To match their removal from main buildroot.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 web/toolchains/configs/sourcery-powerpc-e500v2.config | 3 ---
 web/toolchains/configs/sourcery-powerpc.config        | 2 --
 web/toolchains/configs/toolchain-configs.csv          | 2 --
 3 files changed, 7 deletions(-)
 delete mode 100644 web/toolchains/configs/sourcery-powerpc-e500v2.config
 delete mode 100644 web/toolchains/configs/sourcery-powerpc.config

diff --git a/web/toolchains/configs/sourcery-powerpc-e500v2.config b/web/toolchains/configs/sourcery-powerpc-e500v2.config
deleted file mode 100644
index 133f368..0000000
--- a/web/toolchains/configs/sourcery-powerpc-e500v2.config
+++ /dev/null
@@ -1,3 +0,0 @@
-BR2_powerpc=y
-BR2_powerpc_8548=y
-BR2_TOOLCHAIN_EXTERNAL=y
diff --git a/web/toolchains/configs/sourcery-powerpc.config b/web/toolchains/configs/sourcery-powerpc.config
deleted file mode 100644
index 385ca88..0000000
--- a/web/toolchains/configs/sourcery-powerpc.config
+++ /dev/null
@@ -1,2 +0,0 @@
-BR2_powerpc=y
-BR2_TOOLCHAIN_EXTERNAL=y
diff --git a/web/toolchains/configs/toolchain-configs.csv b/web/toolchains/configs/toolchain-configs.csv
index 6872b69..d9e1e1c 100644
--- a/web/toolchains/configs/toolchain-configs.csv
+++ b/web/toolchains/configs/toolchain-configs.csv
@@ -42,8 +42,6 @@ http://autobuild.buildroot.org/toolchains/configs/sourcery-arm-thumb2.config,x86
 http://autobuild.buildroot.org/toolchains/configs/sourcery-mips64.config,x86,glibc
 http://autobuild.buildroot.org/toolchains/configs/sourcery-mips.config,x86,glibc
 http://autobuild.buildroot.org/toolchains/configs/sourcery-nios2.config,x86,glibc
-http://autobuild.buildroot.org/toolchains/configs/sourcery-powerpc.config,x86,glibc
-http://autobuild.buildroot.org/toolchains/configs/sourcery-powerpc-e500v2.config,x86,glibc
 http://autobuild.buildroot.org/toolchains/configs/sourcery-sh.config,x86,glibc
 http://autobuild.buildroot.org/toolchains/configs/sourcery-x86-64.config,x86,glibc
 http://autobuild.buildroot.org/toolchains/configs/sourcery-x86.config,x86,glibc
-- 
2.7.3
