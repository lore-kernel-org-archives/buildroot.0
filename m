From: Ryan Barnett <rjbarnet@rockwellcollins.com>
Date: Fri, 6 Sep 2013 11:35:44 -0500
Subject: [Buildroot] [PATCH 1/1] host-swig: bump version to 2.0.10
Message-ID: <1378485344-24083-1-git-send-email-rjbarnet@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Ryan Barnett <rjbarnet@rockwellcollins.com>
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
-- 
1.7.1
