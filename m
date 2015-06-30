From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date: Tue, 30 Jun 2015 12:41:13 +0200
Subject: [Buildroot] [PATCH 1/2] libsigrok: bump commit hash
In-Reply-To: <1435660874-14116-1-git-send-email-bgolaszewski@baylibre.com>
References: <1435660874-14116-1-git-send-email-bgolaszewski@baylibre.com>
Message-ID: <1435660874-14116-2-git-send-email-bgolaszewski@baylibre.com>
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
index 21d8259..54d0482 100644
--- a/package/libsigrok/libsigrok.mk
+++ b/package/libsigrok/libsigrok.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBSIGROK_VERSION = 55462b8ba9f48931de9b9a7bfbc182a1d113b3b5
+LIBSIGROK_VERSION = fe473123ba836445d477149f2e2c0ae372fc0c4c
 # No https access on upstream git
 LIBSIGROK_SITE = git://sigrok.org/libsigrok
 LIBSIGROK_LICENSE = GPLv3+
-- 
2.1.4
