From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 14 Mar 2020 09:14:06 +0100
Subject: [Buildroot] [git commit] package/dropwatch: remove license comment
Message-ID: <20200314080218.2DD2A82905@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3500470278c51309b75a25f5d3ec0a6000f7bdaa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This comment is not needed since bump to version 1.5.2 and
https://github.com/nhorman/dropwatch/commit/83a2b4e9bfe5ad26f59c15da5f77e86fbc0a6701

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
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
