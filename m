From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 2 May 2017 00:05:42 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] Update for 2017.02.2
Message-ID: <20170501220555.E4C4A8004B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=799aed7a181e82a6446403b7abe77119622a6779
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES  | 19 +++++++++++++++++++
 Makefile |  4 ++--
 2 files changed, 21 insertions(+), 2 deletions(-)

diff --git a/CHANGES b/CHANGES
index 75163c3..f26077a 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,22 @@
+2017.02.2, Released May 1st, 2017
+
+	Important / security related fixes.
+
+	Use HTTPS for the Codesourcery external toolchains as the HTTP
+	URLs no longer work.
+
+	Updated/fixed packages: bind, busybox, dovecot, freetype,
+	ghostscript, glibc, granite, hiredis, icu, imagemagick,
+	gst-plugins-base, gst1-plugins-base, libcroco, libcurl, libnl,
+	libnspr, libnss, libsamplerate, libsndfile, libunwind,
+	minicom, mplayer, mpv, nodejs, python-django, python-pyyaml,
+	python-web2py, samba4, syslinux, systemd, tiff, trinity,
+	uboot, wireshark, xen
+
+	Issues resolved (http://bugs.buildroot.org):
+
+	#9791: Python searches for packages in the user site directory
+
 2017.02.1, Released April 4th, 2017
 
 	Important / security related fixes.
diff --git a/Makefile b/Makefile
index 30e76fa..92ecdf1 100644
--- a/Makefile
+++ b/Makefile
@@ -86,9 +86,9 @@ else # umask / $(CURDIR) / $(O)
 all:
 
 # Set and export the version string
-export BR2_VERSION := 2017.02.1
+export BR2_VERSION := 2017.02.2
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1491392000
+BR2_VERSION_EPOCH = 1493676000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
