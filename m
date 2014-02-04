From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 4 Feb 2014 22:46:02 +0100
Subject: [Buildroot] [git commit] CHANGES: add issues resolved in 2014.02
	cycle
Message-ID: <20140204214638.473539C7E2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=474defab2b692e69d6c2ea915e6d21309b7ffba8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES |   22 ++++++++++++++++++++++
 1 files changed, 22 insertions(+), 0 deletions(-)

diff --git a/CHANGES b/CHANGES
index 8b5395e..67f9917 100644
--- a/CHANGES
+++ b/CHANGES
@@ -80,6 +80,28 @@
 	Removed packages: lzma, netkitbase, netkittelnet, pkg-config,
 	squashfs3, ttcp
 
+	Issues resolved (http://bugs.uclibc.org):
+
+	#65:   new package: dbus c++ language bindings
+	#769:  Update configuration menu for MIPS target
+	#2629: Segmentation faults and division by zero in Grub on ext2
+	#5024: grub fails to build for x86_64 target architecture
+	#5066: New-Package: net-tools
+	#5072: ncurses: add ncurses-progs to target
+	#5294: uclibc build ignores target CFLAGS and LDFLAGS
+	#5366: Login doesn't work with util-linux versions of login/agetty
+	#5378: dropbear Makefile broken
+	#5390: System banner - change to empty doesn't remove /etc/issue
+	#5798: ncurses-5.9 fails to compile statically
+	#5810: Buildroot 2012.11: Additional GCC option "-msoft-float" ...
+	#6080: Git fetch caching
+	#6092: Bootable ISO image creation seems to have stopped working..
+	#6272: coreutils build fails
+	#6656: Build Qt5 with ccache
+	#6662: internal compiler error: Segmentation fault during making..
+	#6752: genext2fs: e2fsck must run before tunefs -U random
+	#6830: Qt5: no fonts are installed
+
 2013.11, Released November 30th, 2013:
 
 	Minor fixes.
