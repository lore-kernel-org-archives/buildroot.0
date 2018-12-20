From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 20 Dec 2018 11:18:58 +0100
Subject: [Buildroot] [git commit] Update for 2018.08.4
Message-ID: <20181220101932.8A07F82AA2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b0a209ee0e64b9f0a9cad9849eecb6be375307f0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 348d79a331d30a4f547827c71f75d9d4da7aab82)
[Peter: drop Makefile changes]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/CHANGES b/CHANGES
index c4ccda92e7..39e6c7b589 100644
--- a/CHANGES
+++ b/CHANGES
@@ -184,6 +184,26 @@
 	#11451: Can't find libmpfr.so.4 when using external toolchain on ubuntu..
 	#11481: Docs: Is external.desc required?
 
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
