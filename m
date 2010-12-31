From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 31 Dec 2010 11:30:20 +0100
Subject: [Buildroot] [git commit master 1/1] libogg: bump version
Message-ID: <20101231103105.7B8E08E1BB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=582c0a7803119691537d2e167ffca622679f0cdb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Derived from patch by Martin Banky.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/multimedia/libogg/libogg.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/multimedia/libogg/libogg.mk b/package/multimedia/libogg/libogg.mk
index 02b1976..0fd6b27 100644
--- a/package/multimedia/libogg/libogg.mk
+++ b/package/multimedia/libogg/libogg.mk
@@ -3,7 +3,7 @@
 # libogg
 #
 #############################################################
-LIBOGG_VERSION = 1.1.4
+LIBOGG_VERSION = 1.2.2
 LIBOGG_SOURCE = libogg-$(LIBOGG_VERSION).tar.gz
 LIBOGG_SITE = http://downloads.xiph.org/releases/ogg
 LIBOGG_AUTORECONF = NO
-- 
1.7.2.2
