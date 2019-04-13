From: Francois Perrad <fperrad@gmail.com>
Date: Sat, 13 Apr 2019 15:33:42 +0200
Subject: [Buildroot] [PATCH 3/3] lrandom: bump to version 20180729
In-Reply-To: <20190413133342.25091-1-francois.perrad@gadz.org>
References: <20190413133342.25091-1-francois.perrad@gadz.org>
Message-ID: <20190413133342.25091-3-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/lrandom/lrandom.hash |  3 +--
 package/lrandom/lrandom.mk   | 10 +++-------
 2 files changed, 4 insertions(+), 9 deletions(-)

diff --git a/package/lrandom/lrandom.hash b/package/lrandom/lrandom.hash
index ce59268bb..111635e50 100644
--- a/package/lrandom/lrandom.hash
+++ b/package/lrandom/lrandom.hash
@@ -1,3 +1,2 @@
 # computed by luarocks/buildroot
-sha256 96fbc56beb0efca20253301915e14ba25150e2b09541ea7a3570e0def624b196  lrandom-20120430.51-1.src.rock
-sha256 480a6cf11caaba99290ff30cd6e854ac9dce61e38b9d9caf5498165f7fb93454  lrandom-20120430.52-1.src.rock
+sha256 9b77af41202feb38b09cb4a99cd49680ea9dbc9df3e640f801be378dd286eab8  lrandom-20180729-1.src.rock
diff --git a/package/lrandom/lrandom.mk b/package/lrandom/lrandom.mk
index 2fe5fdb5a..c78e15ff2 100644
--- a/package/lrandom/lrandom.mk
+++ b/package/lrandom/lrandom.mk
@@ -4,12 +4,8 @@
 #
 ################################################################################
 
-ifeq ($(BR2_PACKAGE_LUA_5_3),y)
-LRANDOM_VERSION = 20120430.52-1
-else
-LRANDOM_VERSION = 20120430.51-1
-endif
-LRANDOM_SUBDIR = random
-LRANDOM_LICENSE = Public domain
+LRANDOM_VERSION = 20180729-1
+LRANDOM_SUBDIR = lrandom-100
+LRANDOM_LICENSE = MIT
 
 $(eval $(luarocks-package))
-- 
2.17.1
