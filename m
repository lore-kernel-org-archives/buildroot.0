From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 19 Oct 2015 22:03:56 +0200
Subject: [Buildroot] [git commit] dhcp: bump to version 4.1-ESV-R12
Message-ID: <20151019202704.9ED948010A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=94c76a6df0c9bce3576413c07bbe4a3d3751859c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dhcp/dhcp.hash |    4 ++--
 package/dhcp/dhcp.mk   |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/dhcp/dhcp.hash b/package/dhcp/dhcp.hash
index d488004..84e3c63 100644
--- a/package/dhcp/dhcp.hash
+++ b/package/dhcp/dhcp.hash
@@ -1,2 +1,2 @@
-# Verified from ftp://ftp.isc.org/isc/dhcp/4.1-ESV-R11/dhcp-4.1-ESV-R11.tar.gz.sha256.asc
-sha256	b643d11a50fba66bb1c118f47642eb3fac1e26989d3c0bf8a2471e83c06ac485	dhcp-4.1-ESV-R11.tar.gz
+# Verified from ftp://ftp.isc.org/isc/dhcp/4.1-ESV-R12/dhcp-4.1-ESV-R12.tar.gz.sha256.asc
+sha256	53265d1bf5e2073379df03c73a1a34d38a904307609c0f9cb77223912e753e5f	dhcp-4.1-ESV-R12.tar.gz
diff --git a/package/dhcp/dhcp.mk b/package/dhcp/dhcp.mk
index effcbe2..c05e694 100644
--- a/package/dhcp/dhcp.mk
+++ b/package/dhcp/dhcp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DHCP_VERSION = 4.1-ESV-R11
+DHCP_VERSION = 4.1-ESV-R12
 DHCP_SITE = http://ftp.isc.org/isc/dhcp/$(DHCP_VERSION)
 DHCP_INSTALL_STAGING = YES
 DHCP_LICENSE = ISC
