From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 29 Mar 2019 15:27:56 +0100
Subject: [Buildroot] [git commit branch/2018.02.x] Update for 2018.02.12
Message-ID: <20190329142801.E44FB886D7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c2bc504367392fdcb1fa663d5d5f8a8057f89908
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES  | 11 +++++++++++
 Makefile |  4 ++--
 2 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/CHANGES b/CHANGES
index 819950ee5b..b16ed3ed47 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,14 @@
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
diff --git a/Makefile b/Makefile
index 37504ae1ce..f15079acc9 100644
--- a/Makefile
+++ b/Makefile
@@ -92,9 +92,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2018.02.11
+export BR2_VERSION := 2018.02.12
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1550952000
+BR2_VERSION_EPOCH = 1553870000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
