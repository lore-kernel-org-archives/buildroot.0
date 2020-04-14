From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 14 Apr 2020 18:32:43 +0200
Subject: [Buildroot] [PATCH 1/1] package/ccache: bump version to 3.7.9
Message-ID: <20200414163243.335162-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Release notes: https://ccache.dev/releasenotes.html#_ccache_3_7_9

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/ccache/ccache.hash | 2 +-
 package/ccache/ccache.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ccache/ccache.hash b/package/ccache/ccache.hash
index 3b9dac28b6..0bd00e07d0 100644
--- a/package/ccache/ccache.hash
+++ b/package/ccache/ccache.hash
@@ -1,4 +1,4 @@
 # sha256 computed locally
-sha256  99ea7b8fc34fdd5dc628169f452086c1f4d8ca3a1e52bd484fbdef3516893672  ccache-3.7.8.tar.xz
+sha256  f893da7543bfb9172bd55e603fcbdfcd83e6def176a28689c13235695b4cf44b  ccache-3.7.9.tar.xz
 sha256  ec6b1a326ff93b2cc21df88a697ae470ff6927a55b8929e7e491b315e1563361  GPL-3.0.txt
 sha256  4f63223bcdee822d55a6768cc8399ffe06401d7a03cfe79e1dc305f50dc22c59  LICENSE.adoc
diff --git a/package/ccache/ccache.mk b/package/ccache/ccache.mk
index 1e8b9b7c25..276665c3fc 100644
--- a/package/ccache/ccache.mk
+++ b/package/ccache/ccache.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CCACHE_VERSION = 3.7.8
+CCACHE_VERSION = 3.7.9
 CCACHE_SITE = https://github.com/ccache/ccache/releases/download/v$(CCACHE_VERSION)
 CCACHE_SOURCE = ccache-$(CCACHE_VERSION).tar.xz
 CCACHE_LICENSE = GPL-3.0+, others
-- 
2.25.0
