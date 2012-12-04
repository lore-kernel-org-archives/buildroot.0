From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 4 Dec 2012 13:56:44 -0800
Subject: [Buildroot] [git commit] mpfr: add license information
Message-ID: <20121204215926.9D68C9937D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1356ea38cdee8cfa9a532ebf2c9169585a210f50
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Simon Dawson <spdawson@gmail.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/mpfr/mpfr.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

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
