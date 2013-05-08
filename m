From: Spenser Gilliland <spenser@gillilanding.com>
Date: Wed,  8 May 2013 18:34:09 -0500
Subject: [Buildroot] [PATCH 2/3] glibmm: Bump to version 0.36.1
In-Reply-To: <1368056050-19285-1-git-send-email-spenser@gillilanding.com>
References: <1368056050-19285-1-git-send-email-spenser@gillilanding.com>
Message-ID: <1368056050-19285-2-git-send-email-spenser@gillilanding.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This upgrades glibmm to version 0.36.1

Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
---
 package/glibmm/glibmm.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/glibmm/glibmm.mk b/package/glibmm/glibmm.mk
index abd8b6c..d8f6239 100644
--- a/package/glibmm/glibmm.mk
+++ b/package/glibmm/glibmm.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-GLIBMM_VERSION_MAJOR = 2.30
+GLIBMM_VERSION_MAJOR = 2.36
 GLIBMM_VERSION_MINOR = 1
 GLIBMM_VERSION = $(GLIBMM_VERSION_MAJOR).$(GLIBMM_VERSION_MINOR)
 GLIBMM_LICENSE = LGPLv2.1+ (library), GPLv2+ (tools)
-- 
1.7.9.5
