From: Asaf Kahlon <asafka7@gmail.com>
Date: Sat, 12 Jun 2021 21:35:00 +0300
Subject: [Buildroot] [PATCH 1/1] package/{libuv,
 uvw}: bump to versions 1.41.0, 2.9.0_libuv_v1.41
Message-ID: <20210612183500.399503-1-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

LICENSE change: bump year 2020 to 2021.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/libuv/libuv.hash | 2 +-
 package/libuv/libuv.mk   | 2 +-
 package/uvw/uvw.hash     | 4 ++--
 package/uvw/uvw.mk       | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/libuv/libuv.hash b/package/libuv/libuv.hash
index c682affae7..042dd9dc34 100644
--- a/package/libuv/libuv.hash
+++ b/package/libuv/libuv.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  70fe1c9ba4f2c509e8166c0ca2351000237da573bb6c82092339207a9715ba6b  libuv-1.40.0.tar.gz
+sha256  6cfeb5f4bab271462b4a2cc77d4ecec847fdbdc26b72019c27ae21509e6f94fa  libuv-1.41.0.tar.gz
 sha256  6d20216ae022fbeed23916f48508fd807ece3d8464992330643b0e64e5c0c24b  LICENSE
diff --git a/package/libuv/libuv.mk b/package/libuv/libuv.mk
index 403a049037..d3c58d4dd4 100644
--- a/package/libuv/libuv.mk
+++ b/package/libuv/libuv.mk
@@ -6,7 +6,7 @@
 
 # When bumping libuv, check if a new version of uvw is available
 # and bump it too.
-LIBUV_VERSION = 1.40.0
+LIBUV_VERSION = 1.41.0
 LIBUV_SITE = $(call github,libuv,libuv,v$(LIBUV_VERSION))
 LIBUV_DEPENDENCIES = host-pkgconf
 LIBUV_INSTALL_STAGING = YES
diff --git a/package/uvw/uvw.hash b/package/uvw/uvw.hash
index ba8c7b893d..2aeb4732cd 100644
--- a/package/uvw/uvw.hash
+++ b/package/uvw/uvw.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  aa5769f5b9ba50de72ab02a8f8acf298b4aa9ceaef07992418a13a0fa119ce7d  uvw-2.8.0_libuv_v1.40.tar.gz
-sha256  755b2f245af22830c15b60c54469c0d92fbed42009b0d0074cec4b3959905757  LICENSE
+sha256  dd610cb1626b8a7779ed251584bcc0362fb98fcee13e699680f61828a1ba55de  uvw-2.9.0_libuv_v1.41.tar.gz
+sha256  5de32af2469480cf3261c9781962e0887366666ba8ee1f4a32c386c77fc50c88  LICENSE
diff --git a/package/uvw/uvw.mk b/package/uvw/uvw.mk
index f152d9f1cf..96375926d9 100644
--- a/package/uvw/uvw.mk
+++ b/package/uvw/uvw.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UVW_VERSION = 2.8.0_libuv_v1.40
+UVW_VERSION = 2.9.0_libuv_v1.41
 UVW_SITE = $(call github,skypjack,uvw,v$(UVW_VERSION))
 UVW_INSTALL_STAGING = YES
 UVW_INSTALL_TARGET = NO
-- 
2.30.2
