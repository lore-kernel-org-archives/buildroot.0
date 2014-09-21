From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Sep 2014 20:05:06 +0200
Subject: [Buildroot] [git commit] swig : bump to version 2.0.12
Message-ID: <20140921180531.249A79D4C0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=eac9a58f6c718bccb9a5eb39112a21daca04be08
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas: don't introduce a SWIG_MAJOR variable, not needed for the
bump.]

Signed-off-by: J??r??my Rosen <jeremy.rosen@openwide.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/swig/swig.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/swig/swig.mk b/package/swig/swig.mk
index 79839ea..e9ef521 100644
--- a/package/swig/swig.mk
+++ b/package/swig/swig.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SWIG_VERSION = 2.0.10
+SWIG_VERSION = 2.0.12
 SWIG_SITE = http://downloads.sourceforge.net/project/swig/swig/swig-$(SWIG_VERSION)
 SWIG_DEPENDENCIES = host-bison
 HOST_SWIG_CONF_OPT = \
