From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 28 Apr 2016 22:41:47 +0200
Subject: [Buildroot] [git commit] xterm: bump to version 324
Message-ID: <20160428204527.031F881ECE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2aa0f88a0f495b4287abc4e38abac6c78ec5f923
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/xterm/xterm.hash | 2 +-
 package/xterm/xterm.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/xterm/xterm.hash b/package/xterm/xterm.hash
index c9d06eb..f68b29f 100644
--- a/package/xterm/xterm.hash
+++ b/package/xterm/xterm.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	9adb41b53f76a3fccaa65d47a87d336094a523985d1d6a6b8cc468375ed109d6	xterm-322.tgz
+sha256	70ecbec8d27789248e8ae2dc2cf159a2e189c152a6559a2b3df7f4838da36092	xterm-324.tgz
diff --git a/package/xterm/xterm.mk b/package/xterm/xterm.mk
index 0429685..38271bb 100644
--- a/package/xterm/xterm.mk
+++ b/package/xterm/xterm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XTERM_VERSION = 322
+XTERM_VERSION = 324
 XTERM_SOURCE = xterm-$(XTERM_VERSION).tgz
 XTERM_SITE = http://invisible-mirror.net/archives/xterm
 XTERM_DEPENDENCIES = ncurses xlib_libXaw host-pkgconf
