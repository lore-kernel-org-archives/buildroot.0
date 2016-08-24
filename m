From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 24 Aug 2016 19:38:55 +0200
Subject: [Buildroot] [PATCH] pckages/sconeserver: fix build with gcc-6
Message-ID: <1472060335-3229-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We simply bump the version rather than backport the patch, as there has
been only very few, minor commits in-between.

Fixes:
    http://autobuild.buildroot.org/results/fa7/fa7881c6ffb821a2aff139f95ba53c96d6e2b942/
    http://autobuild.buildroot.org/results/749/749fbd6cc505f6f3c0cccfeb63be6deddab8fba5/

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/sconeserver/sconeserver.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/sconeserver/sconeserver.mk b/package/sconeserver/sconeserver.mk
index 0b0ed1a..e02c1a6 100644
--- a/package/sconeserver/sconeserver.mk
+++ b/package/sconeserver/sconeserver.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SCONESERVER_VERSION = bbb384404575f8a3ef31c1ec41218b621b66ab27
+SCONESERVER_VERSION = d659468cd164e6a6cc12932cc6780566b04f8328
 SCONESERVER_SITE = $(call github,sconemad,sconeserver,$(SCONESERVER_VERSION))
 SCONESERVER_LICENSE = GPLv2+
 SCONESERVER_LICENSE_FILES = COPYING
-- 
2.7.4
