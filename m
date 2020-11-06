From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri,  6 Nov 2020 21:47:26 +0100
Subject: [Buildroot] [PATCH 1/1] package/haproxy: bump to version 2.2.5
Message-ID: <20201106204726.277257-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://www.mail-archive.com/haproxy at formilux.org/msg38809.html

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/haproxy/haproxy.hash | 4 ++--
 package/haproxy/haproxy.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/haproxy/haproxy.hash b/package/haproxy/haproxy.hash
index a127af9195..25975cb2ff 100644
--- a/package/haproxy/haproxy.hash
+++ b/package/haproxy/haproxy.hash
@@ -1,5 +1,5 @@
-# From: http://www.haproxy.org/download/2.2/src/haproxy-2.2.4.tar.gz.sha256
-sha256  87a4d9d4ff8dc3094cb61bbed4a8eed2c40b5ac47b9604daebaf036d7b541be2  haproxy-2.2.4.tar.gz
+# From: http://www.haproxy.org/download/2.2/src/haproxy-2.2.5.tar.gz.sha256
+sha256  87a4d9d4ff8dc3094cb61bbed4a8eed2c40b5ac47b9604daebaf036d7b541be2  haproxy-2.2.5.tar.gz
 # Locally computed:
 sha256  0717ca51fceaa25ac9e5ccc62e0c727dcf27796057201fb5fded56a25ff6ca28  LICENSE
 sha256  5df07007198989c622f5d41de8d703e7bef3d0e79d62e24332ee739a452af62a  doc/lgpl.txt
diff --git a/package/haproxy/haproxy.mk b/package/haproxy/haproxy.mk
index 70ff997fbe..1912a219e1 100644
--- a/package/haproxy/haproxy.mk
+++ b/package/haproxy/haproxy.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 HAPROXY_VERSION_MAJOR = 2.2
-HAPROXY_VERSION = $(HAPROXY_VERSION_MAJOR).4
+HAPROXY_VERSION = $(HAPROXY_VERSION_MAJOR).5
 HAPROXY_SITE = http://www.haproxy.org/download/$(HAPROXY_VERSION_MAJOR)/src
 HAPROXY_LICENSE = GPL-2.0+ and LGPL-2.1+ with exceptions
 HAPROXY_LICENSE_FILES = LICENSE doc/lgpl.txt doc/gpl.txt
-- 
2.28.0
