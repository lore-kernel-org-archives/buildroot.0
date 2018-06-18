From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 18 Jun 2018 20:03:01 +0200
Subject: [Buildroot] [git commit] Update for 2018.02.2
Message-ID: <20180618181746.236EF888A3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0c2b920b2f8a4fa773af94cb77ea924daa2de63b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: drop Makefile changes]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 4acca318b1630b6aa0e1113948e7678dd902b8a3)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/CHANGES b/CHANGES
index baa85622ae..475049f841 100644
--- a/CHANGES
+++ b/CHANGES
@@ -194,6 +194,37 @@
 	#10961: Grub2 fails to build for x86_64 when BR2_SSP_ALL is
 		enabled
 
+2018.02.2, Released May 4th, 2018
+
+	Important / security related fixes.
+
+	Tweak package size/file instrumentation to better handle
+	package rebuilds.
+
+	Revert /etc/shells creation when bash is enabled.
+
+	Exclude /lib/firmware from the rpath fixup logic, as it may
+	contain non-native ELF files.
+
+	Scanpypi: Support the new PyPi infrastructure.
+
+	Handle GCC 8.x on the host.
+
+	Ensure timestamp of /usr is updated to support the systemd
+	ConditionNeedsUpdate option.
+
+	Updated/fixed packages: bluez5_utils, flann, gdb, gnupg2,
+	grub2, libcec, libcgi, libglib2, libgpg-error, libgpgme,
+	libtomcrypt, mbedtls, mkpasswd, php, python, python-requests,
+	python-watchdog, qt53d, qt5websockets, sdl2, sdl2_image,
+	syslog-ng, systemd, tcl, tcllib, uclibc, usb_modeswitch,
+	wireguard, wmctrl
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#10896: /bin/sh not in /etc/shells
+	#10961: Grub2 fails to build for x86_64 when BR2_SSP_ALL is enabled
+
 2018.02.1, Released April 9th, 2018
 
 	Important / security related fixes.
