From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 24 Feb 2019 07:57:43 +0100
Subject: [Buildroot] [git commit] Update for 2018.11.3
Message-ID: <20190224065818.E24608DF46@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=234525e782a44e99136ce8869252baee96e39fc6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 8147c71039f775c8b10e6eceab78d43bb557bde5)
[Peter: drop Makefile changes]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/CHANGES b/CHANGES
index 8bae45cea8..38a59435d8 100644
--- a/CHANGES
+++ b/CHANGES
@@ -172,6 +172,36 @@
 	#11656: Custom device tree and u-boot boot.scr not integrated..
 	#11666: Touchscreen with (Py)Qt5 should use tslib instead of evdev
 
+2018.11.3, Released February 23th, 2019
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
+	Download: fixes for SSH/SCP support
+
+	SDK: Fix handling of relative symlinks (targets starting with
+	'.' or '..')
+
+	Updated/fixed packages: bind, dhcpcd, docker-compose,
+	docker-containerd, docker-engine, dovecot, dovecot-pigeonhole,
+	dtc, efivar, ghostscript, gnuradio, imagemagick, jpeg-turbo,
+	libarchive, libb64, libcurl, libgeotiff, libgpiod, libid3tag,
+	libupnp18, log4cplus, madplay, meson, mosquitto, openssh, php,
+	poco, postgresql, proftpd, pulseaudio, python, python-django,
+	python3, qt5base, reaver, runc, sg3_utils, sqlcipher,
+	swupdate, systemd, unzip, webkitgtk, xenomai
+
 2018.11.2, Released January 30th, 2019
 
 	Important / security related fixes.
