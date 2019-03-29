From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 29 Mar 2019 16:12:53 +0100
Subject: [Buildroot] [git commit] Update for 2018.02.12
Message-ID: <20190329151257.71DAB81E4F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d5c8e9e37adf2b468f3b1e7b30ae262d5ea1a77a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
[Peter: drop Makefile changes]
(cherry picked from commit c2bc504367392fdcb1fa663d5d5f8a8057f89908)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/CHANGES b/CHANGES
index b028ac4d87..e1fb36c215 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1033,6 +1033,17 @@
 	#10961: Grub2 fails to build for x86_64 when BR2_SSP_ALL is
 		enabled
 
+2018.02.12, Released March 29th, 2019
+
+	Important / security related fixes.
+
+	Updated/fixed packages: avahi, beecrypt, busybox, clamav,
+	cups, devmem2, fetchmail, file, fltk, gcc, gdb, git, jq,
+	leveldb, libopenssl, libraw, libseccomp, libssh2,
+	libunistring, mariadb, mosquitto, nodejs, ntp, openjpeg, perl,
+	php, putty, qt5webkit, rdesktop, systemd, wireshark, vsftpd,
+	xapp_xdm, xlib_libXdmcp
+
 2018.02.11, Released February 23th, 2019
 
 	Important / security related fixes.
