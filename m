From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Tue, 27 Mar 2012 10:49:54 +0200
Subject: [Buildroot] [PATCH 2/2] directfb: bump to 1.4.16
In-Reply-To: <1332838194-3638-1-git-send-email-yegorslists@googlemail.com>
References: <1332838194-3638-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <1332838194-3638-2-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/directfb/directfb.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/directfb/directfb.mk b/package/directfb/directfb.mk
index 977d272..071cdf4 100644
--- a/package/directfb/directfb.mk
+++ b/package/directfb/directfb.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 DIRECTFB_VERSION_MAJOR = 1.4
-DIRECTFB_VERSION = $(DIRECTFB_VERSION_MAJOR).15
+DIRECTFB_VERSION = $(DIRECTFB_VERSION_MAJOR).16
 DIRECTFB_SITE = http://www.directfb.org/downloads/Core/DirectFB-$(DIRECTFB_VERSION_MAJOR)
 DIRECTFB_SOURCE = DirectFB-$(DIRECTFB_VERSION).tar.gz
 DIRECTFB_AUTORECONF = YES
-- 
1.7.7
