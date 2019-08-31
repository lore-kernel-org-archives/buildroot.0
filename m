From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 31 Aug 2019 12:05:07 +0200
Subject: [Buildroot] [for-next 2/3] package/enlightenment: bump to version
 0.23.0
In-Reply-To: <20190831100508.8113-1-romain.naour@gmail.com>
References: <20190831100508.8113-1-romain.naour@gmail.com>
Message-ID: <20190831100508.8113-2-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This enlightement release include many Wayland improvements
but our packaging depends on Xorg only.

See:
https://www.enlightenment.org/news/e23_release
https://www.phoronix.com/scan.php?page=news_item&px=Enlightenment-0.23-Released

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/enlightenment/enlightenment.hash | 4 ++--
 package/enlightenment/enlightenment.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/enlightenment/enlightenment.hash b/package/enlightenment/enlightenment.hash
index 4872676bee..f692a67aa1 100644
--- a/package/enlightenment/enlightenment.hash
+++ b/package/enlightenment/enlightenment.hash
@@ -1,3 +1,3 @@
-# From https://www.enlightenment.org/news/e0.22.4_release
-sha256	59f4997c8b59457142870e40f137bc08c9735c84368d32213dacf09c4342fe79	enlightenment-0.22.4.tar.xz
+# From https://www.enlightenment.org/news/e23_release
+sha256	b8c5d040875576d3d3ad8572644f92a65e21291bcee6b0d62f74fbfd482afdf8	enlightenment-0.23.0.tar.xz
 sha256	34dbd501ec9d1c8dcc569c01db9cf9a4b7ee5981614cc9f8f613a97463d27350	COPYING
diff --git a/package/enlightenment/enlightenment.mk b/package/enlightenment/enlightenment.mk
index f0f9834c87..43f79d59da 100644
--- a/package/enlightenment/enlightenment.mk
+++ b/package/enlightenment/enlightenment.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ENLIGHTENMENT_VERSION = 0.22.4
+ENLIGHTENMENT_VERSION = 0.23.0
 ENLIGHTENMENT_SOURCE = enlightenment-$(ENLIGHTENMENT_VERSION).tar.xz
 ENLIGHTENMENT_SITE = http://download.enlightenment.org/rel/apps/enlightenment
 ENLIGHTENMENT_LICENSE = BSD-2-Clause
-- 
2.21.0
