From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 13 Dec 2015 15:55:10 +0100
Subject: [Buildroot] [PATCH 2/2] package/tvheadend: bump version, add hash
In-Reply-To: <1450018510-17443-1-git-send-email-bernd.kuhls@t-online.de>
References: <1450018510-17443-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1450018510-17443-2-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/tvheadend/tvheadend.hash | 2 ++
 package/tvheadend/tvheadend.mk   | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)
 create mode 100644 package/tvheadend/tvheadend.hash

diff --git a/package/tvheadend/tvheadend.hash b/package/tvheadend/tvheadend.hash
new file mode 100644
index 0000000..9a8432a
--- /dev/null
+++ b/package/tvheadend/tvheadend.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256	28b01f22f2d8efa201a782c1fbac68e4818e8982fd02c51497f492c9e547da67	tvheadend-66e5d277a59db723a8718afb3bdbef63824fa050.tar.gz
diff --git a/package/tvheadend/tvheadend.mk b/package/tvheadend/tvheadend.mk
index 8177057..5f28d4a 100644
--- a/package/tvheadend/tvheadend.mk
+++ b/package/tvheadend/tvheadend.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TVHEADEND_VERSION = 676a34f24b182928770cef5d4ba2903a6a25323d
+TVHEADEND_VERSION = 66e5d277a59db723a8718afb3bdbef63824fa050
 TVHEADEND_SITE = $(call github,tvheadend,tvheadend,$(TVHEADEND_VERSION))
 TVHEADEND_LICENSE = GPLv3+
 TVHEADEND_LICENSE_FILES = LICENSE.md
-- 
2.6.2
