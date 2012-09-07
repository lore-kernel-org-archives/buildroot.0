From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri,  7 Sep 2012 11:48:55 -0300
Subject: [Buildroot] [PATCH 08/10] mpfr: add license info
In-Reply-To: <1347029337-12494-1-git-send-email-gustavo@zacarias.com.ar>
References: <1347029337-12494-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1347029337-12494-8-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/mpfr/mpfr.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/mpfr/mpfr.mk b/package/mpfr/mpfr.mk
index 9caf3ac..f283be4 100644
--- a/package/mpfr/mpfr.mk
+++ b/package/mpfr/mpfr.mk
@@ -7,6 +7,8 @@
 MPFR_VERSION = 3.1.1
 MPFR_SITE = http://www.mpfr.org/mpfr-$(MPFR_VERSION)
 MPFR_SOURCE = mpfr-$(MPFR_VERSION).tar.bz2
+MPFR_LICENSE = GPLv3 LGPLv3+
+MPFR_LICENSE_FILES = COPYING COPYING.LESSER
 MPFR_INSTALL_STAGING = YES
 MPFR_DEPENDENCIES = gmp
 MPFR_MAKE_OPT = RANLIB=$(TARGET_RANLIB)
-- 
1.7.8.6
