From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 20 Dec 2018 10:44:05 +0100
Subject: [Buildroot] [git commit branch/2018.08.x] Update for 2018.08.4
Message-ID: <20181220093959.82E00816B8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=348d79a331d30a4f547827c71f75d9d4da7aab82
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.08.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES  | 20 ++++++++++++++++++++
 Makefile |  4 ++--
 2 files changed, 22 insertions(+), 2 deletions(-)

diff --git a/CHANGES b/CHANGES
index 46b2b43732..0c689f42a7 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,23 @@
+2018.08.4, Released December 20th, 2018
+
+	Important / security related fixes.
+
+	Defconfigs: Fixes for ci20, orangepi zero plus 2
+
+	Download wrapper: Fix for urlencode handling
+
+	Updated/fixed packages: c-ares, dante, docker-compose,
+	domoticz, freetype, ghostscript, gnutls, libcurl, libgpgme,
+	libid3tag, libiscsi, libmpd, libopenssl, liboping, libpjsip,
+	linux-firmware, liquid-dsp, luvi, lynx, msgpack, nginx,
+	nodejs, php, popt, pps-tools, prosody, python-numpy,
+	python-requests, samba4, sdl2_net, squashfs, swupdate,
+	systemd, uclibc, vte, webkitgtk, wine, xfsprogs
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#11426: pps-tools bash dependency
+
 2018.08.3, Released November 26th, 2018
 
 	Important / security related fixes.
diff --git a/Makefile b/Makefile
index ef0a8ab5ed..afee3cc1f6 100644
--- a/Makefile
+++ b/Makefile
@@ -92,9 +92,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2018.08.3
+export BR2_VERSION := 2018.08.4
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1543269000
+BR2_VERSION_EPOCH = 1545299000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
