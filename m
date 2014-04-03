From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 3 Apr 2014 21:27:59 +0200
Subject: [Buildroot] [git commit] gmp: bump to version 6.0.0a
Message-ID: <20140403192806.2B8C69C517@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=053459a0f32b415a0aba25da3e3fc214898cea51
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gmp/gmp.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gmp/gmp.mk b/package/gmp/gmp.mk
index d970545..f71a210 100644
--- a/package/gmp/gmp.mk
+++ b/package/gmp/gmp.mk
@@ -4,12 +4,12 @@
 #
 ################################################################################
 
-GMP_VERSION = 5.1.3
+GMP_VERSION = 6.0.0a
 GMP_SITE = $(BR2_GNU_MIRROR)/gmp
 GMP_SOURCE = gmp-$(GMP_VERSION).tar.xz
 GMP_INSTALL_STAGING = YES
 GMP_LICENSE = LGPLv3+
-GMP_LICENSE_FILES = COPYING.LIB
+GMP_LICENSE_FILES = COPYING.LESSERv3
 GMP_DEPENDENCIES = host-m4
 
 $(eval $(autotools-package))
