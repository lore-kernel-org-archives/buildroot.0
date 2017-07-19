From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 19 Jul 2017 21:43:49 +0300
Subject: [Buildroot] [PATCH v2 1/2] iproute2: correct license
Message-ID: <7d39adcfed0fa70634aa025114ed8f2d7d9e68b3.1500489830.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Source files license headers include the GPL "or ... any later version" language.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
v2: New patch split from the version bump
---
 package/iproute2/iproute2.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/iproute2/iproute2.mk b/package/iproute2/iproute2.mk
index 5502d7358be2..a9ca376717d6 100644
--- a/package/iproute2/iproute2.mk
+++ b/package/iproute2/iproute2.mk
@@ -9,7 +9,7 @@ IPROUTE2_SOURCE = iproute2-$(IPROUTE2_VERSION).tar.xz
 IPROUTE2_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/net/iproute2
 IPROUTE2_DEPENDENCIES = host-bison host-flex host-pkgconf \
 	$(if $(BR2_PACKAGE_LIBMNL),libmnl)
-IPROUTE2_LICENSE = GPL-2.0
+IPROUTE2_LICENSE = GPL-2.0+
 IPROUTE2_LICENSE_FILES = COPYING
 
 # If both iproute2 and busybox are selected, make certain we win
-- 
2.13.2
