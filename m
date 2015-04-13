From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date: Mon, 13 Apr 2015 12:24:08 +0200
Subject: [Buildroot] [PATCH 3/3] pulseview: bump commit hash
In-Reply-To: <1428920648-12979-1-git-send-email-bgolaszewski@baylibre.com>
References: <1428920648-12979-1-git-send-email-bgolaszewski@baylibre.com>
Message-ID: <1428920648-12979-4-git-send-email-bgolaszewski@baylibre.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Make recently merged new option bindings available to users of pulseview.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 package/pulseview/pulseview.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pulseview/pulseview.mk b/package/pulseview/pulseview.mk
index 9e22d3f..1c0e819 100644
--- a/package/pulseview/pulseview.mk
+++ b/package/pulseview/pulseview.mk
@@ -8,7 +8,7 @@
 
 # No https access on upstream git
 PULSEVIEW_SITE = git://sigrok.org/pulseview
-PULSEVIEW_VERSION = 19be0af16af83ca10f7ce69cb64f0b0c6f6a0d81
+PULSEVIEW_VERSION = 198f9bc74d6c955a72e3e3282c2b0ba16ef39a62
 PULSEVIEW_LICENSE = GPLv3+
 PULSEVIEW_LICENSE_FILES = COPYING
 PULSEVIEW_DEPENDENCIES = libsigrok qt5base qt5svg boost
-- 
2.1.4
