From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Thu,  2 Jul 2020 14:23:54 +0200
Subject: [Buildroot] [PATCH] package/ntp: bump to version 4.2.8p15
Message-ID: <20200702122354.26043-1-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/ntp/ntp.hash | 6 +++---
 package/ntp/ntp.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/ntp/ntp.hash b/package/ntp/ntp.hash
index fdb5bacade..3c2f6a95a7 100644
--- a/package/ntp/ntp.hash
+++ b/package/ntp/ntp.hash
@@ -1,5 +1,5 @@
-# From https://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-4.2/ntp-4.2.8p14.tar.gz.md5
-md5  783edaf1d68ddf651bde64eda54a579d  ntp-4.2.8p14.tar.gz
+# From http://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-4.2/ntp-4.2.8p15.tar.gz.md5
+md5  e1e6b23d2fc75cced41801dbcd6c2561  ntp-4.2.8p15.tar.gz
 # Calculated based on the hash above
-sha256  1960e4f081f6aafd108d721bc3ab15f9e8dfd08dc08339aa95bca9d2545e4eb7  ntp-4.2.8p14.tar.gz
+sha256  f65840deab68614d5d7ceb2d0bb9304ff70dcdedd09abb79754a87536b849c19  ntp-4.2.8p15.tar.gz
 sha256  957e6a13445cc61ab1ca3dc80d8c269cf9b0a6d9eaec20f9f39639b0b3e66ee8  COPYRIGHT
diff --git a/package/ntp/ntp.mk b/package/ntp/ntp.mk
index 3af3e01a52..f82eeae9b4 100644
--- a/package/ntp/ntp.mk
+++ b/package/ntp/ntp.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 NTP_VERSION_MAJOR = 4.2
-NTP_VERSION = $(NTP_VERSION_MAJOR).8p14
+NTP_VERSION = $(NTP_VERSION_MAJOR).8p15
 NTP_SITE = https://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-$(NTP_VERSION_MAJOR)
 NTP_DEPENDENCIES = host-pkgconf libevent
 NTP_LICENSE = NTP
-- 
2.17.0
