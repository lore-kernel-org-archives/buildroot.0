From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 26 Aug 2017 21:58:05 +0200
Subject: [Buildroot] [for-next 2/3] package/enlightenment: bump to 0.21.9
In-Reply-To: <20170826195806.18802-1-romain.naour@gmail.com>
References: <20170826195806.18802-1-romain.naour@gmail.com>
Message-ID: <20170826195806.18802-2-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

See: https://www.enlightenment.org/news/e0.21.9_release

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/enlightenment/enlightenment.hash | 4 ++--
 package/enlightenment/enlightenment.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/enlightenment/enlightenment.hash b/package/enlightenment/enlightenment.hash
index 0cb433f..91fb98a 100644
--- a/package/enlightenment/enlightenment.hash
+++ b/package/enlightenment/enlightenment.hash
@@ -1,2 +1,2 @@
-# From https://www.enlightenment.org/news/e0.21.8_release
-sha256	fac21c5fb9cab89fb717b3577f7980fd0644ff1e94b144a55ba841116e8c5232 	enlightenment-0.21.8.tar.xz
+# From https://www.enlightenment.org/news/e0.21.9_release
+sha256	eb560c0027378baf650d0690747ef0d08b5b329504e26e2210cc7978c019ae70 	enlightenment-0.21.9.tar.xz
diff --git a/package/enlightenment/enlightenment.mk b/package/enlightenment/enlightenment.mk
index e3c1dcf..441f049 100644
--- a/package/enlightenment/enlightenment.mk
+++ b/package/enlightenment/enlightenment.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ENLIGHTENMENT_VERSION = 0.21.8
+ENLIGHTENMENT_VERSION = 0.21.9
 ENLIGHTENMENT_SOURCE = enlightenment-$(ENLIGHTENMENT_VERSION).tar.xz
 ENLIGHTENMENT_SITE = http://download.enlightenment.org/rel/apps/enlightenment
 ENLIGHTENMENT_LICENSE = BSD-2-Clause
-- 
2.9.5
