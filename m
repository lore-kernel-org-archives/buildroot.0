From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 19 Nov 2013 09:00:07 +0100
Subject: [Buildroot] [PATCH for-2013.11] glibc/eglibc: remove reference to
	experimental from help text
Message-ID: <1384848007-8853-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since 924b8739da we no longer declare glibc and eglibc support as
experimental, so it shouldn't be mentioned in the help text anymore.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 toolchain/toolchain-buildroot/Config.in | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/toolchain/toolchain-buildroot/Config.in b/toolchain/toolchain-buildroot/Config.in
index 8b37127..81593f1 100644
--- a/toolchain/toolchain-buildroot/Config.in
+++ b/toolchain/toolchain-buildroot/Config.in
@@ -31,9 +31,6 @@ config BR2_TOOLCHAIN_BUILDROOT_EGLIBC
 	  This option selects eglibc as the C library for the
 	  cross-compilation toolchain.
 
-	  The eglibc support in the Buildroot toolchain backend is
-	  very recent, and therefore marked experimental.
-
 	  http://eglibc.org
 
 config BR2_TOOLCHAIN_BUILDROOT_GLIBC
@@ -51,9 +48,6 @@ config BR2_TOOLCHAIN_BUILDROOT_GLIBC
 	  This option selects glibc as the C library for the
 	  cross-compilation toolchain.
 
-	  The glibc support in the Buildroot toolchain backend is
-	  very recent, and therefore marked experimental.
-
 	  http://www.gnu.org/software/libc/
 
 comment "(e)glibc only available with shared lib support"
-- 
1.8.4.2
