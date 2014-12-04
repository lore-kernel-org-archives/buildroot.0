From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Thu, 4 Dec 2014 17:39:56 +0000
Subject: [Buildroot] [PATCH] w_scan: bump version to 20141122
Message-ID: <1417714796-65316-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Bump version to 20141122
- Add a hash file

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/w_scan/w_scan.hash |    2 ++
 package/w_scan/w_scan.mk   |    2 +-
 2 files changed, 3 insertions(+), 1 deletions(-)
 create mode 100644 package/w_scan/w_scan.hash

diff --git a/package/w_scan/w_scan.hash b/package/w_scan/w_scan.hash
new file mode 100644
index 0000000..4c336f3
--- /dev/null
+++ b/package/w_scan/w_scan.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  b6d7c9ab997c53a0b0d92e8390f313cc3b82ee8ece1756b4e526119fd5ba09b4  w_scan-20141122.tar.bz2
diff --git a/package/w_scan/w_scan.mk b/package/w_scan/w_scan.mk
index 44f3193..3ec84ed 100644
--- a/package/w_scan/w_scan.mk
+++ b/package/w_scan/w_scan.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-W_SCAN_VERSION = 20140118
+W_SCAN_VERSION = 20141122
 W_SCAN_SOURCE = w_scan-$(W_SCAN_VERSION).tar.bz2
 W_SCAN_SITE = http://wirbel.htpc-forum.de/w_scan
 W_SCAN_LICENSE = GPLv2+
-- 
1.7.1
