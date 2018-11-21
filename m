From: =?UTF-8?q?DUPONCHEEL=20S=C3=A9bastien?= <sebastien.duponcheel@corp.ovh.com>
Date: Wed, 21 Nov 2018 16:12:37 +0100
Subject: [Buildroot] [PATCH v2 1/2] shadowsocks-libev: Bump to version 3.2.1
In-Reply-To: <1542813158-17776-1-git-send-email-sebastien.duponcheel@corp.ovh.com>
References: <1542813158-17776-1-git-send-email-sebastien.duponcheel@corp.ovh.com>
Message-ID: <1542813158-17776-2-git-send-email-sebastien.duponcheel@corp.ovh.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: DUPONCHEEL S?bastien <sebastien.duponcheel@corp.ovh.com>
---
 package/shadowsocks-libev/shadowsocks-libev.hash | 2 +-
 package/shadowsocks-libev/shadowsocks-libev.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/shadowsocks-libev/shadowsocks-libev.hash b/package/shadowsocks-libev/shadowsocks-libev.hash
index fffe9fd..00b1122 100644
--- a/package/shadowsocks-libev/shadowsocks-libev.hash
+++ b/package/shadowsocks-libev/shadowsocks-libev.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256 5521cf623a07fd1e393528516a83acd2b66c5d4bb4535a52662806a6a060c606 shadowsocks-libev-3.2.0.tar.gz
+sha256 988fc151474d0d2fb7a6005621949656e7a7f79400b4514624e09fd4b22969f6 shadowsocks-libev-3.2.1.tar.gz
 
 # License files, locally calculated
 sha256 736883f97d44dbec288bb82819f18f4f86d02ae3192f6a9abefa00db76bace41  COPYING
diff --git a/package/shadowsocks-libev/shadowsocks-libev.mk b/package/shadowsocks-libev/shadowsocks-libev.mk
index 7fdcd3f..7e71bbe 100644
--- a/package/shadowsocks-libev/shadowsocks-libev.mk
+++ b/package/shadowsocks-libev/shadowsocks-libev.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SHADOWSOCKS_LIBEV_VERSION = 3.2.0
+SHADOWSOCKS_LIBEV_VERSION = 3.2.1
 SHADOWSOCKS_LIBEV_SITE = https://github.com/shadowsocks/shadowsocks-libev/releases/download/v$(SHADOWSOCKS_LIBEV_VERSION)
 SHADOWSOCKS_LIBEV_LICENSE = GPL-3.0+, BSD-2-Clause (libbloom), BSD-3-Clause (libcork, libipset)
 SHADOWSOCKS_LIBEV_LICENSE_FILES = COPYING libbloom/LICENSE libcork/COPYING
-- 
2.7.4
