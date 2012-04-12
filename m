From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Thu, 12 Apr 2012 16:39:52 +0200
Subject: [Buildroot] [PATCH] boost: bump to 1.49.0
Message-ID: <1334241592-3024-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/boost/boost.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/boost/boost.mk b/package/boost/boost.mk
index 4577f2d..e25e24d 100644
--- a/package/boost/boost.mk
+++ b/package/boost/boost.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-BOOST_VERSION = 1.47.0
+BOOST_VERSION = 1.49.0
 BOOST_FILE_VERSION = $(subst .,_,$(BOOST_VERSION))
 BOOST_SOURCE = boost_$(BOOST_FILE_VERSION).tar.bz2
 BOOST_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/boost
-- 
1.7.7
