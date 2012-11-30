From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 30 Nov 2012 14:29:50 -0800
Subject: [Buildroot] [git commit] rrdtool: add license info
Message-ID: <20121130223215.2F3E399340@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=727ed13234ac337ce15332679943a407fccee432
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/rrdtool/rrdtool.mk |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/package/rrdtool/rrdtool.mk b/package/rrdtool/rrdtool.mk
index 7521aba..d3b63ea 100644
--- a/package/rrdtool/rrdtool.mk
+++ b/package/rrdtool/rrdtool.mk
@@ -6,6 +6,9 @@
 
 RRDTOOL_VERSION = 1.2.30
 RRDTOOL_SITE = http://oss.oetiker.ch/rrdtool/pub
+RRDTOOL_LICENSE = GPLv2+ with FLOSS license exceptions as explained in COPYRIGHT
+RRDTOOL_LICENSE_FILES = COPYING COPYRIGHT
+
 RRDTOOL_DEPENDENCIES = host-pkgconf freetype libart libpng zlib
 RRDTOOL_AUTORECONF = YES
 RRDTOOL_INSTALL_STAGING = YES
