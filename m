From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 28 Nov 2020 16:00:36 +0100
Subject: [Buildroot] [PATCH 1/1] package/bustle: fix license
Message-ID: <20201128150036.1415801-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

bustle binaries are licensed under GPL-3.0:
https://gitlab.freedesktop.org/bustle/bustle/-/blob/bustle-0.7.5/LICENSE

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/bustle/bustle.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/bustle/bustle.mk b/package/bustle/bustle.mk
index 675ffb0529..1dbad64aef 100644
--- a/package/bustle/bustle.mk
+++ b/package/bustle/bustle.mk
@@ -6,7 +6,7 @@
 
 BUSTLE_VERSION = 0.7.5
 BUSTLE_SITE = https://www.freedesktop.org/software/bustle/$(BUSTLE_VERSION)
-BUSTLE_LICENSE = LGPL-2.1+
+BUSTLE_LICENSE = LGPL-2.1+, GPL-3.0 (binaries)
 BUSTLE_LICENSE_FILES = LICENSE
 BUSTLE_DEPENDENCIES = libglib2 libpcap host-pkgconf
 
-- 
2.29.2
