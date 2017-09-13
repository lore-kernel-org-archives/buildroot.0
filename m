From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 13 Sep 2017 11:33:54 +0200
Subject: [Buildroot] [PATCH 1/1] package/ncmpc: bump version to 0.27
Message-ID: <20170913093354.9351-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/ncmpc/ncmpc.hash | 2 +-
 package/ncmpc/ncmpc.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ncmpc/ncmpc.hash b/package/ncmpc/ncmpc.hash
index e7646b2e3a..82fae1d78c 100644
--- a/package/ncmpc/ncmpc.hash
+++ b/package/ncmpc/ncmpc.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256 6e328acb71d06ae9e6c5fced99bc28ae78bcab1a73130b42ce9ab08a814ecea4 ncmpc-0.25.tar.xz
+sha256 f9a26a3fc869cfdf0a16b0ea3e6512c2fe28a031bbc71b1d24a2bf0bbd3e15d9  ncmpc-0.27.tar.xz
diff --git a/package/ncmpc/ncmpc.mk b/package/ncmpc/ncmpc.mk
index 6f421dfcdb..31b4f08d14 100644
--- a/package/ncmpc/ncmpc.mk
+++ b/package/ncmpc/ncmpc.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 NCMPC_VERSION_MAJOR = 0
-NCMPC_VERSION = $(NCMPC_VERSION_MAJOR).25
+NCMPC_VERSION = $(NCMPC_VERSION_MAJOR).27
 NCMPC_SOURCE = ncmpc-$(NCMPC_VERSION).tar.xz
 NCMPC_SITE = http://www.musicpd.org/download/ncmpc/$(NCMPC_VERSION_MAJOR)
 NCMPC_DEPENDENCIES = host-pkgconf libglib2 libmpdclient ncurses
-- 
2.11.0
