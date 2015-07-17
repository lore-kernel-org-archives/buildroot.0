From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Fri, 17 Jul 2015 13:20:39 +0200
Subject: [Buildroot] [PATCH 1/1] trivial: fix typo optimazation
Message-ID: <1437132039-29440-1-git-send-email-patrickdepinguin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
---
 toolchain/toolchain-external/toolchain-external.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index ce9d79f..5ce4d33 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -670,7 +670,7 @@ endif
 # Build toolchain wrapper for preprocessor, C and C++ compiler and setup
 # symlinks for everything else. Skip gdb symlink when we are building our
 # own gdb to prevent two gdb's in output/host/usr/bin.
-# When the link-time-optimazation flag '-flto' is used, then the compiler
+# When the link-time-optimization flag '-flto' is used, then the compiler
 # and binutils have to support lto. ar/ranlib need to be called with the
 # lto plugin. The wrappers *-gcc-ar and *-gcc-ranlib provided by GCC could
 # be used as drop-ins for ar/runlib when Makefiles are used which do not
-- 
1.8.5.1
