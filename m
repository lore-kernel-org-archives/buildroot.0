From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 1 Jan 2015 16:56:10 +0100
Subject: [Buildroot] [git commit] lcms2: install to staging
Message-ID: <20150101155710.9C04D807F3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b6a012a1b8fd841a855a0b89ba347db45bbff8c0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Other packages might depend on lcms2, thus it should install its
development files.

Signed-off-by: Andr?? Hentschel <nerv@dawncrow.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/lcms2/lcms2.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/lcms2/lcms2.mk b/package/lcms2/lcms2.mk
index 5d22041..42b2669 100644
--- a/package/lcms2/lcms2.mk
+++ b/package/lcms2/lcms2.mk
@@ -8,6 +8,7 @@ LCMS2_VERSION = 2.5
 LCMS2_SITE = http://downloads.sourceforge.net/lcms/lcms
 LCMS2_LICENSE = MIT
 LCMS2_LICENSE_FILES = COPYING
+LCMS2_INSTALL_STAGING = YES
 
 LCMS2_CONF_OPTS = \
 
