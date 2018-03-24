From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 24 Mar 2018 18:30:49 +0100
Subject: [Buildroot] [git commit] package/enlightenment: bump to 0.22.3
Message-ID: <20180324173233.8FDA5839E6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0d87537ccc6d5b5daf6e7afac80117ad316dc371
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://www.enlightenment.org/news/e0.22.3_release

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/enlightenment/enlightenment.hash | 4 ++--
 package/enlightenment/enlightenment.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/enlightenment/enlightenment.hash b/package/enlightenment/enlightenment.hash
index 686d0ef3be..7a6d3ff8f0 100644
--- a/package/enlightenment/enlightenment.hash
+++ b/package/enlightenment/enlightenment.hash
@@ -1,3 +1,3 @@
-# From https://www.enlightenment.org/news/e0.22.2_release
-sha256	4d581ef85246f0cba003427bb9b3758e3de137babea1cdd2affd70a2cbe1632c	enlightenment-0.22.2.tar.xz
+# From https://www.enlightenment.org/news/e0.22.3_release
+sha256	4d81e583073d74474b7a960b01cb596716a43cca2fadca7d1e5c91f4cf6efe9b	enlightenment-0.22.3.tar.xz
 sha256	34dbd501ec9d1c8dcc569c01db9cf9a4b7ee5981614cc9f8f613a97463d27350	COPYING
diff --git a/package/enlightenment/enlightenment.mk b/package/enlightenment/enlightenment.mk
index ba6b54143e..480e9e9da8 100644
--- a/package/enlightenment/enlightenment.mk
+++ b/package/enlightenment/enlightenment.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ENLIGHTENMENT_VERSION = 0.22.2
+ENLIGHTENMENT_VERSION = 0.22.3
 ENLIGHTENMENT_SOURCE = enlightenment-$(ENLIGHTENMENT_VERSION).tar.xz
 ENLIGHTENMENT_SITE = http://download.enlightenment.org/rel/apps/enlightenment
 ENLIGHTENMENT_LICENSE = BSD-2-Clause
