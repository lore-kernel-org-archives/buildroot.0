From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 25 Aug 2014 19:49:20 +0200
Subject: [Buildroot] [git commit] libsoc: bump to 0.6.3
Message-ID: <20140901132446.48F8D9D5C2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=90d1ae8bed087d2df1a47210d636ad1a86275562
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libsoc/libsoc.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/libsoc/libsoc.mk b/package/libsoc/libsoc.mk
index 85a22da..612be99 100644
--- a/package/libsoc/libsoc.mk
+++ b/package/libsoc/libsoc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBSOC_VERSION = 0.6.2
+LIBSOC_VERSION = 0.6.3
 LIBSOC_SITE = $(call github,jackmitch,libsoc,$(LIBSOC_VERSION))
 LIBSOC_LICENSE = LGPLv2.1
 LIBSOC_LICENSE_FILES = COPYING
