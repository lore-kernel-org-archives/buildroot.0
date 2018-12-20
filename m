From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 20 Dec 2018 14:21:49 +0100
Subject: [Buildroot] [git commit] Update for 2018.02.9
Message-ID: <20181220132107.3FDBC817BB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a295448960aeebdd3efeb1dbe20ed2d673793fc1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 51ff8bb263c88d44ac0f0b84ba195415609d6d5e)
[Peter: drop Makefile changes]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/CHANGES b/CHANGES
index 39e6c7b589..56f023d3d3 100644
--- a/CHANGES
+++ b/CHANGES
@@ -742,6 +742,23 @@
 	#10961: Grub2 fails to build for x86_64 when BR2_SSP_ALL is
 		enabled
 
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
