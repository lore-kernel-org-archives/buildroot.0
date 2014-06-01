From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  1 Jun 2014 23:43:38 +0200
Subject: [Buildroot] [PATCH 07/21] package/libbsd: do not line-up variables
In-Reply-To: <cover.1401658972.git.yann.morin.1998@free.fr>
References: <cover.1401658972.git.yann.morin.1998@free.fr>
Message-ID: <0ce2f55875ad8f8e1a00e9d50a3d4fbe9aefcb9d.1401658972.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/libbsd/libbsd.mk | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libbsd/libbsd.mk b/package/libbsd/libbsd.mk
index 761a440..c1cd59e 100644
--- a/package/libbsd/libbsd.mk
+++ b/package/libbsd/libbsd.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-LIBBSD_VERSION         = 0.4.2
-LIBBSD_SITE            = http://libbsd.freedesktop.org/releases
-LIBBSD_LICENSE         = BSD-3c MIT
-LIBBSD_LICENSE_FILES   = COPYING
+LIBBSD_VERSION = 0.4.2
+LIBBSD_SITE = http://libbsd.freedesktop.org/releases
+LIBBSD_LICENSE = BSD-3c MIT
+LIBBSD_LICENSE_FILES = COPYING
 
 LIBBSD_INSTALL_STAGING = YES
 
-- 
1.8.3.2
