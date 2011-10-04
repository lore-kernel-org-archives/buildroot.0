From: Sven Neumann <s.neumann@raumfeld.com>
Date: Tue,  4 Oct 2011 13:45:48 +0200
Subject: [Buildroot] [PATCH 3/3] sawman: bump to version 1.4.15
In-Reply-To: <1317725477-1694-1-git-send-email-s.neumann@raumfeld.com>
References: <1317725477-1694-1-git-send-email-s.neumann@raumfeld.com>
Message-ID: <1317728748-6279-1-git-send-email-s.neumann@raumfeld.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Sven Neumann <s.neumann@raumfeld.com>
---
 package/sawman/sawman.mk |    7 +++----
 1 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/sawman/sawman.mk b/package/sawman/sawman.mk
index 71d52ae..504cc9e 100644
--- a/package/sawman/sawman.mk
+++ b/package/sawman/sawman.mk
@@ -3,11 +3,10 @@
 # SAWMAN
 #
 #############################################################
-SAWMAN_VERSION:=1.4.11
-SAWMAN_SOURCE:=SaWMan-$(SAWMAN_VERSION).tar.gz
-SAWMAN_SITE:=http://www.directfb.org/downloads/Extras
+SAWMAN_VERSION = 1.4.15
+SAWMAN_SOURCE = SaWMan-$(SAWMAN_VERSION).tar.gz
+SAWMAN_SITE = http://www.directfb.org/downloads/Extras
 SAWMAN_INSTALL_STAGING = YES
 SAWMAN_DEPENDENCIES = directfb
 
 $(eval $(call AUTOTARGETS))
-
-- 
1.7.4.1
