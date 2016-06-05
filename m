From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  5 Jun 2016 19:52:03 +0200
Subject: [Buildroot] [PATCH 10/28] package/minizip: bump version
In-Reply-To: <1465149141-15774-1-git-send-email-bernd.kuhls@t-online.de>
References: <1465149141-15774-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1465149141-15774-10-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/minizip/minizip.hash | 2 +-
 package/minizip/minizip.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/minizip/minizip.hash b/package/minizip/minizip.hash
index a303b2c..994ed60 100644
--- a/package/minizip/minizip.hash
+++ b/package/minizip/minizip.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256	b39158bdf3d8bf81d3a7412dc761851fda398bc93d8989d5e940ed4ae5bbb52c	minizip-977afb22966e6ab0ee401293a8e85fe808133f9a.tar.gz
+sha256 ac361f40531d9fb7222d4befd10d160c647d5e85138f6bc9eda080ed8f937fb8 minizip-5f56dd81d94bd7028f7dc05d7d14112697c30241.tar.gz
diff --git a/package/minizip/minizip.mk b/package/minizip/minizip.mk
index 5b87786..3d61288 100644
--- a/package/minizip/minizip.mk
+++ b/package/minizip/minizip.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MINIZIP_VERSION = 977afb22966e6ab0ee401293a8e85fe808133f9a
+MINIZIP_VERSION = 5f56dd81d94bd7028f7dc05d7d14112697c30241
 MINIZIP_SITE = $(call github,nmoinvaz,minizip,$(MINIZIP_VERSION))
 MINIZIP_DEPENDENCIES = zlib
 MINIZIP_AUTORECONF = YES
-- 
2.8.1
