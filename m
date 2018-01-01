From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 1 Jan 2018 12:20:54 +0100
Subject: [Buildroot] [git commit branch/2017.02.x] Update for 2017.02.9
Message-ID: <20180101112255.0E63B839BD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8f03647169a17b10503594e5f3d95113a01171f9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES  | 15 +++++++++++++++
 Makefile |  4 ++--
 2 files changed, 17 insertions(+), 2 deletions(-)

diff --git a/CHANGES b/CHANGES
index 6387435..a632a936 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,18 @@
+2017.02.9, Released January 1st, 2018
+
+	Important / security related fixes.
+
+	Fix divide by zero issue in size-stats script.
+
+	Fix makefile include ordering issue with certain make versions
+	in the external toolchain handling.
+
+	Updated/fixed packages: dhcp, exim, flann, gdb, heimdal,
+	libcue, libcurl, libevent, libpqxx, libsoxr, linphone, lldpd,
+	mariadb, mfgtools, mtools, nodejs, nut, openssl, rsync,
+	samba4, tor, vlc, webkitgtk, wireshark, xfsprogs,
+	xlib_libXcursor, xlib_libXfont, xlib_libXfont2
+
 2017.02.8, Released November 27th, 2017
 
 	Important / security related fixes.
diff --git a/Makefile b/Makefile
index b3cfa54..f35b0a0 100644
--- a/Makefile
+++ b/Makefile
@@ -86,9 +86,9 @@ else # umask / $(CURDIR) / $(O)
 all:
 
 # Set and export the version string
-export BR2_VERSION := 2017.02.8
+export BR2_VERSION := 2017.02.9
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1511823000
+BR2_VERSION_EPOCH = 1514805000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
