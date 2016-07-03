From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 3 Jul 2016 09:18:32 +0200
Subject: [Buildroot] [git commit] mpfr: add explicit dependencies for host
	variant
Message-ID: <20160703072403.3B37881E70@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=43fe7a234cfe2be1d6968506efbd15c9b3697b8f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Julien Floret <julien.floret@6wind.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mpfr/mpfr.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/mpfr/mpfr.mk b/package/mpfr/mpfr.mk
index 5c3a6ef..cc1034c 100644
--- a/package/mpfr/mpfr.mk
+++ b/package/mpfr/mpfr.mk
@@ -11,6 +11,7 @@ MPFR_LICENSE = LGPLv3+
 MPFR_LICENSE_FILES = COPYING.LESSER
 MPFR_INSTALL_STAGING = YES
 MPFR_DEPENDENCIES = gmp
+HOST_MPFR_DEPENDENCIES = host-gmp
 MPFR_MAKE_OPTS = RANLIB=$(TARGET_RANLIB)
 
 $(eval $(autotools-package))
