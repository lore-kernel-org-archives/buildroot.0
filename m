From: Vanya Sergeev <vsergeev@gmail.com>
Date: Wed, 27 May 2015 16:26:13 -0700
Subject: [Buildroot] [PATCH 3/3] c-periphery: bump version to 1.0.3
In-Reply-To: <1432769173-30319-1-git-send-email-vsergeev@gmail.com>
References: <1432769173-30319-1-git-send-email-vsergeev@gmail.com>
Message-ID: <1432769173-30319-3-git-send-email-vsergeev@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vanya Sergeev <vsergeev@gmail.com>
---
 package/c-periphery/c-periphery.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/c-periphery/c-periphery.mk b/package/c-periphery/c-periphery.mk
index 68193d7..730b3bc 100644
--- a/package/c-periphery/c-periphery.mk
+++ b/package/c-periphery/c-periphery.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-C_PERIPHERY_VERSION = 0fdfac3264f1dce32991f4ec30d084e34b35181d
+C_PERIPHERY_VERSION = v1.0.3
 C_PERIPHERY_SITE = $(call github,vsergeev,c-periphery,$(C_PERIPHERY_VERSION))
 C_PERIPHERY_INSTALL_STAGING = YES
 # only a static library
-- 
2.4.1
