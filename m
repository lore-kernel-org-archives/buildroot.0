From: Gilles Talis <gilles.talis@gmail.com>
Date: Sat, 22 Jun 2013 23:39:43 -0700
Subject: [Buildroot] [PATCH 2/2] dash: add license information
In-Reply-To: <1371969583-29063-1-git-send-email-gilles.talis@gmail.com>
References: <1371969583-29063-1-git-send-email-gilles.talis@gmail.com>
Message-ID: <1371969583-29063-2-git-send-email-gilles.talis@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
---
 package/dash/dash.mk |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/dash/dash.mk b/package/dash/dash.mk
index 2765ed4..c6a8b11 100644
--- a/package/dash/dash.mk
+++ b/package/dash/dash.mk
@@ -8,6 +8,8 @@ DASH_VERSION = 0.5.7
 DASH_SOURCE = dash_$(DASH_VERSION).orig.tar.gz
 DASH_SITE = $(BR2_DEBIAN_MIRROR)/debian/pool/main/d/dash
 DASH_PATCH = dash_$(DASH_VERSION)-2.diff.gz
+DASH_LICENSE = BSD-3c, GPLv2+ (mksignames.c)
+DASH_LICENSE_FILES = COPYING
 
 define DASH_INSTALL_TARGET_CMDS
 	cp -a $(@D)/src/dash $(TARGET_DIR)/bin/dash
-- 
1.7.10.4
