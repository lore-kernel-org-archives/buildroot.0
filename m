From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Mar 2014 10:23:36 +0100
Subject: [Buildroot] [git commit] valgrind: Add support for MIPS architecture
Message-ID: <20140329092341.67EE69C415@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=38a03d1292a70c7c5a34151811505284033e0128
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Reviewed-by: Markos Chandras <markos.chandras@imgtec.com>
Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/valgrind/Config.in |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/valgrind/Config.in b/package/valgrind/Config.in
index dacdd86..fd5649b 100644
--- a/package/valgrind/Config.in
+++ b/package/valgrind/Config.in
@@ -1,7 +1,8 @@
 config BR2_PACKAGE_VALGRIND
 	bool "valgrind"
 	depends on BR2_i386 || BR2_x86_64 || BR2_cortex_a8 || \
-		   BR2_cortex_a9 || BR2_powerpc
+		   BR2_cortex_a9 || BR2_powerpc || BR2_mips || \
+		   BR2_mipsel || BR2_mips64 || BR2_mips64el
 	help
 	  Tool for debugging and profiling Linux programs.
 
