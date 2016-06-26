From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Jun 2016 21:31:14 +0200
Subject: [Buildroot] [git commit] package/libevas-generic-loaders: bump to
	1.17.0
Message-ID: <20160626193234.D0D78800A3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7b087f4d6e2a31c56abd85abeed5778d14c218b6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libevas-generic-loaders/libevas-generic-loaders.hash | 4 ++--
 package/libevas-generic-loaders/libevas-generic-loaders.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libevas-generic-loaders/libevas-generic-loaders.hash b/package/libevas-generic-loaders/libevas-generic-loaders.hash
index 32723ba..ee2ae9b 100644
--- a/package/libevas-generic-loaders/libevas-generic-loaders.hash
+++ b/package/libevas-generic-loaders/libevas-generic-loaders.hash
@@ -1,2 +1,2 @@
-# From https://download.enlightenment.org/rel/libs/evas_generic_loaders/evas_generic_loaders-1.15.0.tar.xz.sha256
-sha256	1e539e4d4d4e1590345caeb7fdd84f47ec7cd63bb76b6b7107a87420a401fd7f	evas_generic_loaders-1.15.0.tar.xz
+# From https://download.enlightenment.org/rel/libs/evas_generic_loaders/evas_generic_loaders-1.17.0.tar.xz.sha256
+sha256	c2f5193a9326532d3ab3ff76f547b9d17b33ae7221ce4d6e0aefb905ba0dd87a	evas_generic_loaders-1.17.0.tar.xz
diff --git a/package/libevas-generic-loaders/libevas-generic-loaders.mk b/package/libevas-generic-loaders/libevas-generic-loaders.mk
index ff8ea37..abc436b 100644
--- a/package/libevas-generic-loaders/libevas-generic-loaders.mk
+++ b/package/libevas-generic-loaders/libevas-generic-loaders.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBEVAS_GENERIC_LOADERS_VERSION = 1.15.0
+LIBEVAS_GENERIC_LOADERS_VERSION = 1.17.0
 LIBEVAS_GENERIC_LOADERS_SOURCE = evas_generic_loaders-$(LIBEVAS_GENERIC_LOADERS_VERSION).tar.xz
 LIBEVAS_GENERIC_LOADERS_SITE = http://download.enlightenment.org/rel/libs/evas_generic_loaders
 LIBEVAS_GENERIC_LOADERS_LICENSE = GPLv2
