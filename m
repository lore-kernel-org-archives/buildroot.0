From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 8 Sep 2016 08:49:36 +0200
Subject: [Buildroot] [git commit] cifs-utils: bump to version 6.6
Message-ID: <20160908065108.A677B81D55@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d8983d0c7604681577c7641c1fb198a7095ef037
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/cifs-utils/cifs-utils.hash | 2 +-
 package/cifs-utils/cifs-utils.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/cifs-utils/cifs-utils.hash b/package/cifs-utils/cifs-utils.hash
index c49ced4..61ffbd9 100644
--- a/package/cifs-utils/cifs-utils.hash
+++ b/package/cifs-utils/cifs-utils.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	e2776578b8267c6dc0862897f5e10f87f10f8337fca9ca6a9118f5eb30cf49f7	cifs-utils-6.5.tar.bz2
+sha256	d07152a807de6840566bbcc69a97ff6fa17fca4e09ceb4641d74882a83e67125	cifs-utils-6.6.tar.bz2
diff --git a/package/cifs-utils/cifs-utils.mk b/package/cifs-utils/cifs-utils.mk
index 6cd45e0..fdb1779 100644
--- a/package/cifs-utils/cifs-utils.mk
+++ b/package/cifs-utils/cifs-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CIFS_UTILS_VERSION = 6.5
+CIFS_UTILS_VERSION = 6.6
 CIFS_UTILS_SOURCE = cifs-utils-$(CIFS_UTILS_VERSION).tar.bz2
 CIFS_UTILS_SITE = http://ftp.samba.org/pub/linux-cifs/cifs-utils
 CIFS_UTILS_LICENSE = GPLv3+
