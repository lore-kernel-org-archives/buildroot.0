From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 10 Jan 2021 18:03:59 +0100
Subject: [Buildroot] [PATCH 1/1] package/xterm: bump version to 363
Message-ID: <20210110170359.1848288-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Changelog: https://invisible-island.net/xterm/xterm.log.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
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
-- 
2.29.2
