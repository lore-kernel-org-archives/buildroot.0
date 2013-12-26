From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 26 Dec 2013 18:48:31 +0100
Subject: [Buildroot] [git commit] tzdata/zic: bump to version 2013i
Message-ID: <20131226175122.3E8009BBF9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a2a9613d2df2df30022c84ad985cfafe7059a6a2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Axel Lin <axel.lin@ingics.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/tzdata/tzdata.mk |    2 +-
 package/zic/zic.mk       |    2 +-
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
