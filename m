From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 2 May 2017 21:58:34 +0200
Subject: [Buildroot] [git commit] Update for 2017.02.2
Message-ID: <20170502202055.ED78E82842@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=87ddf24d2aa5c92c1382b227fd6d434cb9a54732
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: drop Makefile changes]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 799aed7a181e82a6446403b7abe77119622a6779)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/CHANGES b/CHANGES
index 974f4e2..332580f 100644
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
