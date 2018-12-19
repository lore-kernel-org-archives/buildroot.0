From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 19 Dec 2018 23:04:07 +0100
Subject: [Buildroot] [git commit branch/2018.11.x] Update for 2018.11.1
Message-ID: <20181219220024.C44CC81EE3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=29675f8e54d36660a7c0a0c3b54b9cc612395e9a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.11.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES  | 23 +++++++++++++++++++++++
 Makefile |  4 ++--
 2 files changed, 25 insertions(+), 2 deletions(-)

diff --git a/CHANGES b/CHANGES
index edefd4bab8..c4ccda92e7 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,26 @@
+2018.11.1, Released December 20th, 2018
+
+	Important / security related fixes.
+
+	defconfigs: Fixes for bananapi m2 ultra, ci20
+
+	Download wrapper: Fix for urlencode handling
+
+	Updated/fixed packages: asterisk, docker-compose,
+	docker-engine, dt-utils, gnutls, go, grub, libbsd, libcurl,
+	libpgpme, libiscsi, liblo, libmpd, libopenssl, liboping,
+	libpam-tacplus, libpjsip, linux-firmware, liquid-dsp,
+	lua-cqueue, luvi, lxc, lynx, nginx, nodejs, openzwave, php,
+	pps-tools, proftpd, prosody, sdl2_net, squashfs, swupdate,
+	uclibc, vtu, webkitgtk, wine, xen
+
+	New packages: docker-cli
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#11426: pps-tools bash dependency
+	#11536: dt-utils building fails with glibc 2.28
+
 2018.11, Released December 1st, 2018
 
 	Minor fixes.
diff --git a/Makefile b/Makefile
index c4c34b0ff2..dd8cc7a9ae 100644
--- a/Makefile
+++ b/Makefile
@@ -92,9 +92,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2018.11
+export BR2_VERSION := 2018.11.1
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1543701000
+BR2_VERSION_EPOCH = 1545257000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
