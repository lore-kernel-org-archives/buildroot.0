From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Tue, 22 Apr 2014 20:41:23 +0200
Subject: [Buildroot] [PATCH 1/1] smack: fix _VERSION and _SITE variable
Message-ID: <1398192083-4977-1-git-send-email-jerzy.grzegorek@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
---
 package/smack/smack.mk |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/smack/smack.mk b/package/smack/smack.mk
index 2858686..af6e81c 100644
--- a/package/smack/smack.mk
+++ b/package/smack/smack.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-SMACK_VERSION = 1.0.4
-SMACK_SITE = $(call github,smack-team,smack,v$(SMACK_VERSION))
+SMACK_VERSION = v1.0.4
+SMACK_SITE = $(call github,smack-team,smack,$(SMACK_VERSION))
 SMACK_LICENSE = LGPLv2.1
 SMACK_LICENSE_FILES = COPYING
 SMACK_INSTALL_STAGING = YES
-- 
1.7.9.5
