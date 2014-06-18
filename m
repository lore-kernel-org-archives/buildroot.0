From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 18 Jun 2014 14:22:15 +0200
Subject: [Buildroot] [git commit] libsoc: bump to 0.6.2
Message-ID: <20140618123420.75E1E9D044@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ad4d18bb18506caf2d9cbbdb24be7e656cd82d3b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libsoc/libsoc.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/libsoc/libsoc.mk b/package/libsoc/libsoc.mk
index d1a55e7..85a22da 100644
--- a/package/libsoc/libsoc.mk
+++ b/package/libsoc/libsoc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBSOC_VERSION = 0.6.1
+LIBSOC_VERSION = 0.6.2
 LIBSOC_SITE = $(call github,jackmitch,libsoc,$(LIBSOC_VERSION))
 LIBSOC_LICENSE = LGPLv2.1
 LIBSOC_LICENSE_FILES = COPYING
