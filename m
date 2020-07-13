From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 13 Jul 2020 18:20:24 +0200
Subject: [Buildroot] [PATCH 1/1] package/haproxy: bump to version 2.2.0
Message-ID: <20200713162024.1352570-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is the new LTS branch (EOL in 2025-Q2)

https://www.mail-archive.com/haproxy at formilux.org/msg37852.html

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/haproxy/haproxy.hash | 4 ++--
 package/haproxy/haproxy.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/haproxy/haproxy.hash b/package/haproxy/haproxy.hash
index b89bda834b..4d880ef653 100644
--- a/package/haproxy/haproxy.hash
+++ b/package/haproxy/haproxy.hash
@@ -1,5 +1,5 @@
-# From: http://www.haproxy.org/download/2.1/src/haproxy-2.1.4.tar.gz.sha256
-sha256  51030ff696d7067162b4d24d354044293aecfbb36d7acc2f840c8d928bfe91cd  haproxy-2.1.4.tar.gz
+# From: http://www.haproxy.org/download/2.2/src/haproxy-2.2.0.tar.gz.sha256
+sha256  3c1a87160eea40e067f1e2813bfe692280a10c455beb17a8ee7fae11e4223274  haproxy-2.2.0.tar.gz
 # Locally computed:
 sha256  0717ca51fceaa25ac9e5ccc62e0c727dcf27796057201fb5fded56a25ff6ca28  LICENSE
 sha256  5df07007198989c622f5d41de8d703e7bef3d0e79d62e24332ee739a452af62a  doc/lgpl.txt
diff --git a/package/haproxy/haproxy.mk b/package/haproxy/haproxy.mk
index e59896b485..6f97840f6d 100644
--- a/package/haproxy/haproxy.mk
+++ b/package/haproxy/haproxy.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-HAPROXY_VERSION_MAJOR = 2.1
-HAPROXY_VERSION = $(HAPROXY_VERSION_MAJOR).4
+HAPROXY_VERSION_MAJOR = 2.2
+HAPROXY_VERSION = $(HAPROXY_VERSION_MAJOR).0
 HAPROXY_SITE = http://www.haproxy.org/download/$(HAPROXY_VERSION_MAJOR)/src
 HAPROXY_LICENSE = GPL-2.0+ and LGPL-2.1+ with exceptions
 HAPROXY_LICENSE_FILES = LICENSE doc/lgpl.txt doc/gpl.txt
-- 
2.27.0
