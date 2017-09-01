From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 1 Sep 2017 16:55:33 +0200
Subject: [Buildroot] [git commit] CHANGES: minor tweaks to 2017.08-rcX notes
Message-ID: <20170901231151.9BFDE818D4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c7ed72d317098e6b32fdf6da1e86e1076acbf87a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Mainly just whitespace.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/CHANGES b/CHANGES
index 352c3a9..d571180 100644
--- a/CHANGES
+++ b/CHANGES
@@ -9,6 +9,7 @@
 	Removed packages: simicfs.
 
 	Issues resolved (http://bugs.buildroot.org):
+
 	#10261: Grub2 fails to build for x86_64
 
 2017.08-rc3, Released August 23rd, 2017
@@ -53,12 +54,12 @@
 
 	Issues resolved (http://bugs.buildroot.org):
 
-	#9926:  systemd-resolved.service: Failed at step  NAMESPACE (systemd 233)
+	#9926:  systemd-resolved.service: Failed at step NAMESPACE (systemd 233)
 	#10021: libqeglfs-viv-integration.so file is missing for qt5 on armv7
 	#10026: lua-5.3.4: fix lua linker error in swupdate
 	#10146: package/skeleton-common fix recursive variable
-	#10156: glibc compilation fails for X86 32bits  (i386)
-	#10201: toolchain-wrapper.c:192: (error) Memory  leak:
+	#10156: glibc compilation fails for X86 32bits (i386)
+	#10201: toolchain-wrapper.c:192: (error) Memory leak:
 	#10221: Buildroot Support
 
 2017.08-rc1, Released August 2nd, 2017
@@ -98,7 +99,7 @@
 	- The host directory no longer has a usr/ component. This
 	  makes it much more natural to use that directory as an
 	  externally used toolchain. For compatibility with existing
-	  scripts, a link usr -> . is still added.
+	  scripts, a usr -> . link is still added.
 
 	- Hashes are now checked on tarballs by Buildroot when a
 	  package is sourced from a Git repository.
