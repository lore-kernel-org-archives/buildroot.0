From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed,  7 Sep 2016 23:00:18 -0300
Subject: [Buildroot] [PATCH] cifs-utils: bump to version 6.6
Message-ID: <1473300018-9532-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
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
-- 
2.7.3
