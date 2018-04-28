From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 28 Apr 2018 12:11:47 +0200
Subject: [Buildroot] [PATCH 1/1] package/samba4: bump version to 4.8.1
Message-ID: <20180428101147.4680-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Release notes: https://www.samba.org/samba/history/samba-4.8.1.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/samba4/samba4.hash | 4 ++--
 package/samba4/samba4.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/samba4/samba4.hash b/package/samba4/samba4.hash
index 36e2ff79be..85d0e18b52 100644
--- a/package/samba4/samba4.hash
+++ b/package/samba4/samba4.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://download.samba.org/pub/samba/stable/samba-4.8.0.tar.asc
-sha256 87d9b585dbd8628e79aabb6e621a94bd20a072a00762e78e0899fad22fc18fb7  samba-4.8.0.tar.gz
+# https://download.samba.org/pub/samba/stable/samba-4.8.1.tar.asc
+sha256 8ef7367507f16b7a5e2f6aed5bcdbd1143feca79aa2a07c9b21292b17d7f789d  samba-4.8.1.tar.gz
 sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index a5ebe59ef3..c77bc04a89 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SAMBA4_VERSION = 4.8.0
+SAMBA4_VERSION = 4.8.1
 SAMBA4_SITE = https://download.samba.org/pub/samba/stable
 SAMBA4_SOURCE = samba-$(SAMBA4_VERSION).tar.gz
 SAMBA4_INSTALL_STAGING = YES
-- 
2.14.2
