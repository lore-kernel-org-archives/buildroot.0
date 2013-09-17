From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 17 Sep 2013 10:30:04 -0300
Subject: [Buildroot] [PATCH] dash: bump to version 0.5.7-3
Message-ID: <1379424604-1316-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bump to patchlevel 3 since 2 is gone upstream, fixes when
sources.buildroot.net isn't available:
http://autobuild.buildroot.net/results/5ee/5ee6544a9d08025060cb5806870ae1c3f252cd93/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/dash/dash.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/dash/dash.mk b/package/dash/dash.mk
index c6a8b11..970286d 100644
--- a/package/dash/dash.mk
+++ b/package/dash/dash.mk
@@ -7,7 +7,7 @@
 DASH_VERSION = 0.5.7
 DASH_SOURCE = dash_$(DASH_VERSION).orig.tar.gz
 DASH_SITE = $(BR2_DEBIAN_MIRROR)/debian/pool/main/d/dash
-DASH_PATCH = dash_$(DASH_VERSION)-2.diff.gz
+DASH_PATCH = dash_$(DASH_VERSION)-3.diff.gz
 DASH_LICENSE = BSD-3c, GPLv2+ (mksignames.c)
 DASH_LICENSE_FILES = COPYING
 
-- 
1.8.1.5
