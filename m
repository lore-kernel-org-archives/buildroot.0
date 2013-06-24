From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 25 Jun 2013 00:18:18 +0200
Subject: [Buildroot] [git commit] dash: add license information
Message-ID: <20130624222132.56BC09B17E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=cdc2892c6cb3eda99f00cc39632ef2a00d3e0be0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/dash/dash.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

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
