From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 7 Feb 2021 23:05:08 +0100
Subject: [Buildroot] [git commit] package/libfastjson: bump version to 0.99.9
Message-ID: <20210207214540.D584C82ADE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0567c8a4290e784e3cbfdceaff1aac8986329426
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog: https://github.com/rsyslog/libfastjson/blob/master/ChangeLog

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libfastjson/libfastjson.hash | 2 +-
 package/libfastjson/libfastjson.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libfastjson/libfastjson.hash b/package/libfastjson/libfastjson.hash
index 07ea88f11e..218a738b37 100644
--- a/package/libfastjson/libfastjson.hash
+++ b/package/libfastjson/libfastjson.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  7e49057b26a5a9e3c6623e024f95f9fd9a14b571b9150aeb89d6d475fc3633e3  libfastjson-0.99.8.tar.gz
+sha256  881f954633aa76931e4c756ece0bda6fd8a673c6e66955a3db3b2bb9d6bbff72  libfastjson-0.99.9.tar.gz
 sha256  b29370bbfa98816e1fca0901f18149d920736771bfd68b4ee0eb00c78b38d245  COPYING
diff --git a/package/libfastjson/libfastjson.mk b/package/libfastjson/libfastjson.mk
index 37dbd7e03e..7ab978dc67 100644
--- a/package/libfastjson/libfastjson.mk
+++ b/package/libfastjson/libfastjson.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBFASTJSON_VERSION = 0.99.8
+LIBFASTJSON_VERSION = 0.99.9
 LIBFASTJSON_SITE = $(call github,rsyslog,libfastjson,v$(LIBFASTJSON_VERSION))
 LIBFASTJSON_INSTALL_STAGING = YES
 LIBFASTJSON_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
