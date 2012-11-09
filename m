From: spdawson at gmail.com <spdawson@gmail.com>
Date: Fri,  9 Nov 2012 12:31:38 +0000
Subject: [Buildroot] [PATCH] mpfr: add license information
Message-ID: <1352464298-18005-1-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <spdawson@gmail.com>

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 package/mpfr/mpfr.mk |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/mpfr/mpfr.mk b/package/mpfr/mpfr.mk
index 9caf3ac..c6f1009 100644
--- a/package/mpfr/mpfr.mk
+++ b/package/mpfr/mpfr.mk
@@ -7,6 +7,8 @@
 MPFR_VERSION = 3.1.1
 MPFR_SITE = http://www.mpfr.org/mpfr-$(MPFR_VERSION)
 MPFR_SOURCE = mpfr-$(MPFR_VERSION).tar.bz2
+MPFR_LICENSE = LGPLv3+
+MPFR_LICENSE_FILES = COPYING.LESSER
 MPFR_INSTALL_STAGING = YES
 MPFR_DEPENDENCIES = gmp
 MPFR_MAKE_OPT = RANLIB=$(TARGET_RANLIB)
-- 
1.7.10.4
