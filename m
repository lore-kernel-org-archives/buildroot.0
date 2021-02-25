From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 25 Feb 2021 08:48:48 +0200
Subject: [Buildroot] [PATCH next] package/daemon: bump to version 0.7.1
Message-ID: <7a934090201ce89422608b7b1c7b50c303b68595.1614235728.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add COPYING to _LICENSE_FILES.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/daemon/daemon.hash | 4 +++-
 package/daemon/daemon.mk   | 4 ++--
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/daemon/daemon.hash b/package/daemon/daemon.hash
index b1c1dcdc2c5d..ec7451a81ec1 100644
--- a/package/daemon/daemon.hash
+++ b/package/daemon/daemon.hash
@@ -1,3 +1,5 @@
 # From http://www.libslack.org/daemon/
-sha256  f66af2ece784c16dcb5219de1f4fa3ae5787bb3374e44bd4b1d3e275e8ff272c  daemon-0.7.tar.gz
+sha256  ba1f6dc87532c852bfb8f436179cd661c3458ff898f67767c414123198626dfd  daemon-0.7.1.tar.gz
+# Locally calculated
 sha256  204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994  LICENSE
+sha256  cbac6eb0e1f7f95826966c7903939d591092a7f7d7726862946cb49096e8497d  COPYING
diff --git a/package/daemon/daemon.mk b/package/daemon/daemon.mk
index f3a1917fadc1..91f77dd24a97 100644
--- a/package/daemon/daemon.mk
+++ b/package/daemon/daemon.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-DAEMON_VERSION = 0.7
+DAEMON_VERSION = 0.7.1
 DAEMON_SITE = http://libslack.org/daemon/download
 DAEMON_LICENSE = GPL-2.0+
-DAEMON_LICENSE_FILES = LICENSE
+DAEMON_LICENSE_FILES = LICENSE COPYING
 
 define DAEMON_CONFIGURE_CMDS
 	(cd $(@D); ./configure)
-- 
2.30.0
