From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 12 Dec 2017 21:51:34 +0200
Subject: [Buildroot] [PATCH 1/2] dhcp: bump to version 4.3.6
Message-ID: <b408b98eeb4a9479b974d3d98e84b5d1f279c5b2.1513108295.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Renumber the patch.

Add license hash.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 ...{0002-bind-cross-compile.patch => 0001-bind-cross-compile.patch} | 0
 package/dhcp/dhcp.hash                                              | 6 ++++--
 package/dhcp/dhcp.mk                                                | 2 +-
 3 files changed, 5 insertions(+), 3 deletions(-)
 rename package/dhcp/{0002-bind-cross-compile.patch => 0001-bind-cross-compile.patch} (100%)

diff --git a/package/dhcp/0002-bind-cross-compile.patch b/package/dhcp/0001-bind-cross-compile.patch
similarity index 100%
rename from package/dhcp/0002-bind-cross-compile.patch
rename to package/dhcp/0001-bind-cross-compile.patch
diff --git a/package/dhcp/dhcp.hash b/package/dhcp/dhcp.hash
index 7898aa45d3b7..ce5f995a55bb 100644
--- a/package/dhcp/dhcp.hash
+++ b/package/dhcp/dhcp.hash
@@ -1,2 +1,4 @@
-# Verified from https://ftp.isc.org/isc/dhcp/4.3.5/dhcp-4.3.5.tar.gz.sha256.asc
-sha256 eb95936bf15d2393c55dd505bc527d1d4408289cec5a9fa8abb99f7577e7f954  dhcp-4.3.5.tar.gz
+# Verified from https://ftp.isc.org/isc/dhcp/4.3.6/dhcp-4.3.6.tar.gz.sha256.asc
+sha256 a41eaf6364f1377fe065d35671d9cf82bbbc8f21207819b2b9f33f652aec6f1b  dhcp-4.3.6.tar.gz
+# Locally calculated
+sha256 dd7ae2201c0c11c3c1e2510d731c67b2f4bc8ba735707d7348ddd65f7b598562  LICENSE
diff --git a/package/dhcp/dhcp.mk b/package/dhcp/dhcp.mk
index 45cae087aae0..4e1b24b7001c 100644
--- a/package/dhcp/dhcp.mk
+++ b/package/dhcp/dhcp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DHCP_VERSION = 4.3.5
+DHCP_VERSION = 4.3.6
 DHCP_SITE = http://ftp.isc.org/isc/dhcp/$(DHCP_VERSION)
 DHCP_INSTALL_STAGING = YES
 DHCP_LICENSE = ISC
-- 
2.15.1
