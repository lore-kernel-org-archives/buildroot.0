From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 24 Aug 2009 22:28:47 +0200
Subject: [Buildroot] [git commit master] Update CHANGES after recent fixes
Message-ID: <20090824202957.31213775A4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=1357368035475cea7ac89f27efdf8777ad1c78b1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 CHANGES |    9 +++++++--
 1 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/CHANGES b/CHANGES
index ec8bfde..09a76f5 100644
--- a/CHANGES
+++ b/CHANGES
@@ -4,15 +4,20 @@
 
 	New packages: libuuid, gcc 4.3.4.
 
-	Updated/fixed packages: busybox, classpath, gzip, ipsec-tools,
-	jamvm, libusb, microperl, neon, popt, sed, webkit.
+	Updated/fixed packages: busybox, berkeleydb, classpath, dbus,
+	directfb, enchant, gzip, ipsec-tools, jamvm, libusb,
+	microperl, neon, popt, sed, webkit.
 
 	Fixed issue with 'make oldconfig'
 
 	Issues resolved (http://bugs.uclibc.org):
 
+	#471: Allow directfb compilation with debug
 	#525: sed broken with external toolchain
 	#537: Fix gzip build with recent glibc
+	#541: Removal of CVS directories in target filesystem broken
+	#547: berkeleydb: Update config.{sub, guess}
+	#549: enchant: Fix dependencies.
 
 2009.08-rc1, Released August 2nd, 2009:
 
-- 
1.6.3.3
