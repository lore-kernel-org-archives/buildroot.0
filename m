From: Francois Perrad <fperrad@gmail.com>
Date: Sun,  7 Mar 2021 12:27:50 +0100
Subject: [Buildroot] [PATCH] package/kbd: bump to version 2.4.0
Message-ID: <20210307112750.1283008-1-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/kbd/kbd.hash | 2 +-
 package/kbd/kbd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kbd/kbd.hash b/package/kbd/kbd.hash
index 66ffaeb05..324ba065d 100644
--- a/package/kbd/kbd.hash
+++ b/package/kbd/kbd.hash
@@ -1,4 +1,4 @@
 # From https://www.kernel.org/pub/linux/utils/kbd/sha256sums.asc
-sha256  685056143cb8effd0a1d44b5c391eb50d80dcfd014b1a4d6e2650a28d61cb82a  kbd-2.3.0.tar.xz
+sha256  55f0740458cfd3a84e775e50d7e8b92dc01846db1edad8e2411ccc293ece9b9f  kbd-2.4.0.tar.xz
 sha256  ddb9db7630752f8fdc6898f7c99a99eaeeac5213627ecb093df9c82f56175dc7  COPYING
 sha256  5a16340fe773f422144b436df90319114a2884933c56e9be6fad642e59be5e1f  CREDITS
diff --git a/package/kbd/kbd.mk b/package/kbd/kbd.mk
index 928b5ffed..ea2c00a37 100644
--- a/package/kbd/kbd.mk
+++ b/package/kbd/kbd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KBD_VERSION = 2.3.0
+KBD_VERSION = 2.4.0
 KBD_SOURCE = kbd-$(KBD_VERSION).tar.xz
 KBD_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/kbd
 KBD_CONF_OPTS = \
-- 
2.27.0
