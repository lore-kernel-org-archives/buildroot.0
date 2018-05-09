From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 9 May 2018 22:53:39 +0200
Subject: [Buildroot] [git commit] CHANGES: additional updates for 2018.05-rc1
Message-ID: <20180509205350.A28228C8A7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=449f430ecf06b73ff4a3e5aa73444d982757dcb4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 - Add some explanations about the Blackfin removal, as suggested by
   Yann E. Morin.

 - Add list of resolved issues.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 CHANGES | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/CHANGES b/CHANGES
index 1ca80c244e..c386ef7cc6 100644
--- a/CHANGES
+++ b/CHANGES
@@ -4,7 +4,8 @@
 	uClibc-ng 1.0.30, Linux kernel headers bumped to 4.16.x.
 
 	Architecture: support for the Blackfin architecture has been
-	removed.
+	removed, as it was removed from Linux upstream, poorly
+	maintained in binutils/gdb, and abandoned by Analog Devices.
 
 	Numerous packages updated to have hashes for their license
 	files.
@@ -95,6 +96,19 @@
 	freescale_p1010rdb_pa, freescale_mpc8315erdb, riotboard,
 	teliv_evk_pro3
 
+	Issues resolved (http://bugs.uclibc.org):
+
+	#10151: toolchain eclipse register : fails with a custom
+		BR2_HOST_DIR
+	#10511: Packages get downloaded uncompressed with wget
+	#10531: QtWebengine doesn't build if the host hasn't a 32 bits
+		C++ compiler working
+	#10846: error in compiling gnutls
+	#10886: openssl-1.0.2n fails to build
+	#10896: /bin/sh not in /etc/shells
+	#10961: Grub2 fails to build for x86_64 when BR2_SSP_ALL is
+		enabled
+
 2018.02.1, Released April 9th, 2018
 
 	Important / security related fixes.
