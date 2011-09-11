From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 12 Sep 2011 00:08:17 +0200
Subject: [Buildroot] [git commit] libcuefile: bump to r475
Message-ID: <20110912052628.2C2A38D58C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=4ee8dea5674fea2f4ec424ece88ffc6d02416ca3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/multimedia/libcuefile/libcuefile.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/multimedia/libcuefile/libcuefile.mk b/package/multimedia/libcuefile/libcuefile.mk
index 86ec070..765c5a2 100644
--- a/package/multimedia/libcuefile/libcuefile.mk
+++ b/package/multimedia/libcuefile/libcuefile.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCUEFILE_VERSION = r453
+LIBCUEFILE_VERSION = r475
 LIBCUEFILE_SITE = http://files.musepack.net/source
 LIBCUEFILE_SOURCE = libcuefile_$(LIBCUEFILE_VERSION).tar.gz
 LIBCUEFILE_INSTALL_STAGING = YES
-- 
1.7.3.4
