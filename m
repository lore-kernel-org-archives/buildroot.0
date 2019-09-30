From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 30 Sep 2019 23:20:32 +0200
Subject: [Buildroot] [git commit] package/xterm: bump version to 349
Message-ID: <20190930211509.0591E84008@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0f1963c442020928a7230a53822bb46fee63501d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/xterm/xterm.hash | 2 +-
 package/xterm/xterm.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/xterm/xterm.hash b/package/xterm/xterm.hash
index 4b68e4a85a..57d5a72b9a 100644
--- a/package/xterm/xterm.hash
+++ b/package/xterm/xterm.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-sha256 8b1f5121dbf3690de9d85a3b9329e3357021705dd7c21da192e47542769275be xterm-348.tgz
+sha256 39a6a3d3724f9a0a068f8cc353ab0c82831f0a43abb24470d933af299658475f xterm-349.tgz
 # Locally calculated
 sha256 b0d302c6d67f63122bbe8d622dd8a66cfadccc32853f606b7558103609201993 COPYING
diff --git a/package/xterm/xterm.mk b/package/xterm/xterm.mk
index 9203536b0a..8cbfa070e2 100644
--- a/package/xterm/xterm.mk
+++ b/package/xterm/xterm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XTERM_VERSION = 348
+XTERM_VERSION = 349
 XTERM_SOURCE = xterm-$(XTERM_VERSION).tgz
 XTERM_SITE = http://invisible-mirror.net/archives/xterm
 XTERM_DEPENDENCIES = ncurses xlib_libXaw host-pkgconf
