From: Spenser Gilliland <spenser@gillilanding.com>
Date: Thu,  6 Jun 2013 11:47:25 -0500
Subject: [Buildroot] [PATCH 10/14] socketcand: fix github tarball to use
	commit id
In-Reply-To: <1370537249-15682-1-git-send-email-spenser@gillilanding.com>
References: <bug-6302-163@https.bugs.busybox.net/>
 <1370537249-15682-1-git-send-email-spenser@gillilanding.com>
Message-ID: <1370537249-15682-10-git-send-email-spenser@gillilanding.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
---
 package/socketcand/socketcand.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/socketcand/socketcand.mk b/package/socketcand/socketcand.mk
index efade31..43dc414 100644
--- a/package/socketcand/socketcand.mk
+++ b/package/socketcand/socketcand.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 SOCKETCAND_VERSION = 7d06986
-SOCKETCAND_SITE = http://github.com/dschanoeh/socketcand/tarball/master
+SOCKETCAND_SITE = http://github.com/dschanoeh/socketcand/tarball/$(SOCKETCAND_VERSION)
 SOCKETCAND_AUTORECONF = YES
 SOCKETCAND_DEPENDENCIES = libconfig
 
-- 
1.7.9.5
