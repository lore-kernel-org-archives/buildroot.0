From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 22 Dec 2020 19:24:26 +0100
Subject: [Buildroot] [PATCH-2020.02.x] package/haproxy: bump to version
 2.1.10
Message-ID: <20201222182426.18251-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes a large number of issues.  For details, see the changelog:
https://www.haproxy.org/download/2.1/src/CHANGELOG

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/haproxy/haproxy.hash | 4 ++--
 package/haproxy/haproxy.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/haproxy/haproxy.hash b/package/haproxy/haproxy.hash
index b89bda834b..bfebee3286 100644
--- a/package/haproxy/haproxy.hash
+++ b/package/haproxy/haproxy.hash
@@ -1,5 +1,5 @@
-# From: http://www.haproxy.org/download/2.1/src/haproxy-2.1.4.tar.gz.sha256
-sha256  51030ff696d7067162b4d24d354044293aecfbb36d7acc2f840c8d928bfe91cd  haproxy-2.1.4.tar.gz
+# From: http://www.haproxy.org/download/2.1/src/haproxy-2.1.10.tar.gz.sha256
+sha256  d245a06145d1d0cbe62681de84bc23dfc98afe10f8cc5c1422a447722a142a41  haproxy-2.1.10.tar.gz
 # Locally computed:
 sha256  0717ca51fceaa25ac9e5ccc62e0c727dcf27796057201fb5fded56a25ff6ca28  LICENSE
 sha256  5df07007198989c622f5d41de8d703e7bef3d0e79d62e24332ee739a452af62a  doc/lgpl.txt
diff --git a/package/haproxy/haproxy.mk b/package/haproxy/haproxy.mk
index e59896b485..92f409d36c 100644
--- a/package/haproxy/haproxy.mk
+++ b/package/haproxy/haproxy.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 HAPROXY_VERSION_MAJOR = 2.1
-HAPROXY_VERSION = $(HAPROXY_VERSION_MAJOR).4
+HAPROXY_VERSION = $(HAPROXY_VERSION_MAJOR).10
 HAPROXY_SITE = http://www.haproxy.org/download/$(HAPROXY_VERSION_MAJOR)/src
 HAPROXY_LICENSE = GPL-2.0+ and LGPL-2.1+ with exceptions
 HAPROXY_LICENSE_FILES = LICENSE doc/lgpl.txt doc/gpl.txt
-- 
2.20.1
