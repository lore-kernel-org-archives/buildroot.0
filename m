From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Wed,  6 Feb 2013 17:24:12 +0100
Subject: [Buildroot] [PATCH 4/5] fbset: define license
In-Reply-To: <1360167853-7177-1-git-send-email-luca@lucaceresoli.net>
References: <1360167853-7177-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <1360167853-7177-4-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 package/fbset/fbset.mk |    1 +
 1 file changed, 1 insertion(+)

diff --git a/package/fbset/fbset.mk b/package/fbset/fbset.mk
index 3423259..85d97d5 100644
--- a/package/fbset/fbset.mk
+++ b/package/fbset/fbset.mk
@@ -7,6 +7,7 @@
 FBSET_VERSION = 2.1
 FBSET_SOURCE = fbset-$(FBSET_VERSION).tar.gz
 FBSET_SITE = http://users.telenet.be/geertu/Linux/fbdev
+FBSET_LICENSE = GPL
 
 # Make sure full fbset wins over busybox fbset
 ifeq ($(BR2_PACKAGE_BUSYBOX),y)
-- 
1.7.10.4
