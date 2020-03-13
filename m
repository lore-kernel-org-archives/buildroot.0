From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 13 Mar 2020 21:56:16 +0100
Subject: [Buildroot] [PATCH 1/1] package/dropwatch: remove license comment
Message-ID: <20200313205616.1132768-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This comment is not needed since bump to version 1.5.2 and
https://github.com/nhorman/dropwatch/commit/83a2b4e9bfe5ad26f59c15da5f77e86fbc0a6701

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/dropwatch/dropwatch.mk | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/dropwatch/dropwatch.mk b/package/dropwatch/dropwatch.mk
index 0ee9e5e0f6..4cebe041db 100644
--- a/package/dropwatch/dropwatch.mk
+++ b/package/dropwatch/dropwatch.mk
@@ -7,8 +7,6 @@
 DROPWATCH_VERSION = 1.5.2
 DROPWATCH_SITE = $(call github,nhorman,dropwatch,v$(DROPWATCH_VERSION))
 DROPWATCH_DEPENDENCIES = libnl readline libpcap host-pkgconf $(TARGET_NLS_DEPENDENCIES)
-# Until upstream updates their tree with a proper license
-# blurb: https://github.com/nhorman/dropwatch/issues/14
 DROPWATCH_LICENSE = GPL-2.0+
 DROPWATCH_LICENSE_FILES = COPYING
 # From git
-- 
2.25.1
