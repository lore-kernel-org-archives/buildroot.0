From: Spenser Gilliland <spenser@gillilanding.com>
Date: Thu,  6 Jun 2013 11:47:18 -0500
Subject: [Buildroot] [PATCH 03/14] linenoise: fix github tarball to use
	commit id
In-Reply-To: <1370537249-15682-1-git-send-email-spenser@gillilanding.com>
References: <bug-6302-163@https.bugs.busybox.net/>
 <1370537249-15682-1-git-send-email-spenser@gillilanding.com>
Message-ID: <1370537249-15682-3-git-send-email-spenser@gillilanding.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
---
 package/linenoise/linenoise.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/linenoise/linenoise.mk b/package/linenoise/linenoise.mk
index fb73960..6cb58a1 100644
--- a/package/linenoise/linenoise.mk
+++ b/package/linenoise/linenoise.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 LINENOISE_VERSION = g27a3b4d
-LINENOISE_SITE = http://github.com/antirez/linenoise/tarball/master
+LINENOISE_SITE = http://github.com/antirez/linenoise/tarball/$(LINENOISE_VERSION)
 LINENOISE_LICENSE = BSD-2c
 LINENOISE_INSTALL_STAGING = YES
 
-- 
1.7.9.5
