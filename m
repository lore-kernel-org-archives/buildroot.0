From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 19 Nov 2013 09:13:11 +0100
Subject: [Buildroot] [git commit] glibc/eglibc: remove reference to
	experimental from help text
Message-ID: <20131119110247.D2DAD9BD4E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b478d30a6d4eed00439cba627d7f45fe3e4025d4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since 924b8739da we no longer declare glibc and eglibc support as
experimental, so it shouldn't be mentioned in the help text anymore.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 toolchain/toolchain-buildroot/Config.in |    6 ------
 1 files changed, 0 insertions(+), 6 deletions(-)

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
