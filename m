From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 14 Oct 2017 13:40:19 +0200
Subject: [Buildroot] [PATCH 1/1] package/libhdhomerun: bump version to
	20170815
Message-ID: <20171014114019.6762-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libhdhomerun/libhdhomerun.hash | 2 +-
 package/libhdhomerun/libhdhomerun.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libhdhomerun/libhdhomerun.hash b/package/libhdhomerun/libhdhomerun.hash
index 702007fb58..e7b7759fcf 100644
--- a/package/libhdhomerun/libhdhomerun.hash
+++ b/package/libhdhomerun/libhdhomerun.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 23a3484723f3744eb38349d19cbe7d25b5bed27adf64929bd174c1669b194a8a  libhdhomerun_20161117.tgz
+sha256 a9c14edb0ad0b0432bf64048c4a3e2f71a48298e80416d884d0b33428d65ca65  libhdhomerun_20170815.tgz
diff --git a/package/libhdhomerun/libhdhomerun.mk b/package/libhdhomerun/libhdhomerun.mk
index b624400b5b..47e6d22f61 100644
--- a/package/libhdhomerun/libhdhomerun.mk
+++ b/package/libhdhomerun/libhdhomerun.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBHDHOMERUN_VERSION = 20161117
+LIBHDHOMERUN_VERSION = 20170815
 LIBHDHOMERUN_SOURCE = libhdhomerun_$(LIBHDHOMERUN_VERSION).tgz
 LIBHDHOMERUN_SITE = http://download.silicondust.com/hdhomerun
 LIBHDHOMERUN_LICENSE = LGPL-2.1+
-- 
2.11.0
