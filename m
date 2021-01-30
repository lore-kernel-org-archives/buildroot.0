From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 30 Jan 2021 17:35:28 +0100
Subject: [Buildroot] [PATCH 1/1] package/haproxy: bump to version 2.2.8
Message-ID: <20210130163528.2387762-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://www.mail-archive.com/haproxy at formilux.org/msg39408.html
https://www.mail-archive.com/haproxy at formilux.org/msg39470.html

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/haproxy/haproxy.hash | 4 ++--
 package/haproxy/haproxy.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/haproxy/haproxy.hash b/package/haproxy/haproxy.hash
index fbbd2e4bab..0e293e8545 100644
--- a/package/haproxy/haproxy.hash
+++ b/package/haproxy/haproxy.hash
@@ -1,5 +1,5 @@
-# From: http://www.haproxy.org/download/2.2/src/haproxy-2.2.6.tar.gz.sha256
-sha256  be1c6754cbaceafc4837e0c6036c7f81027a3992516435cbbbc5dc749bf5a087  haproxy-2.2.6.tar.gz
+# From: http://www.haproxy.org/download/2.2/src/haproxy-2.2.8.tar.gz.sha256
+sha256  61f90e3e2a36bd8800a5bee31cba7eef37c9aa8a353b6c741edaa411510b14be  haproxy-2.2.8.tar.gz
 # Locally computed:
 sha256  0717ca51fceaa25ac9e5ccc62e0c727dcf27796057201fb5fded56a25ff6ca28  LICENSE
 sha256  5df07007198989c622f5d41de8d703e7bef3d0e79d62e24332ee739a452af62a  doc/lgpl.txt
diff --git a/package/haproxy/haproxy.mk b/package/haproxy/haproxy.mk
index 42943effbc..7c05decf2f 100644
--- a/package/haproxy/haproxy.mk
+++ b/package/haproxy/haproxy.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 HAPROXY_VERSION_MAJOR = 2.2
-HAPROXY_VERSION = $(HAPROXY_VERSION_MAJOR).6
+HAPROXY_VERSION = $(HAPROXY_VERSION_MAJOR).8
 HAPROXY_SITE = http://www.haproxy.org/download/$(HAPROXY_VERSION_MAJOR)/src
 HAPROXY_LICENSE = GPL-2.0+ and LGPL-2.1+ with exceptions
 HAPROXY_LICENSE_FILES = LICENSE doc/lgpl.txt doc/gpl.txt
-- 
2.29.2
