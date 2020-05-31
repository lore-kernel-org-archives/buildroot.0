From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 31 May 2020 16:24:40 +0200
Subject: [Buildroot] [PATCH/next 1/1] package/libtorrent-rasterbar: bump to
 version 1.2.7
Message-ID: <20200531142440.194565-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://github.com/arvidn/libtorrent/releases/tag/libtorrent_1_2_7

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libtorrent-rasterbar/libtorrent-rasterbar.hash | 2 +-
 package/libtorrent-rasterbar/libtorrent-rasterbar.mk   | 5 +++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/libtorrent-rasterbar/libtorrent-rasterbar.hash b/package/libtorrent-rasterbar/libtorrent-rasterbar.hash
index b8fd5e2c80..2246d89947 100644
--- a/package/libtorrent-rasterbar/libtorrent-rasterbar.hash
+++ b/package/libtorrent-rasterbar/libtorrent-rasterbar.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  8f69befe449f7211afc665726d24fde62f019800b060b5c6c9804793929a4407  libtorrent-rasterbar-1.2.6.tar.gz
+sha256  bc00069e65c0825cbe1eee5cdd26f94fcd9a621c4e7f791810b12fab64192f00  libtorrent-rasterbar-1.2.7.tar.gz
 sha256  f3a5dd1558cce616b12edad521427ec8976ce2bb0af33f7f359cfa648bf55ad8  COPYING
diff --git a/package/libtorrent-rasterbar/libtorrent-rasterbar.mk b/package/libtorrent-rasterbar/libtorrent-rasterbar.mk
index 2e0fc23edd..973fa47aaa 100644
--- a/package/libtorrent-rasterbar/libtorrent-rasterbar.mk
+++ b/package/libtorrent-rasterbar/libtorrent-rasterbar.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-LIBTORRENT_RASTERBAR_VERSION = 1.2.6
-LIBTORRENT_RASTERBAR_SITE = https://github.com/arvidn/libtorrent/releases/download/libtorrent-$(subst .,_,$(LIBTORRENT_RASTERBAR_VERSION))
+LIBTORRENT_RASTERBAR_VERSION = 1.2.7
+LIBTORRENT_RASTERBAR_SITE = \
+	https://github.com/arvidn/libtorrent/releases/download/libtorrent_$(subst .,_,$(LIBTORRENT_RASTERBAR_VERSION))
 LIBTORRENT_RASTERBAR_LICENSE = BSD-3-Clause
 LIBTORRENT_RASTERBAR_LICENSE_FILES = COPYING
 LIBTORRENT_RASTERBAR_DEPENDENCIES = host-pkgconf boost openssl
-- 
2.26.2
