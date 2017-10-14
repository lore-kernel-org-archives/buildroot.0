From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 14 Oct 2017 14:31:31 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/libhdhomerun: bump version to
	20170930
Message-ID: <20171014123131.27579-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v2: bumped to 20170930

 package/libhdhomerun/libhdhomerun.hash | 2 +-
 package/libhdhomerun/libhdhomerun.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libhdhomerun/libhdhomerun.hash b/package/libhdhomerun/libhdhomerun.hash
index 702007fb58..0938889d88 100644
--- a/package/libhdhomerun/libhdhomerun.hash
+++ b/package/libhdhomerun/libhdhomerun.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 23a3484723f3744eb38349d19cbe7d25b5bed27adf64929bd174c1669b194a8a  libhdhomerun_20161117.tgz
+sha256 0cb392231961fab6c226c69012503e2ebe46ac0f13512689bd37d6cf9ee838a1  libhdhomerun_20170930.tgz
diff --git a/package/libhdhomerun/libhdhomerun.mk b/package/libhdhomerun/libhdhomerun.mk
index b624400b5b..10aff88e6a 100644
--- a/package/libhdhomerun/libhdhomerun.mk
+++ b/package/libhdhomerun/libhdhomerun.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBHDHOMERUN_VERSION = 20161117
+LIBHDHOMERUN_VERSION = 20170930
 LIBHDHOMERUN_SOURCE = libhdhomerun_$(LIBHDHOMERUN_VERSION).tgz
 LIBHDHOMERUN_SITE = http://download.silicondust.com/hdhomerun
 LIBHDHOMERUN_LICENSE = LGPL-2.1+
-- 
2.11.0
