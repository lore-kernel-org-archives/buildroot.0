From: llandwerlin at gmail.com <llandwerlin@gmail.com>
Date: Wed, 20 Jan 2010 01:05:34 +0100
Subject: [Buildroot] [PATCH 5/7] sawman: bump to 1.4.3
In-Reply-To: <20100119201528.3733.74306.stgit@localhost.localdomain>
References: <20100119201528.3733.74306.stgit@localhost.localdomain>
Message-ID: <1263945936-8613-5-git-send-email-llandwerlin@gmail.com>
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
index 01bb3da..1b53ea9 100644
--- a/package/sawman/sawman.mk
+++ b/package/sawman/sawman.mk
@@ -3,7 +3,7 @@
 # SAWMAN
 #
 #############################################################
-SAWMAN_VERSION:=1.4.2
+SAWMAN_VERSION:=1.4.3
 SAWMAN_SOURCE:=SaWMan-$(SAWMAN_VERSION).tar.gz
 SAWMAN_SITE:=http://www.directfb.org/downloads/Extras
 SAWMAN_INSTALL_STAGING = YES
-- 
1.6.5.7
