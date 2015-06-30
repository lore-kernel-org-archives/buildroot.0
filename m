From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date: Tue, 30 Jun 2015 12:41:14 +0200
Subject: [Buildroot] [PATCH 2/2] pulseview: bump commit hash
In-Reply-To: <1435660874-14116-1-git-send-email-bgolaszewski@baylibre.com>
References: <1435660874-14116-1-git-send-email-bgolaszewski@baylibre.com>
Message-ID: <1435660874-14116-3-git-send-email-bgolaszewski@baylibre.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Include commit ec6cc07f which fixes an issue causing build failures
on several architectures.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 package/pulseview/pulseview.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pulseview/pulseview.mk b/package/pulseview/pulseview.mk
index 1c0e819..67f293f 100644
--- a/package/pulseview/pulseview.mk
+++ b/package/pulseview/pulseview.mk
@@ -8,7 +8,7 @@
 
 # No https access on upstream git
 PULSEVIEW_SITE = git://sigrok.org/pulseview
-PULSEVIEW_VERSION = 198f9bc74d6c955a72e3e3282c2b0ba16ef39a62
+PULSEVIEW_VERSION = ec6cc07fed12f5070eee6b8cb11343e83d42533c
 PULSEVIEW_LICENSE = GPLv3+
 PULSEVIEW_LICENSE_FILES = COPYING
 PULSEVIEW_DEPENDENCIES = libsigrok qt5base qt5svg boost
-- 
2.1.4
