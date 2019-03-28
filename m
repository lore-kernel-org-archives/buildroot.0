From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 28 Mar 2019 23:04:10 +0100
Subject: [Buildroot] [git commit branch/2018.11.x] Update for 2018.11.4
Message-ID: <20190328220133.8B7348833B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=962bef5d075581a7853af4e835b584a658b8f2c0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.11.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES  | 12 ++++++++++++
 Makefile |  4 ++--
 2 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/CHANGES b/CHANGES
index 45a153c799..79ea6ca01d 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,15 @@
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
diff --git a/Makefile b/Makefile
index 105ee47322..a895fcc7aa 100644
--- a/Makefile
+++ b/Makefile
@@ -92,9 +92,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2018.11.3
+export BR2_VERSION := 2018.11.4
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1550960000
+BR2_VERSION_EPOCH = 1553810000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
