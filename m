From: Axel Lin <axel.lin@ingics.com>
Date: Thu, 26 Dec 2013 10:51:27 +0800
Subject: [Buildroot] [PATCH] tzdata/zic: bump to version 2013i
Message-ID: <1388026287.4254.1.camel@phoenix>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
 package/tzdata/tzdata.mk | 2 +-
 package/zic/zic.mk       | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/tzdata/tzdata.mk b/package/tzdata/tzdata.mk
index 9109e2a..1cb5b3f 100644
--- a/package/tzdata/tzdata.mk
+++ b/package/tzdata/tzdata.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TZDATA_VERSION = 2013h
+TZDATA_VERSION = 2013i
 TZDATA_SOURCE = tzdata$(TZDATA_VERSION).tar.gz
 TZDATA_SITE = ftp://ftp.iana.org/tz/releases
 TZDATA_DEPENDENCIES = host-zic
diff --git a/package/zic/zic.mk b/package/zic/zic.mk
index 780643b..c9b6c7b 100644
--- a/package/zic/zic.mk
+++ b/package/zic/zic.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ZIC_VERSION = 2013h
+ZIC_VERSION = 2013i
 ZIC_SOURCE = tzcode$(ZIC_VERSION).tar.gz
 ZIC_SITE = ftp://ftp.iana.org/tz/releases
 ZIC_LICENSE = Public domain
-- 
1.8.1.2
