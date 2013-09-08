From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 8 Sep 2013 22:31:05 +0200
Subject: [Buildroot] [git commit] gsl: bump version to 1.16
Message-ID: <20130908204534.6A0669B6AA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=159c692cd22cbc8507d1cc4c11ab8700ced1b2a6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Sagaert Johan <sagaert.johan@skynet.be>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/gsl/gsl.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/gsl/gsl.mk b/package/gsl/gsl.mk
index c32a0eb..08266d4 100644
--- a/package/gsl/gsl.mk
+++ b/package/gsl/gsl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GSL_VERSION = 1.15
+GSL_VERSION = 1.16
 GSL_SOURCE = gsl-$(GSL_VERSION).tar.gz
 GSL_SITE = $(BR2_GNU_MIRROR)/gsl
 GSL_INSTALL_STAGING = YES
