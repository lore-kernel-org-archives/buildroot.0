From: Phil Eichinger <phil.eichinger@gmail.com>
Date: Tue,  1 Oct 2013 10:14:56 +0200
Subject: [Buildroot] [PATCH 2/2] mtdev: bump version to 1.1.4
In-Reply-To: <1380615296-26194-1-git-send-email-phil@zankapfel.net>
References: <1380615296-26194-1-git-send-email-phil@zankapfel.net>
Message-ID: <1380615296-26194-2-git-send-email-phil@zankapfel.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Phil Eichinger <phil@zankapfel.net>
---
 package/mtdev/mtdev.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/mtdev/mtdev.mk b/package/mtdev/mtdev.mk
index 5c94352..3ae2a10 100644
--- a/package/mtdev/mtdev.mk
+++ b/package/mtdev/mtdev.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MTDEV_VERSION = 1.1.3
+MTDEV_VERSION = 1.1.4
 MTDEV_SOURCE = mtdev-$(MTDEV_VERSION).tar.bz2
 MTDEV_SITE = http://bitmath.org/code/mtdev/
 
-- 
1.7.10.4
