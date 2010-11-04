From: llandwerlin at gmail.com <llandwerlin@gmail.com>
Date: Thu,  4 Nov 2010 03:50:31 +0100
Subject: [Buildroot] [PATCH 12/12] sawman: bump to 1.4.10
In-Reply-To: <1288839031-24277-1-git-send-email-llandwerlin@gmail.com>
References: <1288839031-24277-1-git-send-email-llandwerlin@gmail.com>
Message-ID: <1288839031-24277-13-git-send-email-llandwerlin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Lionel Landwerlin <llandwerlin@gmail.com>

Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
---
 package/sawman/sawman.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/sawman/sawman.mk b/package/sawman/sawman.mk
index c9ec06d..c01a26f 100644
--- a/package/sawman/sawman.mk
+++ b/package/sawman/sawman.mk
@@ -3,7 +3,7 @@
 # SAWMAN
 #
 #############################################################
-SAWMAN_VERSION:=1.4.3
+SAWMAN_VERSION:=1.4.10
 SAWMAN_SOURCE:=SaWMan-$(SAWMAN_VERSION).tar.gz
 SAWMAN_SITE:=http://www.directfb.org/downloads/Extras
 SAWMAN_INSTALL_STAGING = YES
-- 
1.7.2.3
