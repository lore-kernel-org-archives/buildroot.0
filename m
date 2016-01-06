From: Romain Naour <romain.naour@gmail.com>
Date: Thu,  7 Jan 2016 00:05:37 +0100
Subject: [Buildroot] [PATCH 3/3] package/enlightenment: bump to 0.19.14
In-Reply-To: <1452121537-32273-1-git-send-email-romain.naour@gmail.com>
References: <1452121537-32273-1-git-send-email-romain.naour@gmail.com>
Message-ID: <1452121537-32273-4-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/enlightenment/enlightenment.hash | 4 ++--
 package/enlightenment/enlightenment.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/enlightenment/enlightenment.hash b/package/enlightenment/enlightenment.hash
index c9b1284..66bdb49 100644
--- a/package/enlightenment/enlightenment.hash
+++ b/package/enlightenment/enlightenment.hash
@@ -1,2 +1,2 @@
-# From https://phab.enlightenment.org/phame/live/3/post/e19_12_release/
-sha256	55f23c337e3092e735ae37ada8f6701adab5ddd13f37ef38c63eec8a536f0b25	enlightenment-0.19.12.tar.xz
+# From https://phab.enlightenment.org/phame/live/3/post/e19_14_release/
+sha256	8906e762f0d953752bfe002663280a855da9bb74acf613424c517b78a8dde407	enlightenment-0.19.14.tar.xz
diff --git a/package/enlightenment/enlightenment.mk b/package/enlightenment/enlightenment.mk
index 5cf4811..a756361 100644
--- a/package/enlightenment/enlightenment.mk
+++ b/package/enlightenment/enlightenment.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ENLIGHTENMENT_VERSION = 0.19.12
+ENLIGHTENMENT_VERSION = 0.19.14
 ENLIGHTENMENT_SOURCE = enlightenment-$(ENLIGHTENMENT_VERSION).tar.xz
 ENLIGHTENMENT_SITE = http://download.enlightenment.org/rel/apps/enlightenment
 ENLIGHTENMENT_LICENSE = BSD-2c
-- 
2.4.3
