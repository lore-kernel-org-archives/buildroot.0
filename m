From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 11 Jun 2016 16:47:43 +0200
Subject: [Buildroot] [PATCH 4/4] package/enlightenment: bump to 0.20.9
In-Reply-To: <1465656463-8556-1-git-send-email-romain.naour@gmail.com>
References: <1465656463-8556-1-git-send-email-romain.naour@gmail.com>
Message-ID: <1465656463-8556-4-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
v2: bump to 0.20.9
---
 package/enlightenment/enlightenment.hash | 4 ++--
 package/enlightenment/enlightenment.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/enlightenment/enlightenment.hash b/package/enlightenment/enlightenment.hash
index 66bdb49..fad14b7 100644
--- a/package/enlightenment/enlightenment.hash
+++ b/package/enlightenment/enlightenment.hash
@@ -1,2 +1,2 @@
-# From https://phab.enlightenment.org/phame/live/3/post/e19_14_release/
-sha256	8906e762f0d953752bfe002663280a855da9bb74acf613424c517b78a8dde407	enlightenment-0.19.14.tar.xz
+# From https://www.enlightenment.org/news/e-0.20.9-release
+sha256	db792ad4d97b2523ff0bfc2c911bb3fea4b1eda60400871f4b78bc3ae2f1d1be 	enlightenment-0.20.9.tar.xz
diff --git a/package/enlightenment/enlightenment.mk b/package/enlightenment/enlightenment.mk
index a756361..6fe8f45 100644
--- a/package/enlightenment/enlightenment.mk
+++ b/package/enlightenment/enlightenment.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ENLIGHTENMENT_VERSION = 0.19.14
+ENLIGHTENMENT_VERSION = 0.20.9
 ENLIGHTENMENT_SOURCE = enlightenment-$(ENLIGHTENMENT_VERSION).tar.xz
 ENLIGHTENMENT_SITE = http://download.enlightenment.org/rel/apps/enlightenment
 ENLIGHTENMENT_LICENSE = BSD-2c
-- 
2.5.5
