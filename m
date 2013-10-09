From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 9 Oct 2013 16:34:33 +0200
Subject: [Buildroot] [git commit] toolchain-buildroot: fix
	s/Trigerring/Triggering/ typo
Message-ID: <20131009143516.AA3269B99F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=32df094fdc90f6e5b1e95c8e2dcbd27181cd3788
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Reported-by: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../toolchain-buildroot/toolchain-buildroot.mk     |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/toolchain/toolchain-buildroot/toolchain-buildroot.mk b/toolchain/toolchain-buildroot/toolchain-buildroot.mk
index ced430e..f1f07a9 100644
--- a/toolchain/toolchain-buildroot/toolchain-buildroot.mk
+++ b/toolchain/toolchain-buildroot/toolchain-buildroot.mk
@@ -8,7 +8,7 @@ TOOLCHAIN_BUILDROOT_SOURCE =
 
 BUILDROOT_LIBC = $(call qstrip,$(BR2_TOOLCHAIN_BUILDROOT_LIBC))
 
-# Trigerring the build of the host-gcc-final will automatically do the
+# Triggering the build of the host-gcc-final will automatically do the
 # build of binutils, uClibc, kernel headers and all the intermediate
 # gcc steps.
 
