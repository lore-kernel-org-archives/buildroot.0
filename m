From: Min Xu <xuminready@gmail.com>
Date: Thu, 14 Nov 2019 00:28:53 -0800
Subject: [Buildroot] [PATCH 1/1] package/shadowsocks-libev bump version to
 3.3.3
Message-ID: <20191114082853.5090-1-xuminready@gmail.com>
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
index b8bc437..76928eb 100644
--- a/package/shadowsocks-libev/shadowsocks-libev.hash
+++ b/package/shadowsocks-libev/shadowsocks-libev.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256 65a67c355df1794dc0ef94d80d2d596fd590b13fdcd0a21bda28859c88924ce5 shadowsocks-libev-3.2.4.tar.gz
+sha256 677356a5ed6b5ae9e32a898061db2587158ff27e245db03f4bde9b006ef12dc9 shadowsocks-libev-3.3.3.tar.gz
 
 # License files, locally calculated
 sha256 736883f97d44dbec288bb82819f18f4f86d02ae3192f6a9abefa00db76bace41  COPYING
diff --git a/package/shadowsocks-libev/shadowsocks-libev.mk b/package/shadowsocks-libev/shadowsocks-libev.mk
index fcebe34..4b0b963 100644
--- a/package/shadowsocks-libev/shadowsocks-libev.mk
+++ b/package/shadowsocks-libev/shadowsocks-libev.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SHADOWSOCKS_LIBEV_VERSION = 3.2.4
+SHADOWSOCKS_LIBEV_VERSION = 3.3.3
 SHADOWSOCKS_LIBEV_SITE = https://github.com/shadowsocks/shadowsocks-libev/releases/download/v$(SHADOWSOCKS_LIBEV_VERSION)
 SHADOWSOCKS_LIBEV_LICENSE = GPL-3.0+, BSD-2-Clause (libbloom), BSD-3-Clause (libcork, libipset)
 SHADOWSOCKS_LIBEV_LICENSE_FILES = COPYING libbloom/LICENSE libcork/COPYING
-- 
2.20.1
