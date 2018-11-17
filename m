From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 17 Nov 2018 22:00:04 +0100
Subject: [Buildroot] [git commit] pulseview: bump version to 0.4.1
Message-ID: <20181202071556.0E31E8843B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e85f4607f5be243f527b78d6d619555e75768342
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
