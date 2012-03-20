From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 20 Mar 2012 09:20:23 +0100
Subject: [Buildroot] [git commit] uClibc: default to 0.9.33
Message-ID: <20120320132247.F31FF953F8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c433c5ad7c258b9d6fd8e60dd180dfb3a3446dfa
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This is the current stable version, and E.G. systemd doesn't build with
earlier versions.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/uClibc/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/toolchain/uClibc/Config.in b/toolchain/uClibc/Config.in
index ed9d2f5..64c5a9f 100644
--- a/toolchain/uClibc/Config.in
+++ b/toolchain/uClibc/Config.in
@@ -6,7 +6,7 @@ comment "uClibc Options"
 choice
 	prompt "uClibc C library Version"
 	default BR2_UCLIBC_VERSION_0_9_31 if (BR2_avr32 || BR2_sh) # 0.9.32 broken
-	default BR2_UCLIBC_VERSION_0_9_32
+	default BR2_UCLIBC_VERSION_0_9_33
 	help
 	  Select the version of uClibc you wish to use.
 
