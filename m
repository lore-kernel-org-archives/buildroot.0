From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 14 Feb 2021 17:53:23 +0100
Subject: [Buildroot] [git commit branch/2020.02.x] package/xterm: bump
 version to 363
Message-ID: <20210214163455.AE0CE815B4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6bb3ef423425e77f39c7b3305d9ddc5ad73b467c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Changelog: https://invisible-island.net/xterm/xterm.log.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 145e377a0af8881e93ec01929352e73b6a4459ae)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/xterm/xterm.hash | 2 +-
 package/xterm/xterm.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/xterm/xterm.hash b/package/xterm/xterm.hash
index 7f2ff2c301..8e2d2c5309 100644
--- a/package/xterm/xterm.hash
+++ b/package/xterm/xterm.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-sha256  7cdb106962910a99700b3c45fa1a1493e46e97a5aa3785093a786e07196fbf7b  xterm-358.tgz
+sha256  d81a3639e26552b6765bdcf28be1ecdb8acabf907955708e830ad6397ea10b48  xterm-363.tgz
 # Locally calculated
 sha256  c655a5fa3dec936543e02f863b8c1343d08522a2821cb484df6c5f62afa7354d  COPYING
diff --git a/package/xterm/xterm.mk b/package/xterm/xterm.mk
index 5e3e64fff4..0984ef4dc8 100644
--- a/package/xterm/xterm.mk
+++ b/package/xterm/xterm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XTERM_VERSION = 358
+XTERM_VERSION = 363
 XTERM_SOURCE = xterm-$(XTERM_VERSION).tgz
 XTERM_SITE = http://invisible-mirror.net/archives/xterm
 XTERM_DEPENDENCIES = ncurses xlib_libXaw host-pkgconf
