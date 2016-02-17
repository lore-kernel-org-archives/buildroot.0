From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 17 Feb 2016 21:31:03 +0100
Subject: [Buildroot] [git commit] xterm: bump to version 322
Message-ID: <20160302202752.A595880203@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=443eceb9ba5e82bba0d898041af9361329a4ec2c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/xterm/xterm.hash | 2 +-
 package/xterm/xterm.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/xterm/xterm.hash b/package/xterm/xterm.hash
index a6e2c69..c9d06eb 100644
--- a/package/xterm/xterm.hash
+++ b/package/xterm/xterm.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	a60dbb574334c081425fa30f011cd9f571e3be7a91e2a84e252461798bce24a7	xterm-320.tgz
+sha256	9adb41b53f76a3fccaa65d47a87d336094a523985d1d6a6b8cc468375ed109d6	xterm-322.tgz
diff --git a/package/xterm/xterm.mk b/package/xterm/xterm.mk
index 7cad0cb..0429685 100644
--- a/package/xterm/xterm.mk
+++ b/package/xterm/xterm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XTERM_VERSION = 320
+XTERM_VERSION = 322
 XTERM_SOURCE = xterm-$(XTERM_VERSION).tgz
 XTERM_SITE = http://invisible-mirror.net/archives/xterm
 XTERM_DEPENDENCIES = ncurses xlib_libXaw host-pkgconf
