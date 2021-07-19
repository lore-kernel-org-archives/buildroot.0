From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 19 Jul 2021 08:48:37 +0200
Subject: [Buildroot] [PATCH 1/1] package/haproxy: bump to version 2.4.2
Message-ID: <20210719064837.3450162-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

http://git.haproxy.org/?p=haproxy-2.4.git;a=blob;f=CHANGELOG

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/haproxy/haproxy.hash | 4 ++--
 package/haproxy/haproxy.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/haproxy/haproxy.hash b/package/haproxy/haproxy.hash
index 66a6f40bda..849d362dc0 100644
--- a/package/haproxy/haproxy.hash
+++ b/package/haproxy/haproxy.hash
@@ -1,5 +1,5 @@
-# From: http://www.haproxy.org/download/2.2/src/haproxy-2.2.14.tar.gz.sha256
-sha256  6a9b702f04b07786f3e5878de8172a727acfdfdbc1cefe1c7a438df372f2fb61  haproxy-2.2.14.tar.gz
+# From: http://www.haproxy.org/download/2.4/src/haproxy-2.4.2.tar.gz.sha256
+sha256  edf9788f7f3411498e3d7b21777036b4dc14183e95c8e2ce7577baa0ea4ea2aa  haproxy-2.4.2.tar.gz
 # Locally computed:
 sha256  0717ca51fceaa25ac9e5ccc62e0c727dcf27796057201fb5fded56a25ff6ca28  LICENSE
 sha256  5df07007198989c622f5d41de8d703e7bef3d0e79d62e24332ee739a452af62a  doc/lgpl.txt
diff --git a/package/haproxy/haproxy.mk b/package/haproxy/haproxy.mk
index 768c0e2895..be3d4dbb5d 100644
--- a/package/haproxy/haproxy.mk
+++ b/package/haproxy/haproxy.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-HAPROXY_VERSION_MAJOR = 2.2
-HAPROXY_VERSION = $(HAPROXY_VERSION_MAJOR).14
+HAPROXY_VERSION_MAJOR = 2.4
+HAPROXY_VERSION = $(HAPROXY_VERSION_MAJOR).2
 HAPROXY_SITE = http://www.haproxy.org/download/$(HAPROXY_VERSION_MAJOR)/src
 HAPROXY_LICENSE = GPL-2.0+ and LGPL-2.1+ with exceptions
 HAPROXY_LICENSE_FILES = LICENSE doc/lgpl.txt doc/gpl.txt
-- 
2.30.2
