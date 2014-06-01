From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  1 Jun 2014 23:43:37 +0200
Subject: [Buildroot] [PATCH 06/21] package/w_scan: bump version
In-Reply-To: <cover.1401658972.git.yann.morin.1998@free.fr>
References: <cover.1401658972.git.yann.morin.1998@free.fr>
Message-ID: <c9e8f82e52fad1509d945e245490844a7b12f1d5.1401658972.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/w_scan/w_scan.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/w_scan/w_scan.mk b/package/w_scan/w_scan.mk
index 86bd34e..44f3193 100644
--- a/package/w_scan/w_scan.mk
+++ b/package/w_scan/w_scan.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-W_SCAN_VERSION = 20130331
+W_SCAN_VERSION = 20140118
 W_SCAN_SOURCE = w_scan-$(W_SCAN_VERSION).tar.bz2
 W_SCAN_SITE = http://wirbel.htpc-forum.de/w_scan
 W_SCAN_LICENSE = GPLv2+
-- 
1.8.3.2
