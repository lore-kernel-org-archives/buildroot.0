From: =?UTF-8?q?J=C3=B6rg=20Krause?= <jkrause@posteo.de>
Date: Wed, 15 Oct 2014 23:23:49 +0200
Subject: [Buildroot] [PATCH 2/4] package/libogg: bump to version 1.3.2
In-Reply-To: <1413408231-31696-1-git-send-email-jkrause@posteo.de>
References: <1413408231-31696-1-git-send-email-jkrause@posteo.de>
Message-ID: <1413408231-31696-2-git-send-email-jkrause@posteo.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: J?rg Krause <jkrause@posteo.de>
---
 package/libogg/libogg.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libogg/libogg.mk b/package/libogg/libogg.mk
index 984e7b7..8fff529 100644
--- a/package/libogg/libogg.mk
+++ b/package/libogg/libogg.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBOGG_VERSION = 1.3.1
+LIBOGG_VERSION = 1.3.2
 LIBOGG_SOURCE = libogg-$(LIBOGG_VERSION).tar.xz
 LIBOGG_SITE = http://downloads.xiph.org/releases/ogg
 LIBOGG_LICENSE = BSD-3c
-- 
2.1.2
