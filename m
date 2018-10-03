From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed,  3 Oct 2018 10:23:33 +0200
Subject: [Buildroot] [PATCH 2/4] package/libhdhomerun: bump version to
 20180817
In-Reply-To: <20181003082335.25840-1-bernd.kuhls@t-online.de>
References: <20181003082335.25840-1-bernd.kuhls@t-online.de>
Message-ID: <20181003082335.25840-2-bernd.kuhls@t-online.de>
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
index ed972ddfc1..b7ad5b52e3 100644
--- a/package/libhdhomerun/libhdhomerun.hash
+++ b/package/libhdhomerun/libhdhomerun.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 d91fd3782f9a0834242f7110c44067647843602f8e95052045250b7c229ccbd5  libhdhomerun_20180327.tgz
+sha256 437888b27206f526827ee7a4c57c1c167a36483b0445232e07fb7bb7ee854b42  libhdhomerun_20180817.tgz
 sha256 9b872a8a070b8ad329c4bd380fb1bf0000f564c75023ec8e1e6803f15364b9e9  LICENSE
diff --git a/package/libhdhomerun/libhdhomerun.mk b/package/libhdhomerun/libhdhomerun.mk
index 5e32370a9d..96be54a782 100644
--- a/package/libhdhomerun/libhdhomerun.mk
+++ b/package/libhdhomerun/libhdhomerun.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBHDHOMERUN_VERSION = 20180327
+LIBHDHOMERUN_VERSION = 20180817
 LIBHDHOMERUN_SOURCE = libhdhomerun_$(LIBHDHOMERUN_VERSION).tgz
 LIBHDHOMERUN_SITE = http://download.silicondust.com/hdhomerun
 LIBHDHOMERUN_LICENSE = LGPL-2.1+
-- 
2.19.0
