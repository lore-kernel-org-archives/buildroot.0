From: Spenser Gilliland <spenser@gillilanding.com>
Date: Mon, 27 Jan 2014 15:51:45 -0600
Subject: [Buildroot] [PATCH v2] binutils: change to tagged release
In-Reply-To: <1390859507-31670-1-git-send-email-spenser@gillilanding.com>
References: <1390859507-31670-1-git-send-email-spenser@gillilanding.com>
Message-ID: <1390859507-31670-9-git-send-email-spenser@gillilanding.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
---
 package/binutils/binutils.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
index fada72a..19eddd2 100644
--- a/package/binutils/binutils.mk
+++ b/package/binutils/binutils.mk
@@ -30,7 +30,7 @@ BINUTILS_SOURCE = binutils-$(BINUTILS_VERSION).tar.gz
 BINUTILS_FROM_GIT = y
 endif
 ifeq ($(findstring git,$(BINUTILS_VERSION))$(BR2_microblaze),gity)
-BINUTILS_VERSION = 8351467c933d277ebea0c8d99ad2b65b5f7b6bc2
+BINUTILS_VERSION = xsdk_2013.4
 BINUTILS_SITE = $(call github,Xilinx,binutils,$(BINUTILS_VERSION))
 BINUTILS_SOURCE = binutils-$(BINUTILS_VERSION).tar.gz
 BINUTILS_FROM_GIT = y
-- 
1.8.3.2
