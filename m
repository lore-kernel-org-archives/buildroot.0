From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 11 Apr 2020 08:31:47 +0200
Subject: [Buildroot] [git commit] Update for 2019.02.11
Message-ID: <20200411063447.4B0AD8E2F6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=eea7f7a60c34efd10a23e30794db0a390e0c09bd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 5a6d31c87e1573bc83986471c194b944d7a365b7)
[Peter: drop Makefile changes]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/CHANGES b/CHANGES
index 57a53083ed..5285806551 100644
--- a/CHANGES
+++ b/CHANGES
@@ -901,6 +901,27 @@
 	#11761: Building custom kernel 5.1-rc3 or later breaks on objtool
 	#11816: Only selected coreutils binaries are installed
 
+2019.02.11, released April 9th, 2020
+
+	Important / security related fixes.
+
+	core: Fix compatibility with make 4.3+. Also fixup /lib
+	references in libtool .la files, similar to how it is done for
+	/usr/*.
+
+	toolchain: Fix kernel headers validation check for external
+	toolchains.
+
+	Updated/fixed packages: barebox-aux, bluez5_utils, busybox,
+	civetweb, collectd, ffmpeg, gcc, gnutls, gvfs, haproxy,
+	hiredis, kmscube, libical, libopenssl, libsndfile,
+	linux-tools, ntp, php, pure-ftpd, screen, sysdig, tor,
+	util-linux, vala, vlc, xserver_xorg-server
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#12746: "sysdig" package description points to http://sysdig.org, ..
+
 2019.02.10, released March 16th, 2020
 
 	Important / security related fixes.
