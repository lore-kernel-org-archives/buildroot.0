From: Spenser Gilliland <spenser@gillilanding.com>
Date: Thu,  6 Jun 2013 11:47:16 -0500
Subject: [Buildroot] [PATCH 01/14] jsmin: fix github tarball to use commit id
In-Reply-To: <bug-6302-163@https.bugs.busybox.net/>
References: <bug-6302-163@https.bugs.busybox.net/>
Message-ID: <1370537249-15682-1-git-send-email-spenser@gillilanding.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
---
 package/jsmin/jsmin.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/jsmin/jsmin.mk b/package/jsmin/jsmin.mk
index 0e82008..bb65c6c 100644
--- a/package/jsmin/jsmin.mk
+++ b/package/jsmin/jsmin.mk
@@ -1,5 +1,5 @@
 JSMIN_VERSION = a9b4755
-JSMIN_SITE = http://github.com/douglascrockford/JSMin/tarball/master
+JSMIN_SITE = http://github.com/douglascrockford/JSMin/tarball/$(JSMIN_VERSION)
 
 define JSMIN_BUILD_CMDS
 	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) jsmin
-- 
1.7.9.5
