From: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
Date: Tue, 20 Dec 2016 22:40:48 +0530
Subject: [Buildroot] [PATCH] can-utils: bump version
Message-ID: <1482253848-4250-1-git-send-email-rahul.bedarkar@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This version bump also fixes:
http://autobuild.buildroot.net/results/0e5/0e5242376ff6aa82e89ed1172350e05009d48156

Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/can-utils/can-utils.hash | 2 +-
 package/can-utils/can-utils.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/can-utils/can-utils.hash b/package/can-utils/can-utils.hash
index 5e0bccc..64c4cf6 100644
--- a/package/can-utils/can-utils.hash
+++ b/package/can-utils/can-utils.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256  9899f8838d52459769b61ba3cb2d1e079a5d28fbef1a23859489753da91fce82  can-utils-64edc021d22441002028bc451548b9e7f1874b91.tar.gz
+sha256  c4b6b347c1c165a64c1156bb8816bce557945dd770f61b8bdc8fdb7c0744af27  can-utils-c3305fdd515464153d20199db232b6124bc962c0.tar.gz
diff --git a/package/can-utils/can-utils.mk b/package/can-utils/can-utils.mk
index 46caf62..6be41a6 100644
--- a/package/can-utils/can-utils.mk
+++ b/package/can-utils/can-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CAN_UTILS_VERSION = 64edc021d22441002028bc451548b9e7f1874b91
+CAN_UTILS_VERSION = c3305fdd515464153d20199db232b6124bc962c0
 CAN_UTILS_SITE = $(call github,linux-can,can-utils,$(CAN_UTILS_VERSION))
 CAN_UTILS_AUTORECONF = YES
 
-- 
2.6.2
