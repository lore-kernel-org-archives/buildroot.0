From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat, 28 Jun 2014 08:38:44 -0300
Subject: [Buildroot] [PATCH] mxs-bootlets: add license information
Message-ID: <1403955524-17101-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 boot/mxs-bootlets/mxs-bootlets.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/boot/mxs-bootlets/mxs-bootlets.mk b/boot/mxs-bootlets/mxs-bootlets.mk
index 6b81030..c0c4b3d 100644
--- a/boot/mxs-bootlets/mxs-bootlets.mk
+++ b/boot/mxs-bootlets/mxs-bootlets.mk
@@ -34,6 +34,7 @@ ifeq ($(BR2_TARGET_MXS_BOOTLETS_HAS_IVT),y)
 endif
 
 MXS_BOOTLETS_DEPENDENCIES = host-elftosb
+MXS_BOOTLETS_LICENSE = GPLv2+
 
 ifeq ($(BR2_TARGET_MXS_BOOTLETS_BAREBOX),y)
 MXS_BOOTLETS_DEPENDENCIES += barebox
-- 
1.8.5.5
