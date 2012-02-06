From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 6 Feb 2012 23:23:50 +0100
Subject: [Buildroot] [git commit] libev: bump to 4.11
Message-ID: <20120207092250.05DA3909F5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0802fc24e999ca42cbc7ac1a8596ded6d6d8c729
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libev/libev.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/libev/libev.mk b/package/libev/libev.mk
index 8beaa8e..6656d15 100644
--- a/package/libev/libev.mk
+++ b/package/libev/libev.mk
@@ -3,7 +3,7 @@
 # libev
 #
 #############################################################
-LIBEV_VERSION = 4.04
+LIBEV_VERSION = 4.11
 LIBEV_SOURCE = libev-$(LIBEV_VERSION).tar.gz
 LIBEV_SITE = http://dist.schmorp.de/libev/
 LIBEV_INSTALL_STAGING = YES
