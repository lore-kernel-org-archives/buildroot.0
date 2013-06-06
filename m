From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 6 Jun 2013 23:07:39 +0200
Subject: [Buildroot] [git commit] mtdev2tuio: fix github tarball to use
	commit id
Message-ID: <20130606211255.ED2459A9A3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e9c9bd2d62a1d09f2f54b55f05301be0e06981df
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/mtdev2tuio/mtdev2tuio.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/mtdev2tuio/mtdev2tuio.mk b/package/mtdev2tuio/mtdev2tuio.mk
index 3f34702..c78e373 100644
--- a/package/mtdev2tuio/mtdev2tuio.mk
+++ b/package/mtdev2tuio/mtdev2tuio.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 MTDEV2TUIO_VERSION = e1e7378
-MTDEV2TUIO_SITE = http://github.com/olivopaolo/mtdev2tuio/tarball/master
+MTDEV2TUIO_SITE = http://github.com/olivopaolo/mtdev2tuio/tarball/$(MTDEV2TUIO_VERSION)
 MTDEV2TUIO_DEPENDENCIES = mtdev liblo
 MTDEV2TUIO_LICENSE = GPLv3+
 MTDEV2TUIO_LICENSE_FILES = COPYING
