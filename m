From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 14 Apr 2020 18:36:31 +0200
Subject: [Buildroot] [PATCH 1/1] package/check: bump version to 0.14.0
Message-ID: <20200414163631.344155-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Release notes: https://github.com/libcheck/check/releases/tag/0.14.0

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/check/check.hash | 2 +-
 package/check/check.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/check/check.hash b/package/check/check.hash
index 291b5d095e..52839a68b4 100644
--- a/package/check/check.hash
+++ b/package/check/check.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256	c4336b31447acc7e3266854f73ec188cdb15554d0edd44739631da174a569909	check-0.13.0.tar.gz
+sha256	bd0f0ca1be65b70238b32f8e9fe5d36dc2fbf7a759b7edf28e75323a7d74f30b	check-0.14.0.tar.gz
 # License files, locally calculated
 sha256	a9bdde5616ecdd1e980b44f360600ee8783b1f99b8cc83a2beb163a0a390e861	COPYING.LESSER
diff --git a/package/check/check.mk b/package/check/check.mk
index b02136dcb2..6bec07adbd 100644
--- a/package/check/check.mk
+++ b/package/check/check.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CHECK_VERSION = 0.13.0
+CHECK_VERSION = 0.14.0
 CHECK_SITE = https://github.com/libcheck/check/releases/download/$(CHECK_VERSION)
 CHECK_INSTALL_STAGING = YES
 CHECK_DEPENDENCIES = host-pkgconf
-- 
2.25.0
