From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Mon, 18 Nov 2019 15:20:18 -0600
Subject: [Buildroot] [next] package/rsyslog: bump to 8.1911.0
Message-ID: <20191118212018.4043-1-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://github.com/rsyslog/rsyslog/blob/v8-stable/ChangeLog

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
 package/rsyslog/rsyslog.hash | 2 +-
 package/rsyslog/rsyslog.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rsyslog/rsyslog.hash b/package/rsyslog/rsyslog.hash
index a963b4e7bb..22372a92a7 100644
--- a/package/rsyslog/rsyslog.hash
+++ b/package/rsyslog/rsyslog.hash
@@ -1,5 +1,5 @@
 # From http://www.rsyslog.com/downloads/download-v8-stable/
-sha256	0219ee692f31a39743acb62aaf4196b644ce94edf386df4605fd6a11a4fe0c93	rsyslog-8.1910.0.tar.gz
+sha256	e1f4776b1c62ad7220f4d624a89a96b0c3d4738006899356eaaef0f1f91ee104	rsyslog-8.1911.0.tar.gz
 
 # Locally calculated
 sha256	054b3a047d9232376a46b87356b19b0c0c2924cb5e6911ab96a01fc4b515f083	COPYING
diff --git a/package/rsyslog/rsyslog.mk b/package/rsyslog/rsyslog.mk
index 5bd6b59ba3..1d535fc26b 100644
--- a/package/rsyslog/rsyslog.mk
+++ b/package/rsyslog/rsyslog.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RSYSLOG_VERSION = 8.1910.0
+RSYSLOG_VERSION = 8.1911.0
 RSYSLOG_SITE = http://rsyslog.com/files/download/rsyslog
 RSYSLOG_LICENSE = GPL-3.0, LGPL-3.0, Apache-2.0
 RSYSLOG_LICENSE_FILES = COPYING COPYING.LESSER COPYING.ASL20
-- 
2.17.1
