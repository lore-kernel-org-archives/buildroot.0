From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 11 Apr 2015 09:52:17 +0200
Subject: [Buildroot] [PATCH 3/3] package/rsyslog: bump version to 8.9.0
In-Reply-To: <1428738737-3238-1-git-send-email-bernd.kuhls@t-online.de>
References: <1428738737-3238-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1428738737-3238-3-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/rsyslog/rsyslog.hash |    2 +-
 package/rsyslog/rsyslog.mk   |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rsyslog/rsyslog.hash b/package/rsyslog/rsyslog.hash
index bd35019..5f9e0ed 100644
--- a/package/rsyslog/rsyslog.hash
+++ b/package/rsyslog/rsyslog.hash
@@ -1,2 +1,2 @@
 # From http://www.rsyslog.com/downloads/download-v8-stable/
-sha256	147a7e474665af7a817ac18d7924e26448350a77572e7fd9cfe284cb6291a0eb	rsyslog-8.8.0.tar.gz
+sha256	eab00e8e758cd9dd33b3e2cf6af80297d1951dc7db37bd723a6488a35d577adc	rsyslog-8.9.0.tar.gz
diff --git a/package/rsyslog/rsyslog.mk b/package/rsyslog/rsyslog.mk
index 7d49ed1..261f59d 100644
--- a/package/rsyslog/rsyslog.mk
+++ b/package/rsyslog/rsyslog.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RSYSLOG_VERSION = 8.8.0
+RSYSLOG_VERSION = 8.9.0
 RSYSLOG_SITE = http://rsyslog.com/files/download/rsyslog
 RSYSLOG_LICENSE = GPLv3 LGPLv3 Apache-2.0
 RSYSLOG_LICENSE_FILES = COPYING COPYING.LESSER COPYING.ASL20
-- 
1.7.10.4
