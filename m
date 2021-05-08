From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat,  8 May 2021 09:39:44 +0200
Subject: [Buildroot] [PATCH 1/1] package/haproxy: bump to version 2.2.14
Message-ID: <20210508073944.2998533-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

http://www.haproxy.org/download/2.2/src/CHANGELOG

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/haproxy/haproxy.hash | 4 ++--
 package/haproxy/haproxy.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/haproxy/haproxy.hash b/package/haproxy/haproxy.hash
index bea7c4bb2a..66a6f40bda 100644
--- a/package/haproxy/haproxy.hash
+++ b/package/haproxy/haproxy.hash
@@ -1,5 +1,5 @@
-# From: http://www.haproxy.org/download/2.2/src/haproxy-2.2.13.tar.gz.sha256
-sha256  9e3e51441c70bedfb494fc9d4b4d3389a71be9a3c915ba3d6f7e8fd9a57ce160  haproxy-2.2.13.tar.gz
+# From: http://www.haproxy.org/download/2.2/src/haproxy-2.2.14.tar.gz.sha256
+sha256  6a9b702f04b07786f3e5878de8172a727acfdfdbc1cefe1c7a438df372f2fb61  haproxy-2.2.14.tar.gz
 # Locally computed:
 sha256  0717ca51fceaa25ac9e5ccc62e0c727dcf27796057201fb5fded56a25ff6ca28  LICENSE
 sha256  5df07007198989c622f5d41de8d703e7bef3d0e79d62e24332ee739a452af62a  doc/lgpl.txt
diff --git a/package/haproxy/haproxy.mk b/package/haproxy/haproxy.mk
index 8502ab8a11..6254819a9b 100644
--- a/package/haproxy/haproxy.mk
+++ b/package/haproxy/haproxy.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 HAPROXY_VERSION_MAJOR = 2.2
-HAPROXY_VERSION = $(HAPROXY_VERSION_MAJOR).13
+HAPROXY_VERSION = $(HAPROXY_VERSION_MAJOR).14
 HAPROXY_SITE = http://www.haproxy.org/download/$(HAPROXY_VERSION_MAJOR)/src
 HAPROXY_LICENSE = GPL-2.0+ and LGPL-2.1+ with exceptions
 HAPROXY_LICENSE_FILES = LICENSE doc/lgpl.txt doc/gpl.txt
-- 
2.30.2
