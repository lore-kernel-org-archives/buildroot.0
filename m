From: Asaf Kahlon <asafka7@gmail.com>
Date: Fri,  4 Oct 2019 21:31:07 +0300
Subject: [Buildroot] [PATCH 1/1] package/collectd: bump to version 5.9.2
Message-ID: <20191004183132.15564-1-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/collectd/collectd.hash | 6 +++---
 package/collectd/collectd.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/collectd/collectd.hash b/package/collectd/collectd.hash
index 45d6f89c2d..b180e2dfe0 100644
--- a/package/collectd/collectd.hash
+++ b/package/collectd/collectd.hash
@@ -1,5 +1,5 @@
 # Locally computed checksums
-sha512	424ef12a3ba6997a71e6eda1a62d73fec588c9c4d90542c2381c1f9f4e118b2c02e18c71507e8984e20fb255b69b7f42afe83085b3df5e225c576d1eee1655fb	collectd-5.9.1.tar.gz
-sha256	51fb72f51489cb33fa4ddd65b757d81d77c13a33b36f031d6ce2835a2eec9adb	collectd-5.9.1.tar.gz
-sha1	30abba37e049e05dc7d00b205a61338da37ee8a6	collectd-5.9.1.tar.gz
+sha512	cbbc8d6409242108550b974f388d15c6084753dd51c6056614db34bceb3b72abb0237892ea65086093b9a5c5569087666c0430eb16021d22c3dde8e6d1ae7922	collectd-5.9.2.tar.gz
+sha256	961116e74ac505b920578932fd2bd9904febbc7d5aefba3e0ea3d44337c00119	collectd-5.9.2.tar.gz
+sha1	19541b8df0115f8e66cb6f11b9826a921cb5a3c7	collectd-5.9.2.tar.gz
 sha256	ed0409b2b1c30566dab5fcdaf46ee70e140c99788e22f0267645a9357b476ae4	COPYING
diff --git a/package/collectd/collectd.mk b/package/collectd/collectd.mk
index c409a391c3..1681d556b6 100644
--- a/package/collectd/collectd.mk
+++ b/package/collectd/collectd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-COLLECTD_VERSION = 5.9.1
+COLLECTD_VERSION = 5.9.2
 COLLECTD_SITE = $(call github,collectd,collectd,collectd-$(COLLECTD_VERSION))
 COLLECTD_CONF_ENV = ac_cv_lib_yajl_yajl_alloc=yes
 COLLECTD_INSTALL_STAGING = YES
-- 
2.20.1
