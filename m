From: Spenser Gilliland <spenser@gillilanding.com>
Date: Mon, 27 Jan 2014 15:51:44 -0600
Subject: [Buildroot] [PATCH v2] glibc: change to tagged release
In-Reply-To: <1390859507-31670-1-git-send-email-spenser@gillilanding.com>
References: <1390859507-31670-1-git-send-email-spenser@gillilanding.com>
Message-ID: <1390859507-31670-8-git-send-email-spenser@gillilanding.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
---
 package/glibc/glibc.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index 96de02a..6e0bd4d 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -6,11 +6,11 @@
 
 ifeq ($(BR2_microblaze),y)
 ifeq ($(BR2_TOOLCHAIN_BUILDROOT_EGLIBC),y)
-GLIBC_VERSION = 7f0bcce417c47aefad06ddfec7cd4ced3a4e10ff
+GLIBC_VERSION = xsdk_14.6
 GLIBC_SITE = $(call github,Xilinx,eglibc,$(GLIBC_VERSION))
 GLIBC_SRC_SUBDIR = .
 else
-GLIBC_VERSION = b86835ca92a1942ed08d8b5ee47498e711feaddb
+GLIBC_VERSION = xsdk_2013.4
 GLIBC_SITE = $(call github,Xilinx,glibc,$(GLIBC_VERSION))
 GLIBC_SRC_SUBDIR = .
 endif
-- 
1.8.3.2
