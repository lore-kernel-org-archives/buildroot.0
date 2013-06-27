From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 27 Jun 2013 11:29:06 +0200
Subject: [Buildroot] [git commit] pv: add license info
Message-ID: <20130627093155.D84849A10F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3ba9f8231d3dd71303b0218679d6c384be76fc6e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/pv/pv.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/pv/pv.mk b/package/pv/pv.mk
index 261f213..c2dca2a 100644
--- a/package/pv/pv.mk
+++ b/package/pv/pv.mk
@@ -7,6 +7,8 @@
 PV_VERSION = 1.4.6
 PV_SOURCE = pv-$(PV_VERSION).tar.bz2
 PV_SITE = http://www.ivarch.com/programs/sources
+PV_LICENSE = Artistic-2.0
+PV_LICENSE_FILES = doc/COPYING
 PV_MAKE_OPT = LD=$(TARGET_LD) # otherwise 'ld' is used
 
 $(eval $(autotools-package))
