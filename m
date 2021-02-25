From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 25 Feb 2021 20:21:40 +0100
Subject: [Buildroot] [git commit branch/next] package/daemon: bump to
 version 0.7.1
Message-ID: <20210225185934.3E940864A8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8b2934e0aeea5e071d54e7b88c971690ef737f80
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Add COPYING to _LICENSE_FILES.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/daemon/daemon.hash | 4 +++-
 package/daemon/daemon.mk   | 4 ++--
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/daemon/daemon.hash b/package/daemon/daemon.hash
index b1c1dcdc2c..ec7451a81e 100644
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
index f3a1917fad..91f77dd24a 100644
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
