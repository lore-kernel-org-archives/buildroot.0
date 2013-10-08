From: Axel Lin <axel.lin@ingics.com>
Date: Tue, 08 Oct 2013 08:46:45 +0800
Subject: [Buildroot] [PATCH] fmtools: add license information
Message-ID: <1381193205.23915.0.camel@phoenix>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
 package/fmtools/fmtools.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/fmtools/fmtools.mk b/package/fmtools/fmtools.mk
index 407b702..5f305b9 100644
--- a/package/fmtools/fmtools.mk
+++ b/package/fmtools/fmtools.mk
@@ -6,6 +6,8 @@
 
 FMTOOLS_VERSION = 1.0.2
 FMTOOLS_SITE = http://www.stanford.edu/~blp/fmtools/
+FMTOOLS_LICENSE = GPLv2+
+FMTOOLS_LICENSE_FILES = COPYING
 
 define FMTOOLS_BUILD_CMDS
 	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
-- 
1.8.1.2
