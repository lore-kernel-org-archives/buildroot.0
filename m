From: Peter Seiderer <ps.report@gmx.net>
Date: Sat, 20 Feb 2021 18:04:06 +0100
Subject: [Buildroot] [PATCH/next v1] package/irqbalance: bump version to
 1.7.0
Message-ID: <20210220170406.27723-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For details see [1].

[1] https://github.com/Irqbalance/irqbalance/releases/tag/v1.7.0

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/irqbalance/irqbalance.hash | 2 +-
 package/irqbalance/irqbalance.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/irqbalance/irqbalance.hash b/package/irqbalance/irqbalance.hash
index 2e7cf49c25..587173ca65 100644
--- a/package/irqbalance/irqbalance.hash
+++ b/package/irqbalance/irqbalance.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 5ace9dd69d5190e24ee34210c3131333e9963e3ba649bf9237eabb4313c300d2  irqbalance-1.6.0.tar.gz
+sha256 28f2ad35945b93d90f4a5bad95b4c0871a0f644375f746ec16f61045b9ec970e  irqbalance-1.7.0.tar.gz
 sha256 32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
diff --git a/package/irqbalance/irqbalance.mk b/package/irqbalance/irqbalance.mk
index 36e9e42493..b099f7c6e2 100644
--- a/package/irqbalance/irqbalance.mk
+++ b/package/irqbalance/irqbalance.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IRQBALANCE_VERSION = 1.6.0
+IRQBALANCE_VERSION = 1.7.0
 IRQBALANCE_SITE = $(call github,irqbalance,irqbalance,v$(IRQBALANCE_VERSION))
 IRQBALANCE_LICENSE = GPL-2.0
 IRQBALANCE_LICENSE_FILES = COPYING
-- 
2.30.1
