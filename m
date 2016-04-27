From: Romain Naour <romain.naour@gmail.com>
Date: Wed, 27 Apr 2016 22:46:54 +0200
Subject: [Buildroot] [PATCH 4/4] package/enlightenment: bump to 0.20.7
In-Reply-To: <1461790014-17051-1-git-send-email-romain.naour@gmail.com>
References: <1461790014-17051-1-git-send-email-romain.naour@gmail.com>
Message-ID: <1461790014-17051-4-git-send-email-romain.naour@gmail.com>
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
index 66bdb49..0084233 100644
--- a/package/enlightenment/enlightenment.hash
+++ b/package/enlightenment/enlightenment.hash
@@ -1,2 +1,2 @@
-# From https://phab.enlightenment.org/phame/live/3/post/e19_14_release/
-sha256	8906e762f0d953752bfe002663280a855da9bb74acf613424c517b78a8dde407	enlightenment-0.19.14.tar.xz
+# From https://www.enlightenment.org/news/e20_7_release
+sha256	7cdee85928488bdeb07ab22f31c1aaf58e27ca365d327968cfed6a5f83ade181	enlightenment-0.20.7.tar.xz
diff --git a/package/enlightenment/enlightenment.mk b/package/enlightenment/enlightenment.mk
index a756361..c906104 100644
--- a/package/enlightenment/enlightenment.mk
+++ b/package/enlightenment/enlightenment.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ENLIGHTENMENT_VERSION = 0.19.14
+ENLIGHTENMENT_VERSION = 0.20.7
 ENLIGHTENMENT_SOURCE = enlightenment-$(ENLIGHTENMENT_VERSION).tar.xz
 ENLIGHTENMENT_SITE = http://download.enlightenment.org/rel/apps/enlightenment
 ENLIGHTENMENT_LICENSE = BSD-2c
-- 
2.5.5
