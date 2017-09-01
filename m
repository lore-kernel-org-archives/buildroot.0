From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 1 Sep 2017 17:06:23 +0200
Subject: [Buildroot] [git commit] CHANGES: update with recent changes
Message-ID: <20170901231151.C3ABC818D4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=13c443963f21a2949b21d85f9078746dfcb5b875
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/CHANGES b/CHANGES
index d571180..9f1d389 100644
--- a/CHANGES
+++ b/CHANGES
@@ -2,7 +2,14 @@
 
 	Fixes all over the tree.
 
-	Updated/fixed packages:
+	Toolchain: Don't allow internal toolchain builds for MIPS
+	M6201/P6600, as support for these are not yet in mainline GCC.
+
+	Updated/fixed packages: bcusdk, connman, dialog, dnsmasq,
+	gnupg, grub2, iostat, iucode-tool, libgcrypt, libkcapi,
+	libphidget, libv4l, linux-tools, mediastreamer, minidlna,
+	nss-pam-ldapd, nvidia-driver, qt-webkit-kiosk, rpcbind, squid,
+	transmission, vde2, vim
 
 	Updated/fixed defconfigs:
 
