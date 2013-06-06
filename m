From: Spenser Gilliland <spenser@gillilanding.com>
Date: Thu,  6 Jun 2013 11:47:29 -0500
Subject: [Buildroot] [PATCH 14/14] tslib: fix github tarball to use commit id
In-Reply-To: <1370537249-15682-1-git-send-email-spenser@gillilanding.com>
References: <bug-6302-163@https.bugs.busybox.net/>
 <1370537249-15682-1-git-send-email-spenser@gillilanding.com>
Message-ID: <1370537249-15682-14-git-send-email-spenser@gillilanding.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
---
 package/tslib/tslib.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/tslib/tslib.mk b/package/tslib/tslib.mk
index 2c07272..b6321e4 100644
--- a/package/tslib/tslib.mk
+++ b/package/tslib/tslib.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 TSLIB_VERSION = 158ee49b32f83cb7b02d5315f41c2e4cff38942d
-TSLIB_SITE = http://github.com/kergoth/tslib/tarball/master
+TSLIB_SITE = http://github.com/kergoth/tslib/tarball/$(TSLIB_VERSION)
 TSLIB_LICENSE = GPL, LGPL
 TSLIB_LICENSE_FILES = COPYING
 
-- 
1.7.9.5
