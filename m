From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 17 Jan 2012 23:32:34 +0100
Subject: [Buildroot] [git commit] mpfr: removed redundant
	HOST_FOO_DEPENDENCIES
Message-ID: <20120117224424.925A890371@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=014f85f91bbf442af8a5a087a91ca0d5499c8b3e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/mpfr/mpfr.mk |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/package/mpfr/mpfr.mk b/package/mpfr/mpfr.mk
index 7f33599..6876d6f 100644
--- a/package/mpfr/mpfr.mk
+++ b/package/mpfr/mpfr.mk
@@ -10,7 +10,6 @@ MPFR_SOURCE = mpfr-$(MPFR_VERSION).tar.bz2
 MPFR_INSTALL_STAGING = YES
 MPFR_DEPENDENCIES = gmp
 MPFR_MAKE_OPT = RANLIB=$(TARGET_RANLIB)
-HOST_MPFR_DEPENDENCIES = host-gmp
 
 $(eval $(call AUTOTARGETS))
 $(eval $(call AUTOTARGETS,host))
