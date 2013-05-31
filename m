From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 31 May 2013 22:19:00 +0200
Subject: [Buildroot] [git commit] CHANGES: update with recent changes
Message-ID: <20130531202054.D1D4C9A69F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=93252e70cb5afeca1a8da1eaa8a578b80e5c1bbf
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES |    8 +++++++-
 1 files changed, 7 insertions(+), 1 deletions(-)

diff --git a/CHANGES b/CHANGES
index 5814267..4884a59 100644
--- a/CHANGES
+++ b/CHANGES
@@ -2,10 +2,16 @@
 
 	Minor fixes.
 
-	Updated/fixed packages: elf2flt, flex, udpcast
+	External toolchain wrapper fix for if host/usr/bin is placed
+	in the patch.
+
+	Updated/fixed packages: acpid, at91bootstrap, czmq, elf2flt,
+	flex, jamvm, kmod, libplayer, libtirpc, libv4,
+	lttng-babeltrace, opengl, qt5jsbackend, udpcast, wvstreams
 
 	Issues resolved (http://bugs.uclibc.org):
 
+	#4868: Buildroot compile failure for toolchain/gdb-7.4/intl/reloc...
 	#4988: flex and m4 problems
 	#5912: obsolete CVS files
 
