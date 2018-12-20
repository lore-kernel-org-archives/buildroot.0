From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 20 Dec 2018 12:25:30 +0100
Subject: [Buildroot] [git commit branch/2018.02.x] Update for 2018.02.9
Message-ID: <20181220112124.6ED0B817AE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=51ff8bb263c88d44ac0f0b84ba195415609d6d5e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES  | 17 +++++++++++++++++
 Makefile |  4 ++--
 2 files changed, 19 insertions(+), 2 deletions(-)

diff --git a/CHANGES b/CHANGES
index cf35c540ec..989fac414c 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,20 @@
+2018.02.9, Released December 20th, 2018
+
+	Important / security related fixes.
+
+	defconfigs: Fixes for ci20
+
+	Updated/fixed packages: c-ares, dante, freetype, ghostscript,
+	glibc, gnutls, go, libcurl, libgpgme, libid3tag, libiscsi,
+	libmpd, libopenssl, libpjsip, linux, liquid-dsp, luvi, lynx,
+	msgpack, nginx, nodejs, php, popt, pps-tools, python-numpy,
+	python-requests, samba4, sdl2_net, squashfs, swupdate, uclibc,
+	wine, webkitgtk, xfsprogs
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#11426: pps-tools bash dependency
+
 2018.02.8, Released November 26th, 2018
 
 	Important / security related fixes.
diff --git a/Makefile b/Makefile
index 989d86f132..c3695300b0 100644
--- a/Makefile
+++ b/Makefile
@@ -92,9 +92,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2018.02.8
+export BR2_VERSION := 2018.02.9
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1543272000
+BR2_VERSION_EPOCH = 1545305000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
