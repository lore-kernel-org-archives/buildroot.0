From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 21 Apr 2020 21:37:24 +0200
Subject: [Buildroot] [git commit] package/rsyslog: bump to 8.2002.0
Message-ID: <20200421193603.94F228FB1C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1db206cb8becd470908cb731159d8afbe23091c1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/rsyslog/rsyslog.hash | 8 ++++----
 package/rsyslog/rsyslog.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/rsyslog/rsyslog.hash b/package/rsyslog/rsyslog.hash
index 22372a92a7..0ed50f8199 100644
--- a/package/rsyslog/rsyslog.hash
+++ b/package/rsyslog/rsyslog.hash
@@ -1,7 +1,7 @@
 # From http://www.rsyslog.com/downloads/download-v8-stable/
-sha256	e1f4776b1c62ad7220f4d624a89a96b0c3d4738006899356eaaef0f1f91ee104	rsyslog-8.1911.0.tar.gz
+sha256  fe86c14d860da1202c76616feac0539ea5a40a4ad182d74b7d6d2419cc2381f8  rsyslog-8.2002.0.tar.gz
 
 # Locally calculated
-sha256	054b3a047d9232376a46b87356b19b0c0c2924cb5e6911ab96a01fc4b515f083	COPYING
-sha256	8743ad560dea1229d4f46cd603e10874db41a27f3c74f64e958ef123f3943fab	COPYING.ASL20
-sha256	4038442ca5bde8ffd243cfc235cb4455e7d618d47558ea3d8284733f71d904ed	COPYING.LESSER
+sha256  054b3a047d9232376a46b87356b19b0c0c2924cb5e6911ab96a01fc4b515f083  COPYING
+sha256  8743ad560dea1229d4f46cd603e10874db41a27f3c74f64e958ef123f3943fab  COPYING.ASL20
+sha256  4038442ca5bde8ffd243cfc235cb4455e7d618d47558ea3d8284733f71d904ed  COPYING.LESSER
diff --git a/package/rsyslog/rsyslog.mk b/package/rsyslog/rsyslog.mk
index c4446c210d..27d482fdec 100644
--- a/package/rsyslog/rsyslog.mk
+++ b/package/rsyslog/rsyslog.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RSYSLOG_VERSION = 8.1911.0
+RSYSLOG_VERSION = 8.2002.0
 RSYSLOG_SITE = http://rsyslog.com/files/download/rsyslog
 RSYSLOG_LICENSE = GPL-3.0, LGPL-3.0, Apache-2.0
 RSYSLOG_LICENSE_FILES = COPYING COPYING.LESSER COPYING.ASL20
