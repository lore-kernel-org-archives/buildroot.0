From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 17 Sep 2013 11:29:57 -0300
Subject: [Buildroot] [PATCH 1/2] quagga: security bump to version 0.99.22.3
Message-ID: <1379428198-12458-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes CVE-2013-2236.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/quagga/quagga.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/quagga/quagga.mk b/package/quagga/quagga.mk
index 8b51917..995e42d 100644
--- a/package/quagga/quagga.mk
+++ b/package/quagga/quagga.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QUAGGA_VERSION = 0.99.22.1
+QUAGGA_VERSION = 0.99.22.3
 QUAGGA_SOURCE = quagga-$(QUAGGA_VERSION).tar.xz
 QUAGGA_SITE = http://download.savannah.gnu.org/releases/quagga
 QUAGGA_DEPENDENCIES = host-gawk
-- 
1.8.1.5
