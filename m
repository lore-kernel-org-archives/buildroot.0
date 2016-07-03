From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 3 Jul 2016 09:20:21 +0200
Subject: [Buildroot] [git commit] swig: add explicit dependencies for host
	variant
Message-ID: <20160703072403.7D29281E22@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b725bcb2e410d849de0e95fe09dab0897669131b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Julien Floret <julien.floret@6wind.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/swig/swig.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/swig/swig.mk b/package/swig/swig.mk
index 5329d1b..8fed8da 100644
--- a/package/swig/swig.mk
+++ b/package/swig/swig.mk
@@ -7,7 +7,7 @@
 SWIG_VERSION_MAJOR = 3.0
 SWIG_VERSION = $(SWIG_VERSION_MAJOR).10
 SWIG_SITE = http://downloads.sourceforge.net/project/swig/swig/swig-$(SWIG_VERSION)
-SWIG_DEPENDENCIES = host-bison
+HOST_SWIG_DEPENDENCIES = host-bison
 HOST_SWIG_CONF_OPTS = \
 	--without-pcre \
 	--disable-ccache \
