From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 17 Aug 2014 09:44:53 +0200
Subject: [Buildroot] [git commit] CHANGES: update with recent changes
Message-ID: <20140817074514.4CD159D44A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8c94df28c75ff834ef77df781b753e0453b8c8dd
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES |   19 +++++++++++++++++++
 1 files changed, 19 insertions(+), 0 deletions(-)

diff --git a/CHANGES b/CHANGES
index 5888842..bc95da5 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,22 @@
+2014.08, Not yet released:
+
+	Fixes all over the tree.
+
+	Updated/fixed packages: bandwidthd, bluez5_utils, empty,
+	espeak, fbv, ffmpeg, gd, gnupg2, gst1-plugin-good, iftop,
+	infozip, libcuefile, libeml, libnftl, localedef, ltrace,
+	matchbox, network-manager, nftables, ngrep, openssl, perl,
+	perl-net-ssleay, postgresql, pppd, procps-ng, qt, subversion,
+	synergy, systemd, tar, tftpd, webkit, xapp_rstart, xbmc
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#7124: Use BR toolchain externally results a non-bootable...
+	#7208: Glibc C++ aplications crash if they use exceptions
+	#7250: Cannot build with -std=c++11
+	#7262: Generating locale en_US.UTF-8 fails on 64bit fedora..
+	#7286: systemd 215 doesn't build
+
 2014.08-rc1, Released August 8th, 2014
 
 	Fixes all over the tree and new features.
