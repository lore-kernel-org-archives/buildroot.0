From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 8 Sep 2013 21:32:13 +0200
Subject: [Buildroot] [git commit] host-swig: bump version to 2.0.10
Message-ID: <20130908204534.3C3B18191C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=bafa8fcc6ce90553843b5c24e68de57c40f94abe
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Ryan Barnett <rjbarnet@rockwellcollins.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/swig/swig.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/swig/swig.mk b/package/swig/swig.mk
index 4cc883c..94395ee 100644
--- a/package/swig/swig.mk
+++ b/package/swig/swig.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SWIG_VERSION = 2.0.9
+SWIG_VERSION = 2.0.10
 SWIG_SITE = http://downloads.sourceforge.net/project/swig/swig/swig-$(SWIG_VERSION)
 SWIG_DEPENDENCIES = host-bison
 HOST_SWIG_CONF_OPT = --without-pcre --disable-ccache
