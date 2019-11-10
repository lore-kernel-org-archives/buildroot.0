From: Pierre-Jean Texier <pjtexier@koncepto.io>
Date: Sun, 10 Nov 2019 20:09:15 +0100
Subject: [Buildroot] [PATCH] package/irqbalance: bump to version 1.6.0
Message-ID: <1573412955-16162-1-git-send-email-pjtexier@koncepto.io>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

See full changelog https://github.com/Irqbalance/irqbalance/releases/tag/v1.6.0

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
 package/irqbalance/irqbalance.hash | 2 +-
 package/irqbalance/irqbalance.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/irqbalance/irqbalance.hash b/package/irqbalance/irqbalance.hash
index 3aba2e7..2e7cf49 100644
--- a/package/irqbalance/irqbalance.hash
+++ b/package/irqbalance/irqbalance.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 3318eddc03782cfdad22b20eff18eaf378c498c5de286e8cbaa5521ddf4f810b  irqbalance-1.5.0.tar.gz
+sha256 5ace9dd69d5190e24ee34210c3131333e9963e3ba649bf9237eabb4313c300d2  irqbalance-1.6.0.tar.gz
 sha256 32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
diff --git a/package/irqbalance/irqbalance.mk b/package/irqbalance/irqbalance.mk
index 8e550df..b01eba9 100644
--- a/package/irqbalance/irqbalance.mk
+++ b/package/irqbalance/irqbalance.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IRQBALANCE_VERSION = 1.5.0
+IRQBALANCE_VERSION = 1.6.0
 IRQBALANCE_SITE = $(call github,irqbalance,irqbalance,v$(IRQBALANCE_VERSION))
 IRQBALANCE_LICENSE = GPL-2.0
 IRQBALANCE_LICENSE_FILES = COPYING
-- 
2.7.4
