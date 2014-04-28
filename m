From: =?UTF-8?q?Jer=C3=B4nimo=20Lopes?= <lopesjeronimo@gmail.com>
Date: Mon, 28 Apr 2014 12:34:51 -0300
Subject: [Buildroot] [PATCH 2/3] ofono: bump to version 1.14
In-Reply-To: <1398699292-19411-1-git-send-email-lopesjeronimo@gmail.com>
References: <1398699292-19411-1-git-send-email-lopesjeronimo@gmail.com>
Message-ID: <1398699292-19411-2-git-send-email-lopesjeronimo@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jer?nimo Lopes <lopesjeronimo@gmail.com>
---
 package/ofono/ofono.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/ofono/ofono.mk b/package/ofono/ofono.mk
index 9e30c63..3f31447 100644
--- a/package/ofono/ofono.mk
+++ b/package/ofono/ofono.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OFONO_VERSION = 1.13
+OFONO_VERSION = 1.14
 OFONO_SOURCE = ofono-$(OFONO_VERSION).tar.xz
 OFONO_SITE = $(BR2_KERNEL_MIRROR)/linux/network/ofono
 OFONO_LICENSE = GPLv2
-- 
1.9.1
