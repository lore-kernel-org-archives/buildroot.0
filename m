From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Sat, 17 Nov 2018 15:12:03 +0100
Subject: [Buildroot] [PATCH 3/3] pulseview: bump version to 0.4.1
In-Reply-To: <20181117141203.19695-1-brgl@bgdev.pl>
References: <20181117141203.19695-1-brgl@bgdev.pl>
Message-ID: <20181117141203.19695-3-brgl@bgdev.pl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 package/pulseview/pulseview.hash | 2 +-
 package/pulseview/pulseview.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/pulseview/pulseview.hash b/package/pulseview/pulseview.hash
index 7883eabe59..09b9d67bc2 100644
--- a/package/pulseview/pulseview.hash
+++ b/package/pulseview/pulseview.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256	78f8291045c6f65b4827b12e83c8e68cea2d5e7268b15a51aaca9726c8100eb9	pulseview-0.4.0.tar.gz
+sha256	9ee7ce3dd1457c6a5f5e4e9c2469903a1f070ba077ea68535cc29ef1dfac6f2f	pulseview-0.4.1.tar.gz
diff --git a/package/pulseview/pulseview.mk b/package/pulseview/pulseview.mk
index e9bbf4f5c0..67d525f626 100644
--- a/package/pulseview/pulseview.mk
+++ b/package/pulseview/pulseview.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PULSEVIEW_VERSION = 0.4.0
+PULSEVIEW_VERSION = 0.4.1
 PULSEVIEW_SITE = http://sigrok.org/download/source/pulseview
 PULSEVIEW_LICENSE = GPL-3.0+
 PULSEVIEW_LICENSE_FILES = COPYING
-- 
2.19.1
