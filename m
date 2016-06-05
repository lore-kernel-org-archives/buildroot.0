From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 5 Jun 2016 21:39:11 +0200
Subject: [Buildroot] [git commit] package/minizip: bump version
Message-ID: <20160605200530.5307381E84@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=55c4abd0abc2ba4c12858c2f18cbcd3957b8d41e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
