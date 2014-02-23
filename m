From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 23 Feb 2014 22:17:57 +0100
Subject: [Buildroot] [git commit] docs/manual: mention that custom
	toolchains is also useful for BR toolchains
Message-ID: <20140223213139.3D3289B78F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3883823614ba246b72b05c51a4ef3d5db419895a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/manual/configure.txt |   16 ++++++++--------
 1 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/docs/manual/configure.txt b/docs/manual/configure.txt
index a6afafb..42d84fe 100644
--- a/docs/manual/configure.txt
+++ b/docs/manual/configure.txt
@@ -159,14 +159,14 @@ Then, you have three solutions to use an external toolchain:
   toolchain.
 
 * Use a completely custom external toolchain. This is particularly
-  useful for toolchains generated using crosstool-NG. To do this,
-  select the +Custom toolchain+ solution in the +Toolchain+ list. You
-  need to fill the +Toolchain path+, +Toolchain prefix+ and +External
-  toolchain C library+ options. Then, you have to tell Buildroot what
-  your external toolchain supports. If your external toolchain uses
-  the 'glibc' library, you only have to tell whether your toolchain
-  supports C\+\+ or not and whether it has built-in RPC support. If
-  your external toolchain uses the 'uClibc'
+  useful for toolchains generated using crosstool-NG or with Buildroot
+  itself. To do this, select the +Custom toolchain+ solution in the
+  +Toolchain+ list. You need to fill the +Toolchain path+, +Toolchain
+  prefix+ and +External toolchain C library+ options. Then, you have
+  to tell Buildroot what your external toolchain supports. If your
+  external toolchain uses the 'glibc' library, you only have to tell
+  whether your toolchain supports C\+\+ or not and whether it has
+  built-in RPC support. If your external toolchain uses the 'uClibc'
   library, then you have to tell Buildroot if it supports largefile,
   IPv6, RPC, wide-char, locale, program invocation, threads and
   C++. At the beginning of the execution, Buildroot will tell you if
