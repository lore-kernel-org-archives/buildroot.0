From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 08 Aug 2015 10:57:06 -0000
Subject: [Buildroot] [git commit branch/next] trivial: fix typo optimazation
Message-ID: <20150808105636.1361C7FB5A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ee4e4a96d71a634d626cc26b9259f2243a588c1a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/toolchain-external/toolchain-external.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

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
