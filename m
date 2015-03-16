From: Petr Vorel <petr.vorel@gmail.com>
Date: Mon, 16 Mar 2015 08:33:45 +0100
Subject: [Buildroot] [PATCH 2/2] ofono: bump to version 1.16
In-Reply-To: <1426491225-12515-1-git-send-email-petr.vorel@gmail.com>
References: <1426491225-12515-1-git-send-email-petr.vorel@gmail.com>
Message-ID: <1426491225-12515-2-git-send-email-petr.vorel@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
 package/ofono/ofono.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/ofono/ofono.mk b/package/ofono/ofono.mk
index e964376..caf6aab 100644
--- a/package/ofono/ofono.mk
+++ b/package/ofono/ofono.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OFONO_VERSION = 1.14
+OFONO_VERSION = 1.16
 OFONO_SOURCE = ofono-$(OFONO_VERSION).tar.xz
 OFONO_SITE = $(BR2_KERNEL_MIRROR)/linux/network/ofono
 OFONO_LICENSE = GPLv2
-- 
2.1.4
