From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Wed,  4 Mar 2015 23:07:41 +0100
Subject: [Buildroot] [PATCH 1/1] quagga: remove redundant assignment
Message-ID: <1425506861-11420-1-git-send-email-jerzy.grzegorek@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
---
 package/quagga/quagga.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/quagga/quagga.mk b/package/quagga/quagga.mk
index 16fcb64..4a12ab3 100644
--- a/package/quagga/quagga.mk
+++ b/package/quagga/quagga.mk
@@ -7,7 +7,6 @@
 QUAGGA_VERSION = 0.99.24
 QUAGGA_SOURCE = quagga-$(QUAGGA_VERSION).tar.xz
 QUAGGA_SITE = http://download.savannah.gnu.org/releases/quagga
-QUAGGA_SOURCE = quagga-$(QUAGGA_VERSION).tar.xz
 QUAGGA_DEPENDENCIES = host-gawk
 QUAGGA_LICENSE = GPLv2+
 QUAGGA_LICENSE_FILES = COPYING
-- 
1.9.1
