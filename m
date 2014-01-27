From: Spenser Gilliland <spenser@gillilanding.com>
Date: Mon, 27 Jan 2014 15:51:46 -0600
Subject: [Buildroot] [PATCH v2] gcc: change to tagged release
In-Reply-To: <1390859507-31670-1-git-send-email-spenser@gillilanding.com>
References: <1390859507-31670-1-git-send-email-spenser@gillilanding.com>
Message-ID: <1390859507-31670-10-git-send-email-spenser@gillilanding.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
---
 package/gcc/gcc.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index dd99604..427f9b3 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -24,7 +24,7 @@ GCC_VERSION = 7466697995233cc3aab5b9427bf843e3c7fabd80
 GCC_SITE = $(call github,foss-for-synopsys-dwc-arc-processors,gcc,$(GCC_VERSION))
 GCC_SOURCE = gcc-$(GCC_VERSION).tar.gz
 else ifeq ($(findstring git,$(GCC_VERSION))$(BR2_microblaze),gity)
-GCC_VERSION = b93bb009e021aba64dd4b8cdb0bbc5a176c55543
+GCC_VERSION = xsdk_2013.4
 GCC_SITE = $(call github,Xilinx,gcc,$(GCC_VERSION))
 GCC_SOURCE = gcc-$(GCC_VERSION).tar.gz
 else
-- 
1.8.3.2
