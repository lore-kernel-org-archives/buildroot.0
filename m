From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Mon,  6 Feb 2012 10:55:34 +0100
Subject: [Buildroot] [PATCH 2/3] libev: bump to 4.11
In-Reply-To: <1328522135-5123-1-git-send-email-yegorslists@googlemail.com>
References: <1328522135-5123-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <1328522135-5123-2-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
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
-- 
1.7.1.1
