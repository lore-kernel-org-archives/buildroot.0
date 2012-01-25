From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 25 Jan 2012 15:02:29 +0100
Subject: [Buildroot] [git commit] libogg: bump version
Message-ID: <20120125140244.267229056F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=28f9df141ed47badcc1ab9d8a44513fae39f78ad
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/multimedia/libogg/libogg.mk |    4 +---
 1 files changed, 1 insertions(+), 3 deletions(-)

diff --git a/package/multimedia/libogg/libogg.mk b/package/multimedia/libogg/libogg.mk
index 86d5b01..c40f04e 100644
--- a/package/multimedia/libogg/libogg.mk
+++ b/package/multimedia/libogg/libogg.mk
@@ -3,12 +3,10 @@
 # libogg
 #
 #############################################################
-LIBOGG_VERSION = 1.2.2
+LIBOGG_VERSION = 1.3.0
 LIBOGG_SOURCE = libogg-$(LIBOGG_VERSION).tar.gz
 LIBOGG_SITE = http://downloads.xiph.org/releases/ogg
-LIBOGG_AUTORECONF = NO
 LIBOGG_INSTALL_STAGING = YES
-LIBOGG_INSTALL_TARGET = YES
 
 LIBOGG_DEPENDENCIES = host-pkg-config
 
