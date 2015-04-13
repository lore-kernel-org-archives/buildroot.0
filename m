From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date: Mon, 13 Apr 2015 12:24:06 +0200
Subject: [Buildroot] [PATCH 1/3] libsigrok: bump commit hash
In-Reply-To: <1428920648-12979-1-git-send-email-bgolaszewski@baylibre.com>
References: <1428920648-12979-1-git-send-email-bgolaszewski@baylibre.com>
Message-ID: <1428920648-12979-2-git-send-email-bgolaszewski@baylibre.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Several patches fixing issues and adding new features to baylibre-acme
driver have been merged with upstream libsigrok.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 package/libsigrok/libsigrok.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libsigrok/libsigrok.mk b/package/libsigrok/libsigrok.mk
index 2d044b2..7394f64 100644
--- a/package/libsigrok/libsigrok.mk
+++ b/package/libsigrok/libsigrok.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBSIGROK_VERSION = 380ee96fdfe0895ca0aa0b158d5c332ef08f8b3c
+LIBSIGROK_VERSION = 55462b8ba9f48931de9b9a7bfbc182a1d113b3b5
 # No https access on upstream git
 LIBSIGROK_SITE = git://sigrok.org/libsigrok
 LIBSIGROK_LICENSE = GPLv3+
-- 
2.1.4
