From: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
Date: Wed, 22 Mar 2017 23:18:52 +0530
Subject: [Buildroot] [PATCH 3/6] taglib: fix legal info
In-Reply-To: <1490204935-13172-1-git-send-email-rahul.bedarkar@imgtec.com>
References: <1490204935-13172-1-git-send-email-rahul.bedarkar@imgtec.com>
Message-ID: <1490204935-13172-3-git-send-email-rahul.bedarkar@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

taglib is dual licensed under LGPLv2.1 or MPLv1.1. Almost all source
files have license text mentioning LGPLv2.1 or alternatively MPLv1.1.

Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
---
 package/taglib/taglib.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/taglib/taglib.mk b/package/taglib/taglib.mk
index f47c4ba..0f65a30 100644
--- a/package/taglib/taglib.mk
+++ b/package/taglib/taglib.mk
@@ -7,7 +7,7 @@
 TAGLIB_VERSION = 1.11.1
 TAGLIB_SITE = http://taglib.github.io/releases
 TAGLIB_INSTALL_STAGING = YES
-TAGLIB_LICENSE = LGPLv2.1, MPL
+TAGLIB_LICENSE = LGPLv2.1 or MPLv1.1
 TAGLIB_LICENSE_FILES = COPYING.LGPL COPYING.MPL
 
 ifeq ($(BR2_PACKAGE_ZLIB),y)
-- 
2.6.2
