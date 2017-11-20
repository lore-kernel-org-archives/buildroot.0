From: Adam Duskett <aduskett@gmail.com>
Date: Mon, 20 Nov 2017 09:32:03 -0500
Subject: [Buildroot] [NEXT 1/1] time: bump to 1.8
Message-ID: <20171120143203.23316-1-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In addition:
- Update license to GPL-3.0+
- Add a shash for the license file.

See: https://lists.gnu.org/archive/html/info-gnu/2017-11/msg00002.html for
more information.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 package/time/time.hash | 3 ++-
 package/time/time.mk   | 4 ++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/time/time.hash b/package/time/time.hash
index 6ad8c24..7d395bf 100644
--- a/package/time/time.hash
+++ b/package/time/time.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256	e37ea79a253bf85a85ada2f7c632c14e481a5fd262a362f6f4fd58e68601496d	time-1.7.tar.gz
+sha256	8a2f540155961a35ba9b84aec5e77e3ae36c74cecb4484db455960601b7a2e1b	time-1.8.tar.gz
+sha256	8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903	COPYING
diff --git a/package/time/time.mk b/package/time/time.mk
index 8092ea9..c238ee6 100644
--- a/package/time/time.mk
+++ b/package/time/time.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-TIME_VERSION = 1.7
+TIME_VERSION = 1.8
 TIME_SITE = $(BR2_GNU_MIRROR)/time
 TIME_CONF_ENV = ac_cv_func_wait3=yes
-TIME_LICENSE = GPL-2.0+
+TIME_LICENSE = GPL-3.0+
 TIME_LICENSE_FILES = COPYING
 
 # time uses an old version of automake that does not support
-- 
2.13.6
