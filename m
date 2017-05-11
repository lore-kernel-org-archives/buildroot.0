From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 11 May 2017 21:40:01 +0200
Subject: [Buildroot] [git commit branch/next] audit: bump to 2.7.6
Message-ID: <20170511194132.DA95B7FCFB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9235a19f1ae01de6eaa2c36c41cc6a790892f2fe
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Adam Duskett <aduskett@codeblue.com>
Reviewed-by: Matt Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/audit/audit.hash | 2 +-
 package/audit/audit.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/audit/audit.hash b/package/audit/audit.hash
index 2ae8f99..7dd3e55 100644
--- a/package/audit/audit.hash
+++ b/package/audit/audit.hash
@@ -1,2 +1,2 @@
 #Locally computed
-sha256 0441790794fd9375dbca598fa0ffb46c57ff37b3a24b94ffec0bbee3215cca09 audit-2.7.1.tar.gz
+sha256 fa65289cffdc95a25bfbdba541f43ee1b12c707090a38fd027dcf9354b9014e7 audit-2.7.6.tar.gz
diff --git a/package/audit/audit.mk b/package/audit/audit.mk
index b94d0bf..95b6078 100644
--- a/package/audit/audit.mk
+++ b/package/audit/audit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-AUDIT_VERSION = 2.7.1
+AUDIT_VERSION = 2.7.6
 AUDIT_SITE = http://people.redhat.com/sgrubb/audit
 AUDIT_LICENSE = GPL-2.0+ (programs), unclear (libraries)
 AUDIT_LICENSE_FILES = COPYING
