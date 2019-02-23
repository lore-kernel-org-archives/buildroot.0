From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 23 Feb 2019 22:42:56 +0100
Subject: [Buildroot] [git commit] Update for 2018.02.11
Message-ID: <20190223214506.0CEAF8D700@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ea5cf87d56a43dfb696f0b3c17bf376a9c65b5dc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 56347fc8eabc7c563bb9794ac5a9429fb9d2a6d9)
[Peter: drop Makefile changes]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/CHANGES b/CHANGES
index d4ecae315a..8bae45cea8 100644
--- a/CHANGES
+++ b/CHANGES
@@ -953,6 +953,28 @@
 	#10961: Grub2 fails to build for x86_64 when BR2_SSP_ALL is
 		enabled
 
+2018.02.11, Released February 23th, 2019
+
+	Important / security related fixes.
+
+	Ensure the PLATFORM and OS environment variables are not set,
+	as they cause build issues for some packages.
+
+	The package list infrastructure now correctly handles packages
+	installing files with old mtime.
+
+	Linux: Skip hash checks for user supplied downloadable
+	patches, as no hash checksums are available for those.
+
+	scanpypi: protect against zip-slip vulnerability in zip/tar
+	handling
+
+	Updated/fixed packages: bind, dhcpcd, dovecot, ghostscript,
+	gnuradio, imagemagick, jpeg-turbo, libarchive, libb64,
+	libcurl, libid3tag, madplay, mosquitto, openssh, php,
+	postgresql, proftpd, python, python-django, python3, qt5base,
+	sqlcipher, swupdate, systemd, unzip, webkitgtk
+
 2018.02.10, Released January 31th, 2019
 
 	Important / security related fixes.
