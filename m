From: Julien Floret <julien.floret@6wind.com>
Date: Sun,  3 Jul 2016 00:21:03 +0200
Subject: [Buildroot] [PATCH 34/69] swig: add explicit dependencies for host
	variant
In-Reply-To: <1467498098-23731-1-git-send-email-julien.floret@6wind.com>
References: <1467498098-23731-1-git-send-email-julien.floret@6wind.com>
Message-ID: <1467498098-23731-35-git-send-email-julien.floret@6wind.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Julien Floret <julien.floret@6wind.com>
---
 package/swig/swig.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/swig/swig.mk b/package/swig/swig.mk
index 5329d1bb7149..8fed8dabc4fc 100644
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
-- 
2.1.0
