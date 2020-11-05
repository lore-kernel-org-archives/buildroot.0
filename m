From: Min Xu <xuminready@gmail.com>
Date: Wed,  4 Nov 2020 23:17:48 -0800
Subject: [Buildroot] [PATCH 1/1] package/shadowsocks-libev: bump version to
 3.3.5
Message-ID: <20201105071748.68780-1-xuminready@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Min Xu <xuminready@gmail.com>
---
 package/shadowsocks-libev/shadowsocks-libev.hash | 2 +-
 package/shadowsocks-libev/shadowsocks-libev.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/shadowsocks-libev/shadowsocks-libev.hash b/package/shadowsocks-libev/shadowsocks-libev.hash
index cc7993a..4f1d6d2 100644
--- a/package/shadowsocks-libev/shadowsocks-libev.hash
+++ b/package/shadowsocks-libev/shadowsocks-libev.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  fce47a956fad0c30def9c71821bcec450a40d3f881548e31e66cedf262b89eb1  shadowsocks-libev-3.3.4.tar.gz
+sha256  cfc8eded35360f4b67e18dc447b0c00cddb29cc57a3cec48b135e5fb87433488  shadowsocks-libev-3.3.5.tar.gz
 
 # License files, locally calculated
 sha256  736883f97d44dbec288bb82819f18f4f86d02ae3192f6a9abefa00db76bace41  COPYING
diff --git a/package/shadowsocks-libev/shadowsocks-libev.mk b/package/shadowsocks-libev/shadowsocks-libev.mk
index 3ba4cb8..8d7b00f 100644
--- a/package/shadowsocks-libev/shadowsocks-libev.mk
+++ b/package/shadowsocks-libev/shadowsocks-libev.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SHADOWSOCKS_LIBEV_VERSION = 3.3.4
+SHADOWSOCKS_LIBEV_VERSION = 3.3.5
 SHADOWSOCKS_LIBEV_SITE = https://github.com/shadowsocks/shadowsocks-libev/releases/download/v$(SHADOWSOCKS_LIBEV_VERSION)
 SHADOWSOCKS_LIBEV_LICENSE = GPL-3.0+, BSD-2-Clause (libbloom), BSD-3-Clause (libcork, libipset)
 SHADOWSOCKS_LIBEV_LICENSE_FILES = COPYING libbloom/LICENSE libcork/COPYING
-- 
2.25.1
