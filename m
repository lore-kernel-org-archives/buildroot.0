From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 27 Oct 2019 10:02:20 +0100
Subject: [Buildroot] [PATCH 1/1] package/check: bump version to 0.13.0
Message-ID: <20191027090220.29658-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Release notes: https://github.com/libcheck/check/releases

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/check/check.hash | 2 +-
 package/check/check.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/check/check.hash b/package/check/check.hash
index ac7fddd462..291b5d095e 100644
--- a/package/check/check.hash
+++ b/package/check/check.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256	464201098bee00e90f5c4bdfa94a5d3ead8d641f9025b560a27755a83b824234	check-0.12.0.tar.gz
+sha256	c4336b31447acc7e3266854f73ec188cdb15554d0edd44739631da174a569909	check-0.13.0.tar.gz
 # License files, locally calculated
 sha256	a9bdde5616ecdd1e980b44f360600ee8783b1f99b8cc83a2beb163a0a390e861	COPYING.LESSER
diff --git a/package/check/check.mk b/package/check/check.mk
index 84b8c5333e..b02136dcb2 100644
--- a/package/check/check.mk
+++ b/package/check/check.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CHECK_VERSION = 0.12.0
+CHECK_VERSION = 0.13.0
 CHECK_SITE = https://github.com/libcheck/check/releases/download/$(CHECK_VERSION)
 CHECK_INSTALL_STAGING = YES
 CHECK_DEPENDENCIES = host-pkgconf
-- 
2.20.1
