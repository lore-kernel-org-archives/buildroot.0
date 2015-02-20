From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date: Fri, 20 Feb 2015 13:29:00 +0100
Subject: [Buildroot] [PATCH 5/7] libsigrok: bump git commit tag
In-Reply-To: <1424435342-2188-1-git-send-email-bgolaszewski@baylibre.com>
References: <1424435342-2188-1-git-send-email-bgolaszewski@baylibre.com>
Message-ID: <1424435342-2188-6-git-send-email-bgolaszewski@baylibre.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 package/libsigrok/libsigrok.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libsigrok/libsigrok.mk b/package/libsigrok/libsigrok.mk
index d19c3c8..6bc210e 100644
--- a/package/libsigrok/libsigrok.mk
+++ b/package/libsigrok/libsigrok.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBSIGROK_VERSION = 8656a71790133d4de42252a1e75b4209c03b4983
+LIBSIGROK_VERSION = 380ee96fdfe0895ca0aa0b158d5c332ef08f8b3c
 # No https access on upstream git
 LIBSIGROK_SITE = git://sigrok.org/libsigrok
 LIBSIGROK_LICENSE = GPLv3+
-- 
2.1.4
