From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 29 Mar 2019 15:06:00 +0100
Subject: [Buildroot] [git commit] Update for 2018.11.4
Message-ID: <20190329140626.E0F37890C9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a2dbb7a0f66b4fa0ff4d93f768bbccec467c8623
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
[Peter: drop Makefile changes]
(cherry picked from commit 962bef5d075581a7853af4e835b584a658b8f2c0)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/CHANGES b/CHANGES
index 365d2bbe4e..b028ac4d87 100644
--- a/CHANGES
+++ b/CHANGES
@@ -210,6 +210,18 @@
 	#11656: Custom device tree and u-boot boot.scr not integrated..
 	#11666: Touchscreen with (Py)Qt5 should use tslib instead of evdev
 
+2018.11.4, Released March 28th, 2019
+
+	Important / security related fixes.
+
+	Updated/fixed packages: avahi, beecrypt, binutils, botan,
+	busybox, clamav, cups, devmem2, efl, fetchmail, file, fltk,
+	gcc, gdb, git, go, gst-plugins-bad, iproute2, jq,
+	kf5-modemmanager-qt, leveldb, libopenssl, libraw, libseccomp,
+	libsoxr, libssh2, mariadb, mosquitto, nodejs, ntp, openjpeg,
+	perl, php, putty, qt5webkit, rdesktop, runc, samba4, swupdate,
+	systemd, tor, vsftpd, wireshark, xapp_xdm, xen, xlib_libXdmcp
+
 2018.11.3, Released February 23th, 2019
 
 	Important / security related fixes.
