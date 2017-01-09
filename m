From: Adam Duskett <aduskett@gmail.com>
Date: Mon,  9 Jan 2017 11:21:40 -0500
Subject: [Buildroot] [PATCH 1/1] audit: bump version to 2.7
Message-ID: <20170109162140.17981-1-aduskett@codeblue.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Adam Duskett <aduskett@codeblue.com>
---
 package/audit/audit.hash | 2 +-
 package/audit/audit.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/audit/audit.hash b/package/audit/audit.hash
index 794a93a..6b0f0c3 100644
--- a/package/audit/audit.hash
+++ b/package/audit/audit.hash
@@ -1,2 +1,2 @@
 #Locally computed
-sha256 8923917332daa7833bbc0c1d9eb012167093fbad000da4a9630fb3356aff8cdc audit-2.6.7.tar.gz
+sha256 05533f5d88d9520ceebfd8bfb3fd998ca4a2b246757fec7bbd8e33c287544537 audit-2.7.tar.gz
diff --git a/package/audit/audit.mk b/package/audit/audit.mk
index 0e5bd27..a576662 100644
--- a/package/audit/audit.mk
+++ b/package/audit/audit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-AUDIT_VERSION = 2.6.7
+AUDIT_VERSION = 2.7
 AUDIT_SITE = http://people.redhat.com/sgrubb/audit
 AUDIT_LICENSE = GPLv2+ (programs), unclear (libraries)
 AUDIT_LICENSE_FILES = COPYING
-- 
2.9.3
