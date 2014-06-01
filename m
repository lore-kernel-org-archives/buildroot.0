From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  1 Jun 2014 23:03:37 +0200
Subject: [Buildroot] [PATCH 13/26] package/libbsd: bump version
In-Reply-To: <cover.1401656581.git.yann.morin.1998@free.fr>
References: <cover.1401656581.git.yann.morin.1998@free.fr>
Message-ID: <cc254fbb97d751691c3b821bdb1df895d0cb3eb7.1401656581.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

... and switch to using .tar.xz as that's all upstream is providing now.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/libbsd/libbsd.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/libbsd/libbsd.mk b/package/libbsd/libbsd.mk
index c1cd59e..d6481b2 100644
--- a/package/libbsd/libbsd.mk
+++ b/package/libbsd/libbsd.mk
@@ -4,7 +4,8 @@
 #
 ################################################################################
 
-LIBBSD_VERSION = 0.4.2
+LIBBSD_VERSION = 0.6.0
+LIBBSD_SOURCE = libbsd-$(LIBBSD_VERSION).tar.xz
 LIBBSD_SITE = http://libbsd.freedesktop.org/releases
 LIBBSD_LICENSE = BSD-3c MIT
 LIBBSD_LICENSE_FILES = COPYING
-- 
1.8.3.2
