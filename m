From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 23 Nov 2019 14:18:02 +0100
Subject: [Buildroot] [git commit branch/next] package/rsyslog: bump to
 8.1911.0
Message-ID: <20191123131356.60D7E8F6E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=483b43899c09c5dd2b91f14a45b3f598d9928bbf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

https://github.com/rsyslog/rsyslog/blob/v8-stable/ChangeLog

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
