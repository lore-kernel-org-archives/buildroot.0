From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  1 Jun 2014 23:03:36 +0200
Subject: [Buildroot] [PATCH 12/26] package/libbsd: do not line-up variables
In-Reply-To: <cover.1401656581.git.yann.morin.1998@free.fr>
References: <cover.1401656581.git.yann.morin.1998@free.fr>
Message-ID: <6f868019add43a39ca61e80464961fb74a64d291.1401656581.git.yann.morin.1998@free.fr>
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
