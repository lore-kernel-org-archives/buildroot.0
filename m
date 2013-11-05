From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue,  5 Nov 2013 19:28:06 +0100
Subject: [Buildroot] [PATCH 4/4] package/zic: bump
In-Reply-To: <cover.1383675996.git.yann.morin.1998@free.fr>
References: <cover.1383675996.git.yann.morin.1998@free.fr>
Message-ID: <8be57551e01d1a692be7ef343b3a0939645c6f17.1383675996.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

This bump to allign with the tzdata bump in previous commit.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/zic/zic.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/zic/zic.mk b/package/zic/zic.mk
index 3d56df1..780643b 100644
--- a/package/zic/zic.mk
+++ b/package/zic/zic.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ZIC_VERSION = 2013c
+ZIC_VERSION = 2013h
 ZIC_SOURCE = tzcode$(ZIC_VERSION).tar.gz
 ZIC_SITE = ftp://ftp.iana.org/tz/releases
 ZIC_LICENSE = Public domain
-- 
1.8.1.2
