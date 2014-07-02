From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed,  2 Jul 2014 09:40:07 -0300
Subject: [Buildroot] [PATCH 09/13] makedevs: add license information
In-Reply-To: <1404304811-27480-1-git-send-email-gustavo@zacarias.com.ar>
References: <1404304811-27480-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1404304811-27480-9-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/makedevs/makedevs.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/makedevs/makedevs.mk b/package/makedevs/makedevs.mk
index 7210dc6..6ca688c 100644
--- a/package/makedevs/makedevs.mk
+++ b/package/makedevs/makedevs.mk
@@ -9,6 +9,7 @@ MAKEDEVS_SOURCE =
 HOST_MAKEDEVS_SOURCE =
 
 MAKEDEVS_VERSION = buildroot-$(BR2_VERSION)
+MAKEDEVS_LICENSE = LGPLv2
 
 define MAKEDEVS_BUILD_CMDS
 	$(TARGET_CC) $(TARGET_CFLAGS) $(TARGET_LDFLAGS) \
-- 
1.8.5.5
